%DHM test
%
% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Authors: Alexander Meyer-Gohde, Johanna Saecker, 25/01/2024
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

clear

newton_options.sylvester_method="dlyap_stripped";
newton_options.maximum_iterations=50;
addpath('C:\dynare\5.1\matlab')
addpath('..\algorithm\')


%% find A, B, C, D, P_guess

dynare US_SW07_rep_SMG noclearall nograph nostrict
%dynare example1 noclearall nograph nostrict

%create reduced derivatives matrices A,B,C,D from the dynare solution
[matrix_quadratic, jacobia_]=create_reduced_matrix_quadratic_from_dynare_and_d(M_,oo_);


%this is the P-matrix solvent
ALPHA_ZS_dynare=[zeros(M_.endo_nbr,M_.nstatic) oo_.dr.ghx zeros(M_.endo_nbr,M_.nfwrd)];
X_dynare=ALPHA_ZS_dynare;
matrix_quadratic.X=ALPHA_ZS_dynare;



%% loop through Newtons 

newton_options.initial=oo_.dr.ghx(M_.nstatic+1:end,:);
%use dynare as initial guess

%run dhm how often?
N=1000;
T=100500;
dhm_results=-999*ones(2,N,6);

K_vec={'Dynare','baseline','modified','samanskii','line_search','occ_line_search','occ_line_search_samanskii'};

%loop through Newton algorithms (third dimension)
for k=1:7
k=1;
if k>1
newton_options.algorithm=K_vec(k);

%solve for the P-matrix here
[X,X_additional] = newton_matrix_quadratic(matrix_quadratic,newton_options); 
%this is the P-matrix solvent
matrix_quadratic.X=X; 
[matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic);
end


%% calculate statistic

A=matrix_quadratic.A_full;
B=matrix_quadratic.B_full;
C=matrix_quadratic.C_full;
D=matrix_quadratic.D;
P=matrix_quadratic.X;

AP_B=A*P+B;

Q=-AP_B\D;

%creating N simulations/draws
for j=1:N

%create solution vector path

y_solution=-999*ones(matrix_quadratic.endo_nbr,T);
rng(j);

%SW-model
%retrieve stdev of shocks from dynare output
stdev_shocks=sqrt(M_.Sigma_e);
for i=1:M_.exo_nbr
shocks(i,:)=normrnd(0,stdev_shocks(i,i),1,T);        %exo_nbrxT matrix
end


steady_state=oo_.steady_state;
y_solution(:,1)=zeros(size(steady_state));


%find y-vector for period i
for i=2:T
y_solution(:,i)=P*y_solution(:,i-1)+Q*shocks(:,i);
end
 


%test that the simulation looks correct
% g=figure;
% plot(1:3500,y_solution(2,1:3500));
% saveas(g,'var1.png')


%determine DHM-residual period i+1
slr=999*ones(matrix_quadratic.endo_nbr,T);

%calculate residual following WP Alex eq. (102)

for i=3:T
    slr(:,i) = A*Q*shocks(:,i) + (AP_B*P+C)*y_solution(:,i-2) + (AP_B*Q+D)*shocks(:,i-1);
    slr_alt(:,i) = A*y_solution(:,i) + B*y_solution(:,i-1)+C*y_solution(:,i-2) + D*shocks(:,i-1);
end



%% test statistic
% discard first 500
slr=slr_alt(:,501:T);

%remove rows of zeros in A
slr=slr(any(A,2),:);
neqs=size(slr,1);

state_select=[4 5 14 19 20 21 22];
y_solution_cut=y_solution(M_.nstatic+state_select,:);

ninst1=1;
ninst2=1+size(y_solution_cut,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%instrument constants vector
instr=ones(1,1);
%multiply both in Kronecker-fashion 
slr1=kron(slr,instr);
clear slr2

%instrument: y(t) (dynamically changing)
for i=2:size(slr,2)
slr2(:,i-1)=kron(slr(:,i),[1; y_solution_cut(:,i-1)]);
end


%mean over each row of slr (across time) -> row vector
MT1=mean(slr1');
MT2=mean(slr2');


MT2=mean(slr2')';
WT2=(slr2-MT2)*(slr2-MT2)'/size(slr2,2);


Z=slr2-MT2;
mT=ceil((T-500)^(1/3)*.75);
for jj = 1:mT

    % Compute sample autocovariance of order jj
    % NB: Need Zt and Zt-jj to be of the same dim.
    Z0   = Z(:,(1+jj):end); 
    Zlag = Z(:,1:(end-jj));
    PhiT = Z0*Zlag'/size(Z0,2);
    
    % Weights (Bartlett)
    wj = 1 - jj/(mT + 1);

    % Update long-run covariance matrix estimate
   WT2 = WT2 + wj*( PhiT + PhiT' );
end

TT = cholcov(WT2);
rank_WT2=size(TT,1);
[QQ RR]=qr(TT');

size(WT2);
df_2=rank(kron(A*Q,[Q(M_.nstatic+state_select,:)]))+rank(A*Q);       
if rank_WT2~=df_2
    disp([rank_WT2 df2])
end
inv_chol_MT2=RR\(QQ')*MT2;

MT1=mean(slr1')';
WT1=(slr1-MT1)*(slr1-MT1)'/size(slr1,2);

TT = cholcov(WT1);
rank_WT2=size(TT,1);
[QQ RR]=qr(TT');

size(WT1);
df_1=rank(A*Q);
if rank(WT1)~=df_1
    disp([rank(WT1) df1])
end
inv_chol_MT1=RR\(QQ')*MT1;

dhm_results(1,j,k)=size(slr1,2)*inv_chol_MT1'*inv_chol_MT1;
dhm_results(2,j,k)=size(slr2,2)*inv_chol_MT2'*inv_chol_MT2;


disp("algo, draws")
disp([k j])
end

end

save dhm_results_amg.mat dhm_results T neqs ninst1 ninst2 N df_1 df_2

