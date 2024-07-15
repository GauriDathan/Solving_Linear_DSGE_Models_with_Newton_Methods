function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = US_SW07_rep_SMG.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(15) = 1-(T(10)/(1+T(10))+1/(1+T(10)));
T(16) = 1/(1-T(10))-T(10)/(1-T(10));
end
