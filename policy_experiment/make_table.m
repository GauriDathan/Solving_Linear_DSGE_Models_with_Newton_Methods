% This file produces a table with run times and forward errors for all
% algorithms and differing grid sizes
% Table 1 in the paper shows 2 selected grid sizes: -1 (STEPS=1), 
% 6 (STEPS=29) - printed in command window

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

clear all;

load Combined_Policy_Run.mat

results_table=zeros(7,9,length(STEPS));

%grid size
for k=1:length(STEPS)

%algorithm type
for j=1:7
%run times
results_table(j,1,k)=median(median(total_AMG_JS_Results{1,k}(j+1,1,:,:)./total_AMG_JS_Results{1,k}(2,1,:,:)));
results_table(j,2,k)=min(min(total_AMG_JS_Results{1,k}(j+1,1,:,:)./total_AMG_JS_Results{1,k}(2,1,:,:)));
results_table(j,3,k)=max(max(total_AMG_JS_Results{1,k}(j+1,1,:,:)./total_AMG_JS_Results{1,k}(2,1,:,:)));
%forward error 1
results_table(j,4,k)=median(median(total_AMG_JS_Results{1,k}(j+1,4,:,:)./total_AMG_JS_Results{1,k}(2,4,:,:)));
results_table(j,5,k)=min(min(total_AMG_JS_Results{1,k}(j+1,4,:,:)./total_AMG_JS_Results{1,k}(2,4,:,:)));
results_table(j,6,k)=max(max(total_AMG_JS_Results{1,k}(j+1,4,:,:)./total_AMG_JS_Results{1,k}(2,4,:,:)));
%forward error 2
results_table(j,7,k)=median(median(total_AMG_JS_Results{1,k}(j+1,5,:,:)./total_AMG_JS_Results{1,k}(2,5,:,:)));
results_table(j,8,k)=min(min(total_AMG_JS_Results{1,k}(j+1,5,:,:)./total_AMG_JS_Results{1,k}(2,5,:,:)));
results_table(j,9,k)=max(max(total_AMG_JS_Results{1,k}(j+1,5,:,:)./total_AMG_JS_Results{1,k}(2,5,:,:)));
end

end

disp('stepsize x=-1')
results_table(:,:,1)
disp('stepsize x=6')
results_table(:,:,29)
table=NaN(2*size(results_table,1)-1,size(results_table,2));

ncol=size(results_table,2);
table=[results_table(:,:,1),results_table(:,:,29)]'; 
table=reshape(table(:),ncol,[])'; 
table=table(2:end,:);

disp(compose('%1.2g',table))
