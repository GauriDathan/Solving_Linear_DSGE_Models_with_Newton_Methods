function [matrix_quadratic]=complete_reduced_matrix_quadratic(matrix_quadratic)
% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Author: Alexander Meyer-Gohde, 01/2024
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

matrix_quadratic.X=matrix_quadratic.X(:,matrix_quadratic.index_m);
if matrix_quadratic.nstatic > 0
    temp = - matrix_quadratic.A_static*matrix_quadratic.X(matrix_quadratic.npred+1:end,:)*matrix_quadratic.X(matrix_quadratic.index_m,:);
    temp(:,matrix_quadratic.index_m) = temp(:,matrix_quadratic.index_m)-matrix_quadratic.C_static;
    temp = matrix_quadratic.B_static\(temp-matrix_quadratic.B_rest*matrix_quadratic.X(1:end,:));
    matrix_quadratic.X = [temp; matrix_quadratic.X];
    temp = [];
end
matrix_quadratic.X=[zeros(matrix_quadratic.endo_nbr,matrix_quadratic.nstatic) matrix_quadratic.X zeros(matrix_quadratic.endo_nbr,matrix_quadratic.nfwrd)];
