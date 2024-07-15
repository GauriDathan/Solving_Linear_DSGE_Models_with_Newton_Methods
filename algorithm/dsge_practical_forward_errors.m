function [results] = dsge_practical_forward_errors(inputs)
%Matrix quadratic backward errors and conditioning number 
%0=A*X^2+B*X+C
%X is the n by n solvent
%A, B, and C are n by n matrices
% ALGORITHMS
%   Meyer-Gohde, Alexander (2023). Numerical Stability Analysis of Linear 
%   DSGE Models - Backward Errors, Forward Errors and Condition Numbers
%
% Copyright (C) 2023 Alexander Meyer-Gohde
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
if inputs.nstatic>0
A=[inputs.A_static;inputs.AA];%sparse(inputs.A_full);
B=[inputs.B_static inputs.B_rest;zeros(inputs.ndynamic,inputs.nstatic) inputs.BB];%sparse(inputs.B_full);
C=[inputs.C_static;inputs.CC];%sparse(inputs.C_full);
else
    A=inputs.AA;
    B=inputs.BB;
    C=inputs.CC;
end
A=[zeros(inputs.endo_nbr,inputs.npred+inputs.nstatic) A];
C=[zeros(inputs.endo_nbr,inputs.nstatic) C zeros(inputs.endo_nbr,inputs.nfwrd)];
% matrix_quadratic.nstatic=nstatic;
% matrix_quadratic.endo_nbr=n;
% matrix_quadratic.nfwrd=nfwrd;
% matrix_quadratic.nstatic=nstatic;
% matrix_quadratic.nfwrd=nfwrd;
% matrix_quadratic.npred=npred;
% matrix_quadratic.nboth=nboth;
% matrix_quadratic.nsfwrd=nsfwrd;
% matrix_quadratic.nspred=npred + nboth;
% matrix_quadratic.ndynamic=ndynamic;
% 
%  A=matrix_quadratic.A_full=[zeros(n,npred+nstatic) A];
%  B=matrix_quadratic.B_full=B;
%  C=matrix_quadratic.C_full=[zeros(n,nstatic) C zeros(n,nfwrd)];
%ny=inputs.endo_nbr;
P=inputs.X;%sparse(inputs.X);
[ny,~]=size(P);
F=A*P+B;
results=NaN(8,5);
P_F=norm(P,'fro');



R_P=F*P+C;%A*P^2+B*P+C;
R_P_F=norm(R_P,'fro');



V=kron(eye(ny),F)+kron(P',A);
results(4,1)=1/min(svd(V));
[temp_P,~]=linsolve(V,R_P(:));
results(7,1)=norm(temp_P)/P_F;
results(8,1)=results(4,1)*(R_P_F/P_F); %CHECK



