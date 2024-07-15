function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(1) = params(11)^(-1)*params(39)^params(14);
T(2) = 1-(1-params(13))/params(39);
T(3) = 1/(params(10)/(1-params(10)));
T(4) = params(39)^2;
T(5) = T(4)*params(12);
T(6) = params(15)/params(39);
T(7) = (1-T(6))/(params(14)*(1+T(6)));
T(8) = 1/(1-T(6));
T(9) = T(6)/(1-T(6));
T(10) = params(39)*params(11)*params(39)^(-params(14));
T(11) = 1/(1+T(10));
T(12) = 1/(1+params(21)*T(10));
T(13) = (1-params(22))*(1-params(22)*T(10))/params(22)/(1+(params(18)-1)*params(3));
T(14) = 1/(1+(params(24)-1)*params(1))*(1-params(20))*(1-params(20)*T(10))/(params(20)*(1+T(10)));
T(15) = params(18)*((1-params(9))/params(9)*(T(1)-(1-params(13)))/(params(9)^params(9)*(1-params(9))^(1-params(9))/(params(18)*(T(1)-(1-params(13)))^params(9)))^(1/(1-params(9))))^(params(9)-1);
T(16) = (params(14)-1)*T(15)*(T(1)-(1-params(13)))*(1-params(9))*1/params(24)/params(9)/(1-params(38)-params(39)*T(2)*T(15))/(params(14)*(1+T(6)));
end
