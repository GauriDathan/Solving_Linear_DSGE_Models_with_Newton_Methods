% This file displays the results from the policy experiment
% Paper: table 3

% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
% Authors: Alexander Meyer-Gohde, Johanna Saecker, 01/2024
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%

load('First_run.mat')
results=AMG_JS_Results;
table=[results(2,[1 6 4 5]) 1];
table=[table; [ results(3:end,1)./results(2,1) results(3:end,[ 6 4 5 7])]];
disp(compose('%1.2g',table))