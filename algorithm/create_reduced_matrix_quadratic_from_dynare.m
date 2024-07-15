function [matrix_quadratic, jacobia_]=create_reduced_matrix_quadratic_from_dynare(M_,oo_)
% Returns the coefficients of the matrix quadratic from Dynare output
% A X^2 +B X +C=0
%
% INPUTS
%   M_                  [structure] A Dynare structure
%
%   oo_                 [structure] A Dynare structure
%
% OUTPUTS
%   jacobia_            [matrix]    The Jacobian matrix
%
%   matrix_quadratic    [structure] A structure containing the
%                                   matrices A, B, and C
%
% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Author: Alexander Meyer-Gohde, 25/09/2022
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% To connect to Dynare, code from several files in Dynare are included and
% modified.
%
% Copyright © 2001-2022 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <https://www.gnu.org/licenses/>.


klen = M_.maximum_lag + M_.maximum_lead + 1;
exo_simul = [repmat(oo_.exo_steady_state',klen,1) repmat(oo_.exo_det_steady_state',klen,1)];
iyv = M_.lead_lag_incidence';
iyv = iyv(:);
iyr0 = find(iyv) ;
it_ = M_.maximum_lag + 1 ;   
z = repmat(oo_.dr.ys,1,klen);


%compute the jacobian matrix
       jacobia_ = feval([M_.fname '.dynamic_g1'],NaN(sum(M_.dynamic_tmp_nbr), 1), z(iyr0),exo_simul,  M_.params, oo_.dr.ys, it_, true); 

                            


exo_nbr = M_.exo_nbr;
    maximum_lag = M_.maximum_endo_lag;
    kstate   = oo_.dr.kstate;
     nfwrd    = M_.nfwrd;       %++
    nboth    = M_.nboth;        %m
    npred    = M_.npred;        %--
    nstatic  = M_.nstatic;      %s
    ndynamic = M_.ndynamic;     %d
    nsfwrd   = M_.nsfwrd;       %+
    n        = M_.endo_nbr;     %total nr of endogenous variables

    k1 = 1:(npred+nboth);
    k2 = 1:(nfwrd+nboth);

    order_var = oo_.dr.order_var;
    nd = size(kstate,1);
    lead_lag_incidence = M_.lead_lag_incidence;
    nz = nnz(lead_lag_incidence);

    lead_id = find(lead_lag_incidence(maximum_lag+2,:));
    lead_idx = lead_lag_incidence(maximum_lag+2,lead_id);
    if maximum_lag
        lag_id = find(lead_lag_incidence(1,:));
        lag_idx = lead_lag_incidence(1,lag_id);
        static_id = find((lead_lag_incidence(1,:) == 0) & ...
                         (lead_lag_incidence(3,:) == 0));
    else
        lag_id = [];
        lag_idx = [];
        static_id = find(lead_lag_incidence(2,:)==0);
    end

    both_id = intersect(lead_id,lag_id);
    if maximum_lag
        no_both_lag_id = setdiff(lag_id,both_id);
    else
        no_both_lag_id = lag_id;
    end
    innovations_idx = nz+(1:exo_nbr);
    state_var  = [no_both_lag_id, both_id];

    index_c  = nonzeros(lead_lag_incidence(maximum_lag+1,:));             % Index of all endogenous variables present at time=t
    n_current = length(index_c);

    index_s  = npred+nboth+(1:nstatic);     % Index of all static
                                            % endogenous variables
                                            % present at time=t
    indexi_0 = npred+nboth;

    npred0 = nnz(lead_lag_incidence(maximum_lag+1,no_both_lag_id));
    index_0m = indexi_0+nstatic+(1:npred0);
    nfwrd0 = nnz(lead_lag_incidence(2,lead_id));
    index_0p = indexi_0+nstatic+npred0+(1:nfwrd0);
    index_m  = 1:(npred+nboth);
    index_p  = npred+nboth+n_current+(1:nfwrd+nboth);
    row_indx_de_1 = 1:ndynamic;
    row_indx_de_2 = ndynamic+(1:nboth);
    row_indx = nstatic+row_indx_de_1;
    index_d = [index_0m index_p];
    llx = lead_lag_incidence(:,order_var);
    index_d1 = [find(llx(maximum_lag+1,nstatic+(1:npred))), npred+nboth+(1:nsfwrd) ];
    index_d2 = npred+(1:nboth);

    index_e = [index_m index_0p];
    index_e1 = [1:npred+nboth, npred+nboth+find(llx(maximum_lag+1,nstatic+npred+(1: ...
                                                      nsfwrd)))];
    index_e2 = npred+nboth+(1:nboth);

    [junk,cols_b] = find(lead_lag_incidence(maximum_lag+1, order_var));

    reorder_jacobian_columns = [nonzeros(lead_lag_incidence(:,order_var)'); ...
                        nz+(1:exo_nbr)'];


aa= jacobia_(:,reorder_jacobian_columns);


if nstatic > 0
    [Q, ~] = qr(aa(:,index_s));
    aa = Q'*aa;
    %matrix_quadratic.Q=Q;
end


A = aa(:,index_m);  % Jacobain matrix for lagged endogeneous variables
B(:,cols_b) = aa(:,index_c);  % Jacobian matrix for contemporaneous endogeneous variables
C = aa(:,index_p);  % Jacobain matrix for lead endogeneous variables


matrix_quadratic.nstatic=nstatic;
matrix_quadratic.endo_nbr=n;
matrix_quadratic.nfwrd=nfwrd;


%allocate number of variable types into output structure
matrix_quadratic.nstatic=nstatic;
matrix_quadratic.nfwrd=nfwrd;
matrix_quadratic.npred=npred;
matrix_quadratic.nboth=nboth;
matrix_quadratic.nsfwrd=nsfwrd;
matrix_quadratic.nspred=npred + nboth;
matrix_quadratic.ndynamic=ndynamic;

matrix_quadratic.index_m=index_m;
matrix_quadratic.npred=npred;

%retrieve matrices A,B,C for static variables
if nstatic > 0
matrix_quadratic.A_static=C(1:nstatic,:);
matrix_quadratic.B_static=B(1:nstatic, 1:nstatic);
matrix_quadratic.B_rest=B(1:nstatic, nstatic+1:end);
matrix_quadratic.C_static=A(1:nstatic,:);
end

%retrieve matrices A,B,C for dynamic variables
matrix_quadratic.AA=C(nstatic+1:end,:);
matrix_quadratic.BB=B(nstatic+1:end,nstatic+1:end);
matrix_quadratic.CC=A(nstatic+1:end,:);

