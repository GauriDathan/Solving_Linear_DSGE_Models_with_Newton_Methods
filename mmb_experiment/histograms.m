%Description: 
%General: this file generates the histogram over the number of state
%variables, figure 2

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

load("First_Run_AMG_JS.mat")

categories=["0-10" "10-20" "20-50" "50-100" "100-700" "700-2400" "2400+"]
edges=[0 10 20 50 100 700 2400 3000];

%number of nspred variables
dist_nspred=histcounts(AMG_JS_Results(1,6,:),edges)
bar(categories,dist_nspred)
f = gca
f.FontSize=14
xlabel('Number of state variables','FontSize',15)
ylabel('Number of models','FontSize',15)
exportgraphics(f,'hist_nspred.jpg','Resolution',300)






