%DHM test
%
% This file plots the results from the DHM test. Paper: appendix 6.6, figure 9, table 6 
%
% ALGORITHMS
%   Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE
%   MODELS WITH NEWTON METHODS, Economic Modelling. 
%
%
% Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.


filenames={'dhm_results_amg_T_500_complete','dhm_results_amg_T_1000_complete','dhm_results_amg_T_2000_complete','dhm_results_amg_T_5000_complete','dhm_results_amg_T_10_000_complete','dhm_results_amg_T_100_000_complete'};

for j=1:length(filenames)
    load(filenames{j})

    df=[df_1 df_2];
%instruments
for i=1:2
%compare against upper/lower cutoffs in chi-squared(x) distribution, where
%x=size of instrument-vector*number of variables
%see Den Haan & Marcet, RES, 1994, p.6

%determine distribution cutoffs
c05=icdf('chi2',0.05,df(i));
c95=icdf('chi2',0.95,df(i));
figure
hold on
    for k=1:7
%find both quantiles
%q=quantile(dhm_results(i,:,k),[0.05 0.95]);
upper=dhm_results(i,:,k)>c95;
%share of results in upper 5%
results_upper(i,k,j)=sum(upper)/N*100;
lower=dhm_results(i,:,k)<c05;
%share of results in lower 5%
results_lower(i,k,j)=sum(lower)/N*100;
[f,x] = ecdf(squeeze(dhm_results(i,:,k)));
plot(x,f)
    end
plot(x,chi2cdf(x,df(i)),'k')
    hold off
end
end



figure
hold on
for j=1:length(filenames)
    load(filenames{j})
[f,x] = ecdf(squeeze(dhm_results(2,:,1)));
plot(x,f)
    end
plot(x,chi2cdf(x,df(2)),'k')
    hold off
    legend({'T=500','T=1000','T=2000','T=5000','T=10,000','T=100,000','\chi squared'})


% table 6
disp(compose('%1.2g',results_lower))
disp(compose('%1.2g',results_upper))


%% 
    
   
clear all
load('dhm_results_amg_N_100_000_complete.mat')

    df=[df_1 df_2];
%instruments
for i=1:2
%compare against upper/lower cutoffs in chi-squared(x) distribution, where
%x=size of instrument-vector*number of variables
%see Den Haan & Marcet, RES, 1994, p.6

%determine distribution cutoffs
c05=icdf('chi2',0.05,df(i));
c95=icdf('chi2',0.95,df(i));
figure
hold on
    for k=1:7
%find both quantiles
%q=quantile(dhm_results(i,:,k),[0.05 0.95]);
upper=dhm_results(i,:,k)>c95;
%share of results in upper 5%
results_upper_N(i,k)=sum(upper)/N*100;
lower=dhm_results(i,:,k)<c05;
%share of results in lower 5%
results_lower_N(i,k)=sum(lower)/N*100;
[f,x] = ecdf(squeeze(dhm_results(i,:,k)));
plot(x,f)
    end
plot(x,chi2cdf(x,df(i)),'k')
    hold off
end