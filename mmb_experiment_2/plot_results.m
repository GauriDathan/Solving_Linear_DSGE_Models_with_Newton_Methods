% This file creates plots with computation time and forward errors for the
% mmb experiment with starting guess dynare solution
% Paper: table 3, figure 3

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

load('First_Run_AMG_JS_improvement_new.mat')

model_variable_number=sum(squeeze(AMG_JS_Results(1,1:4,:)));

%calculate relative times
times=squeeze(AMG_JS_Results(2:end,1,:));
iterations=squeeze(AMG_JS_Results(2:end,7,:)); 
iterations(1,:)=1;
rel_times=times./times(1,:);
%calculate absolute differences of solutions
diffs=squeeze(AMG_JS_Results(2:end,2,:));
diffs_select=0<diffs&diffs<1e-5;
diffs_select(1,:)=1;
%calculate forward error bounds
fe_1=squeeze(AMG_JS_Results(2:end,4,:));
rel_fe_1=fe_1./fe_1(1,:);
fe_2=squeeze(AMG_JS_Results(2:end,5,:));
rel_fe_2=fe_2./fe_2(1,:);


%Gather the results in a matrix (paper: table 3)
results(1:7,1)=sum(diffs_select')';
for j=1:7
results(j,2)=median(rel_times(j,diffs_select(j,:)));
results(j,3)=min(rel_times(j,diffs_select(j,:)));
results(j,4)=max(rel_times(j,diffs_select(j,:)));
results(j,5)=median(rel_fe_1(j,diffs_select(j,:)));
results(j,6)=min(rel_fe_1(j,diffs_select(j,:)));
results(j,7)=max(rel_fe_1(j,diffs_select(j,:)));
results(j,8)=median(rel_fe_2(j,diffs_select(j,:)));
results(j,9)=min(rel_fe_2(j,diffs_select(j,:)));
results(j,10)=max(rel_fe_2(j,diffs_select(j,:)));
results(j,11)=median(iterations(j,diffs_select(j,:)));
end

%Plot forward error bounds relative to dynare as scatter plot, all methods (paper: not shown)
figure
hold on
for j=2:7
scatter(log10(rel_fe_1(j,diffs_select(j,:))),log10(rel_times(j,diffs_select(j,:))),'filled')
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','southeast')
ylabel('Computation Time, Relative to Dynare, Log10')
xlabel('Forward Error Bound 1, Relative to Dynare, Log10')
%xlim([-2 2])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xline(0);
yline(0);
hold off

legends={'Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam'};


%Plot forward error bounds relative to dynare as scatter plot, each method, 
%regression line (paper: not shown)
for j=2:7
    hold on
    figure
scatter(log10(rel_fe_1(j,diffs_select(j,:))),log10(rel_times(j,diffs_select(j,:))),'filled')
legend(legends{j-1},'AutoUpdate','off','location','northeast')
%legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Search Samanskii','AutoUpdate','off','location','southeast')
ylabel('Computation Time, Relative to Dynare, Log10')
xlabel('Forward Error Bound 1, Relative to Dynare, Log10')
xlim([-4 8])
ylim([-1 3])
h=lsline;
h.Color = 'b';
h.LineStyle = '--';
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xline(0);
yline(0);
hold off
end

figure
hold on
for j=2:7
scatter(log10(rel_fe_2(j,diffs_select(j,:))),log10(rel_times(j,diffs_select(j,:))),'filled')
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','southeast')
ylabel('Computation Time, Relative to Dynare, Log10')
xlabel('Forward Error Bound 2, Relative to Dynare, Log10')
%xlim([-2 2])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xline(0);
yline(0);
hold off


for j=2:7
    hold on
    figure
scatter(log10(rel_fe_2(j,diffs_select(j,:))),log10(rel_times(j,diffs_select(j,:))),'filled');
legend(legends{j-1},'AutoUpdate','off','location','northeast')

%legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line Search','Occ. Line Sam','AutoUpdate','off','location','southeast')
ylabel('Computation Time, Relative to Dynare, Log10')
xlabel('Forward Error Bound 2, Relative to Dynare, Log10')
xlim([-6 6])
ylim([-1 3])
h=lsline;
h.Color = 'b';
h.LineStyle = '--';
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xline(0);
yline(0);
hold off
end

%Plot distribution of forward error bounds relative to dynare (paper: figure 3)
figure
hold on
for j=1:7
    [y,x]=ksdensity(log10(fe_1(j,diffs_select(j,:)))); plot(x,y,'LineWidth',2)
end
legend('Dynare','Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','northeast')
ylabel('Density')
xlabel('Forward Error Bound 1,  Log10')
xlim([-18 -7])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xl =xline(log10(eps),'-.','Machine Precision','LineWidth',2);
%xl.LabelVerticalAlignment = 'top';
xl.LabelHorizontalAlignment = 'left';
legend('show');
hold off

figure
hold on
for j=1:7
    [y,x]=ksdensity(log10(fe_2(j,diffs_select(j,:)))); plot(x,y,'LineWidth',2)
end
legend('Dynare','Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','northeast')
ylabel('Density')
xlabel('Forward Error Bound 2,  Log10')
xlim([-18 3])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xl =xline(log10(eps),'-.','Machine Precision','LineWidth',2);
%xl.LabelVerticalAlignment = 'top';
xl.LabelHorizontalAlignment = 'left';
legend('show');
hold off


figure
hold on
for j=2:7
    [y,x]=ksdensity(log10(rel_fe_1(j,diffs_select(j,:)))); plot(x,y,'LineWidth',2)
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','northwest')
ylabel('Density')
xlabel('Forward Error Bound 1, Relative to Dynare, Log10')
xlim([-5 1])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xl =xline(log10(1),'-.','LineWidth',2);
%xl.LabelVerticalAlignment = 'top';
%xl.LabelHorizontalAlignment = 'left';
%legend('show');
hold off

figure
hold on
for j=2:7
    [y,x]=ksdensity(log10(rel_fe_2(j,diffs_select(j,:)))); plot(x,y,'LineWidth',2)
end
legend('Baseline','Modified','Samanskii','Line Search', 'Occ. Line','Occ. Line Sam','AutoUpdate','off','location','northwest')
ylabel('Density')
xlabel('Forward Error Bound 2, Relative to Dynare, Log10')
xlim([-5 1])
%ylim([-2 2])
%set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
xl =xline(log10(1),'-.','LineWidth',2);
%xl.LabelVerticalAlignment = 'top';
%xl.LabelHorizontalAlignment = 'left';
%legend('show');
hold off

disp(compose('%1.2g',results))