% Description: 
% General: This is the main file that runs the policy experiment with 
% the previous iteration's solution as starting guess for the Newton algorithms
% Output: it produces a 4-dimensional solution matrix 8x7xn_pixn_y 
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

%adjust step size in grid
STEPS=-1:0.25:8;

%the loop iterates through different grid sizes 
for KK=1:length(STEPS)

run_time_reps=1000;
step_size=STEPS(KK);
%newton_options.dynare_reduced_sylvester=1;
newton_options.sylvester_method="dlyap_stripped";
newton_options.maximum_iterations=50;
addpath('C:\dynare\5.1\matlab')
addpath('..\algorithm\')

%run dynare
dynare US_SW07_rep_SMG noclearall nograph nostrict

%parameter vectors for Taylor rule coeffients depending on grid width
CRPI_vector=linspace(1.5,1.5*(1+10^(-step_size)),10);
CRY_vector=linspace(0.125,0.125*(1+10^(-step_size)),10);
%create big results matrix
AMG_JS_Results=zeros(8,7,length(CRPI_vector),length(CRY_vector));

%save run times here
times=zeros(1,run_time_reps);

%the loop solves the model using Dynare + Newton methods iterating through
%the grid of parameter combinations JJ,II
for JJ=1:length(CRPI_vector)
    for II=1:length(CRY_vector)
         %adjust the paramter values in the dynare file
        set_param_value('crpi',CRPI_vector(JJ))
        set_param_value('cry',CRY_vector(II))
%choose starting guess for each of 6 Newton methods to be dynare's solution in the first
%iteration (JJ==1, II==1)
if JJ==1 && II==1
    X_0_1=oo_.dr.ghx(M_.nstatic+1:end,:);%zeros( M_.ndynamic,M_.nspred);
    X_0_2=X_0_1;
    X_0_3=X_0_1;
    X_0_4=X_0_1;
    X_0_5=X_0_1;
    X_0_6=X_0_1;
%choose starting guess for each following iteration equal to new starting 
%guess (in place when going along dimension II) 
elseif JJ~=1 && II==1
    X_0_1=X_0_1_begin;
    X_0_2=X_0_2_begin;
    X_0_3=X_0_3_begin;
    X_0_4=X_0_4_begin;
    X_0_5=X_0_5_begin;
    X_0_6=X_0_6_begin;
end

%solve full model with dynare
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, M_.endo_names);%steady;[dr_new, info, M, options, oo_new] = resol(0, M_, options_, oo_);

%store number of variables from each type
AMG_JS_Results(1,:,JJ,II)=[M_.nstatic, M_.nfwrd, M_.npred, M_.nboth, M_.nsfwrd, M_.nspred, M_.ndynamic];

%create reduced derivatives matrices A,B,C from the dynare solution
[matrix_quadratic, jacobia_]=create_reduced_matrix_quadratic_from_dynare(M_,oo_);

%tic; 
%[info, oo_, options_]  = stoch_simul(M_, options_, oo_, var_list_); toc    
%run dynare's solver for the reduced system and measure time 
for jj=1:run_time_reps;tic;
    [dr,info] = dyn_first_order_solver(jacobia_,M_,oo_.dr,options_,0); 
    total_time(jj)=toc;
end; 
%store run time
AMG_JS_Results(2,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));   
%this is the P-matrix solvent
ALPHA_ZS_dynare=[zeros(M_.endo_nbr,M_.nstatic) oo_.dr.ghx zeros(M_.endo_nbr,M_.nfwrd)];
X_dynare=ALPHA_ZS_dynare;
matrix_quadratic.X=ALPHA_ZS_dynare;
try
%calculate forward errors
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(2,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(2,3:5,JJ,II)=NaN(1,3);
end
 
%Baseline Newton algorithm
try
 newton_options.algorithm='baseline';
 newton_options.M_=M_;
 newton_options.initial=X_0_1;
 for jj=1:run_time_reps;tic;
      %solve for the P-matrix here
     [X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); 
      %this is the P-matrix solvent
     matrix_quadratic.X=X; 
     [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);
     total_time(jj)=toc;
 end;   
 %calculate time taken
 AMG_JS_Results(3,1,JJ,II) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(3,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(3,end,JJ,II)=X_additional;
%update guess matrix with solution found
X_0_1=X(:,1:M_.nspred);
try
%calculate forward errors
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(3,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(3,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(3,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(3,:,JJ,II)=NaN(1,7);
end

%Modified Newton algorithm
try
 newton_options.algorithm='modified';
 newton_options.initial=X_0_2;
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end; 
AMG_JS_Results(4,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(4,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(4,end,JJ,II)=X_additional;
X_0_2=X(:,1:M_.nspred);
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(4,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(4,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(4,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(4,:,JJ,II)=NaN(1,7);
end

%Algorithm with Samanskii technique
try
 newton_options.algorithm='samanskii';
 newton_options.initial=X_0_3;
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;
AMG_JS_Results(5,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(5,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(5,end,JJ,II)=X_additional;
X_0_3=X(:,1:M_.nspred);
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(5,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(5,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(5,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(5,:,JJ,II)=NaN(1,7);
end

%Newton algorithm with exact line searches
try
 newton_options.algorithm='line_search';
 newton_options.initial=X_0_4;
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic); total_time(jj)=toc;end; 
AMG_JS_Results(6,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));
AMG_JS_Results(6,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(6,end,JJ,II)=X_additional;
X_0_4=X(:,1:M_.nspred);
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(6,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(6,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(6,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(6,:,JJ,II)=NaN(1,7);
end

%Newton with occasional line searches
try
 newton_options.algorithm='occ_line_search';
 newton_options.initial=X_0_5;
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;  
AMG_JS_Results(7,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
AMG_JS_Results(7,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(7,end,JJ,II)=X_additional;
X_0_5=X(:,1:M_.nspred);
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(7,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(7,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(7,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(7,:,JJ,II)=NaN(1,7);
end

%Newton with occasional line searches and Samanskii Technique
try
 newton_options.algorithm='occ_line_search_samanskii';
 newton_options.initial=X_0_6;
 for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic); total_time(jj)=toc;end;   
AMG_JS_Results(8,1,JJ,II) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));
AMG_JS_Results(8,2,JJ,II)=max(max(abs(X_dynare-matrix_quadratic.X)));
AMG_JS_Results(8,end,JJ,II)=X_additional;
X_0_6=X(:,1:M_.nspred);
try
[errors] = dsge_practical_forward_errors_matrix_quadratic(matrix_quadratic);
AMG_JS_Results(8,3:5,JJ,II)=errors([4,7,8],1)';
catch
AMG_JS_Results(8,3:5,JJ,II)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(8,:,JJ,II)=NaN(1,7); 
end
catch
AMG_JS_Results(8,:,JJ,II)=NaN(1,7);
end

%re-set starting guess for each new iteration-step 
if  JJ==1
    X_0_1_begin=X_0_1;
     X_0_2_begin=X_0_2;
     X_0_3_begin=X_0_3;
    X_0_4_begin=X_0_4;
    X_0_5_begin=X_0_5;
    X_0_6_begin=X_0_6;
end


sprintf('Iteration %d and %d of %d and %d',JJ,II,length(CRPI_vector),length(CRY_vector))

    end
end
%takes median over all grid points for the characteristics of interest
%(e.g. run time,...)
results=median(AMG_JS_Results,4);
results=median(results,3);

%save results for each stepsize in cell array
total_AMG_JS_Results{KK}=AMG_JS_Results;
total_results{KK}=results;
end

%reorganize results in 3-dim matrix
combined_results=[];
for j=1:length(STEPS)
combined_results(:,:,j)=total_results{j};
end
save('Combined_Policy_Run.mat')