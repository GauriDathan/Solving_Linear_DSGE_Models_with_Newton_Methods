%Description: 
%General: this file solves the Smets & Wouters model for the numerically problematic
%parameterisation
%Output: it produces a results file "First_run"

% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Authors: Alexander Meyer-Gohde, Johanna Saecker, 01/2024
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker


clear 

run_time_reps=1;
%newton_options.dynare_reduced_sylvester=1;
newton_options.sylvester_method="dlyap_stripped";%"dynare";%
%newton_options.convergence_tolerance=eps;
%newton_options.sylvester_method="slicot";
 newton_options.convergence_metric='reldiff';
newton_options.maximum_iterations=10000;
addpath('C:\dynare\5.1\matlab')
addpath('..\algorithm\')


dynare Smets_Wouters_2007_std noclearall  nograph nostrict
AMG_JS_Results(1,:)=[M_.nstatic, M_.nfwrd, M_.npred, M_.nboth, M_.nsfwrd, M_.nspred, M_.ndynamic];


[matrix_quadratic, jacobia_]=full_create_reduced_matrix_quadratic_from_dynare(M_,oo_);
   
total_time=[];  for jj=1:run_time_reps;tic;[dr,info] = dyn_first_order_solver(jacobia_,M_,oo_.dr,options_,0); total_time(jj)=toc;end;   AMG_JS_Results(2,1) = mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));   

 
 
ALPHA_ZS_dynare=[zeros(M_.endo_nbr,M_.nstatic) oo_.dr.ghx zeros(M_.endo_nbr,M_.nfwrd)];
X_dynare=ALPHA_ZS_dynare;
matrix_quadratic.X=ALPHA_ZS_dynare;
AMG_JS_Results(2,6)=oo_.var(3,3);

newton_options.initial=oo_.dr.ghx(M_.nstatic+1:end,:);
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(2,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(2,3:5)=NaN(1,3);
end

try
 newton_options.algorithm='baseline';
 newton_options.M_=M_;
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(3,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(3,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(3,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(3,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(3,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(3,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(3,:)=NaN(1,7); 
end
catch
AMG_JS_Results(3,:)=NaN(1,7);
end

try
 newton_options.algorithm='modified';
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(4,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(4,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(4,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(4,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(4,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(4,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(4,:)=NaN(1,7); 
end
catch
AMG_JS_Results(4,:)=NaN(1,7);
end

try
 newton_options.algorithm='samanskii';
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(5,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(5,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(5,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(5,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(5,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(5,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(5,:)=NaN(1,7); 
end
catch
AMG_JS_Results(5,:)=NaN(1,7);
end

try
 newton_options.algorithm='line_search';
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(6,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(6,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(6,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(6,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(6,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(6,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(6,:)=NaN(1,7); 
end
catch
AMG_JS_Results(6,:)=NaN(1,7);
end

try
 newton_options.algorithm='occ_line_search';
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(7,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(7,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(7,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(7,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(7,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(7,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(7,:)=NaN(1,7); 
end
catch
AMG_JS_Results(7,:)=NaN(1,7);
end


try
 newton_options.algorithm='occ_line_search_samanskii';
 total_time=[]; for jj=1:run_time_reps;tic;[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); matrix_quadratic.X=X; [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);total_time(jj)=toc;end;   
AMG_JS_Results(8,1) =mean(total_time(ceil(length(total_time)*.2):ceil(length(total_time)*.8)));  
if max(max(isnan(matrix_quadratic.X)))==0; AMG_JS_Results(8,2)=max(max(abs(X_dynare-matrix_quadratic.X)));end
AMG_JS_Results(8,end)=X_additional;
oo.dr=oo_.dr;
oo.dr.ghu=[matrix_quadratic.B_full(:,1:M_.nstatic) [matrix_quadratic.A_static; matrix_quadratic.AA]*X(M_.npred+1:end,1:M_.nspred)+matrix_quadratic.B_full(:,M_.nstatic+1:end-M_.nfwrd) matrix_quadratic.B_full(:,end-M_.nfwrd+1:end)]; oo.dr.ghu=-oo.dr.ghu\matrix_quadratic.D; %oo.dr.ghu=-(matrix_quadratic.A_full*matrix_quadratic.X+matrix_quadratic.B_full)\matrix_quadratic.D;
oo.dr.ghx=matrix_quadratic.X(:,M_.nstatic+1:end-M_.nfwrd);
oo.dr.gx=oo.dr.ghx(end-M_.nfwrd+1:end,:);
oo= disp_th_moments(oo.dr, var_list, M_, options_, oo);
AMG_JS_Results(8,6)=oo.var(3,3);
oo_newton=oo;
try
[errors] = dsge_practical_forward_errors(matrix_quadratic);
AMG_JS_Results(8,3:5)=errors([4,7,8],1)';
catch
AMG_JS_Results(8,3:5)=NaN(1,3);
end
if X_additional==newton_options.maximum_iterations; 
AMG_JS_Results(8,:)=NaN(1,7); 
end
catch
AMG_JS_Results(8,:)=NaN(1,7);
end

save First_run


