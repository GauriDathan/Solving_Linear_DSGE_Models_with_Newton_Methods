% Description: 
% General: This is the main file that runs the mmb experiment with Dynare's
% solution as starting guess for the Newton algorithms
% Output: it produces an 8x7x99 solution matrix with 
%   row1: number of variables of each type
%   column1: run time 
%   column2: difference of solution to Dynare
%   column3-5: forward errors
%   column7: number of iterations
%   rows2-8: Dynare + 6 Newton algorithms (row-wise)

% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Authors: Alexander Meyer-Gohde, Johanna Saecker, 01/2024
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.


clear 

run_time_reps=100;
%newton_options.dynare_reduced_sylvester=1;
%newton_options.sylvester_method="dlyap_stripped";

newton_options.sylvester_method="dlyap_stripped";
newton_options.maximum_iterations=100;
addpath('C:\dynare\5.1\matlab')
addpath('..\algorithm\')
addpath('..\mmb_replication\')
YourPath=pwd;
cd (YourPath)
addpath(pwd)

%create vector with names from MMB-models using text file
fileID = fopen('mmb_names.txt','r');
mmbline = fgetl(fileID);        
mmb_vec = cell(0,1);            
while ischar(mmbline)           
    mmb_vec{end+1,1} = mmbline; 
    mmbline = fgetl(fileID);    
end    
%amount of MMB models considered
loop_n=size(mmb_vec,1);

%create big results matrix
AMG_JS_Results=zeros(8,7,loop_n);

for loop_k=1:loop_n
    [loop_k loop_k/loop_n]
%change directory to folder path in MMB
%cd([YourPath '..\..\mmb_replication\mmb-rep-master_names\' mmb_vec{loop_k} '\' mmb_vec{loop_k} '_rep'])
cd([YourPath '..\..\mmb_replication\mmb-rep-master_names\' mmb_vec{loop_k}])
%Dynare
eval(['dynare ', mmb_vec{loop_k}, '_rep noclearall nograph nostrict'])
%store number of variables from each type
AMG_JS_Results(1,:,loop_k)=[M_.nstatic, M_.nfwrd, M_.npred, M_.nboth, M_.nsfwrd, M_.nspred, M_.ndynamic];

%create reduced derivatives matrices A,B,C from the dynare solution
[matrix_quadratic, jacobia_]=create_reduced_matrix_quadratic_from_dynare(M_,oo_);

%tic; [info, oo_, options_]  = stoch_simul(M_, options_, oo_, var_list_); toc    

%run dynare's solver for the reduced system and measure time
for jj=1:run_time_reps;tic;[dr,info] = dyn_first_order_solver(jacobia_,M_,oo_.dr,options_,0); 
    total_time(jj)=toc;
end;  
%store run time
AMG_JS_Results(2,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));   
%this is the P-matrix solvent 
ALPHA_ZS_dynare=[zeros(M_.endo_nbr,M_.nstatic) oo_.dr.ghx zeros(M_.endo_nbr,M_.nfwrd)];
X_dynare=ALPHA_ZS_dynare;
matrix_quadratic.X=ALPHA_ZS_dynare;
%use dynare's solution as initial guess
newton_options.initial=oo_.dr.ghx(M_.nstatic+1:end,:);
try
%calculate forward errors
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(2,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(2,3:5,loop_k)=NaN(1,3);
end

%Baseline Newton algorithm
try
 newton_options.algorithm='baseline';
 newton_options.M_=M_;
for jj=1:run_time_reps;tic;
    %solve for the P-matrix here
    [X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options);      
     %this is the P-matrix solvent   
    matrix_quadratic.X=X; 
    [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);
    total_time(jj)=toc;
end;   
%calculate time taken
AMG_JS_Results(3,1,loop_k) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(3,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(3,end,loop_k)=X_additional;
try
%calculate forward errors
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(3,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(3,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(3,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(3,:,loop_k)=NaN(1,7);
end

%Modified Newton algorithm
try
 newton_options.algorithm='modified';
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end; 
AMG_JS_Results(4,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(4,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(4,end,loop_k)=X_additional;
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(4,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(4,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(4,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(4,:,loop_k)=NaN(1,7);
end

%Algorithm with Samanskii technique
try
 newton_options.algorithm='samanskii';
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;
AMG_JS_Results(5,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(5,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(5,end,loop_k)=X_additional;
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(5,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(5,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(5,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(5,:,loop_k)=NaN(1,7);
end

%Newton algorithm with exact line searches
try
 newton_options.algorithm='line_search';
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic); total_time(jj)=toc;end; 
AMG_JS_Results(6,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));
AMG_JS_Results(6,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(6,end,loop_k)=X_additional;
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(6,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(6,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(6,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(6,:,loop_k)=NaN(1,7);
end

%Newton with occasional line searches
try
 newton_options.algorithm='occ_line_search';
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;  
AMG_JS_Results(7,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(7,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(7,end,loop_k)=X_additional;
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(7,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(7,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(7,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(7,:,loop_k)=NaN(1,7);
end

%Newton with occasional line searches and Samanskii Technique
try
 newton_options.algorithm='occ_line_search_samanskii';
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic); total_time(jj)=toc;end;   
AMG_JS_Results(8,1,loop_k) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));
AMG_JS_Results(8,2,loop_k)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(8,end,loop_k)=X_additional;
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(8,3:5,loop_k)=errors([4,7,8],1)';
catch
AMG_JS_Results(8,3:5,loop_k)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(8,:,loop_k)=NaN(1,7); 
end
catch
AMG_JS_Results(8,:,loop_k)=NaN(1,7);
end

cd([YourPath])

sprintf('Iteration %d of %d',loop_k,loop_n)
%save certain results
clearvars -except loop_k loop_n AMG_JS_Results YourPath mmb_vec run_time_reps newton_options
save First_Run_AMG_JS_improvement
end

