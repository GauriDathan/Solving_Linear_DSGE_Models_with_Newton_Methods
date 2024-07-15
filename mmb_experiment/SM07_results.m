% This file creates the plot from analysing the SW07-model
% Paper: table 2

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

clear all
load('First_Run_AMG_JS.mat')
%pick the SW07 among all MMB model-results
results=AMG_JS_Results(:,:,97);
%create table
table=[results(2,[1 2 4 5]) 1];
table=[table; [ results(3:end,1)./results(2,1) results(3:end,[ 2 4 5 7])]]
disp(compose('%1.2g',table))