function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_ENDO_LAG_28_1=ds.pinf(-1);
ds.AUX_ENDO_LAG_28_2=ds.AUX_ENDO_LAG_28_1(-1);
end
