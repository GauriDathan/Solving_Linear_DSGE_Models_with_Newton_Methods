% Description:
% This file creates plots with forward errors and computation time relative
% to grid size
% Figure 1 in the paper shows a subset of these plots

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
load('Combined_Policy_Run.mat')
grid_size=STEPS;
grid_size=10.^grid_size;
figure
hold on
plot(log10(grid_size),(squeeze(combined_results(2,1,:))),'LineWidth',2)
for j=2:7
plot(log10(grid_size),(squeeze(combined_results(j+1,1,:))),'LineWidth',1)
end
legend('Dynare','Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam');%,'AutoUpdate','off','location','southeast')
ylabel('Computation Time per Grid Point, Seconds')
xlabel('Grid Size, Log10')


figure
hold on
for j=2:7
plot(log10(grid_size),log10(squeeze(combined_results(j+1,4,:))./squeeze(combined_results(2,4,:))),'LineWidth',1)
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam');%,'AutoUpdate','off','location','southeast')
ylabel('Forward Error Bound 1, Relative to Dynare, Log10')
xlabel('Grid Size, Log10')

figure
hold on
for j=2:7
plot(log10(grid_size),log10(squeeze(combined_results(j+1,5,:))./squeeze(combined_results(2,5,:))),'LineWidth',1)
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam');%,'AutoUpdate','off','location','southeast')
ylabel('Forward Error Bound 2, Relative to Dynare, Log10')
xlabel('Grid Size, Log10')

figure
hold on
plot(log10(grid_size),log10(squeeze(combined_results(2,4,:))),'LineWidth',2)
for j=2:7
plot(log10(grid_size),log10(squeeze(combined_results(j+1,4,:))),'LineWidth',1)
end
legend('Dynare','Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam');%,'AutoUpdate','off','location','southeast')
ylabel('Forward Error Bound 1,  Log10')
xlabel('Grid Size, Log10')

figure
hold on
plot(log10(grid_size),log10(squeeze(combined_results(2,5,:))),'LineWidth',2)
for j=2:7
plot(log10(grid_size),log10(squeeze(combined_results(j+1,5,:))),'LineWidth',1)
end
legend('Dynare','Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam');%,'AutoUpdate','off','location','southeast')
ylabel('Forward Error Bound 2,  Log10')
xlabel('Grid Size, Log10')