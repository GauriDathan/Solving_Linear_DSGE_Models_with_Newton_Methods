function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(14, 1);
end
[T_order, T] = US_SW07_rep_SMG.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(43, 1);
    residual(1) = (y(32)) - (params(9)*y(11)+(1-params(9))*y(18));
    residual(2) = (y(10)) - (y(11)*T(5));
    residual(3) = (y(11)) - (y(18)+y(17)-y(12));
    residual(4) = (y(12)) - (y(10)+y(39));
    residual(5) = (y(15)) - (y(35)+T(7)*(1/T(9)*y(13)+y(15)+y(15)*T(6)));
    residual(6) = (y(13)) - (y(33)*1/T(11)-y(19)+y(11)*(T(1)-(1-params(13)))/T(1)+y(13)*(1-params(13))/T(1));
    residual(7) = (y(14)) - (y(33)+y(14)*T(10)/(1+T(10))+y(14)*1/(1+T(10))-T(11)*y(19));
    residual(8) = (y(16)) - (y(34)+(1-params(38)-T(4))*y(14)+T(4)*y(15)+(T(1)-(1-params(13)))*T(3)*y(10));
    residual(9) = (y(16)) - (params(18)*(y(32)+params(9)*y(12)+(1-params(9))*y(17)));
    residual(10) = (y(18)) - (y(17)*params(23)+y(14)*1/(1-T(10))-y(14)*T(10)/(1-T(10)));
    residual(11) = (y(39)) - (y(39)*(1-T(2))+T(2)*y(15)+y(35)*T(2)*T(9));
    residual(12) = (y(20)) - (params(9)*y(22)+(1-params(9))*y(30)-y(32));
    residual(13) = (y(21)) - (T(5)*y(22));
    residual(14) = (y(22)) - (y(30)+y(28)-y(23));
    residual(15) = (y(23)) - (y(21)+y(40));
    residual(16) = (y(26)) - (y(35)+T(7)*(1/T(9)*y(24)+y(26)+T(6)*y(26)));
    residual(17) = (y(24)) - (y(33)*1/T(11)+y(29)-y(31)+(T(1)-(1-params(13)))/T(1)*y(22)+(1-params(13))/T(1)*y(24));
    residual(18) = (y(25)) - (y(33)+T(10)/(1+T(10))*y(25)+1/(1+T(10))*y(25)-T(11)*(y(31)-y(29)));
    residual(19) = (y(27)) - (y(34)+(1-params(38)-T(4))*y(25)+T(4)*y(26)+(T(1)-(1-params(13)))*T(3)*y(21));
    residual(20) = (y(27)) - (params(18)*(y(32)+params(9)*y(23)+(1-params(9))*y(28)));
    residual(21) = (y(29)) - (y(37)+1/(1+T(6)*params(21))*(y(29)*params(21)+T(6)*y(29)+y(20)*T(12)));
    residual(22) = (y(30)) - (y(38)+T(7)*y(30)+y(30)*T(13)+y(29)*params(19)/(1+T(6))-y(29)*(1+T(6)*params(19))/(1+T(6))+y(29)*T(13)+(params(23)*y(28)+1/(1-T(10))*y(25)-T(10)/(1-T(10))*y(25)-y(30))*T(14));
    residual(23) = (y(31)) - (y(29)*params(26)*(1-params(29))+(1-params(29))*params(28)*(y(27)-y(16))+params(27)*(y(16)+y(27)-y(16)-y(27))+y(31)*params(29)+y(36));
    residual(24) = (y(32)) - (y(32)*params(30)+x(1));
    residual(25) = (y(33)) - (y(33)*params(31)+x(2));
    residual(26) = (y(34)) - (y(34)*params(32)+x(4)+x(1)*params(2));
    residual(27) = (y(35)) - (y(35)*params(33)+x(3));
    residual(28) = (y(36)) - (y(36)*params(34)+x(5));
    residual(29) = (y(37)) - (y(37)*params(35)+y(9)-y(9)*params(8));
    residual(30) = (y(9)) - (x(6));
    residual(31) = (y(38)) - (y(38)*params(36)+y(8)-y(8)*params(7));
    residual(32) = (y(8)) - (x(7));
    residual(33) = (y(40)) - ((1-T(2))*y(40)+T(2)*y(26)+y(35)*params(12)*T(2)*T(8));
    residual(34) = (y(4)) - (params(37));
    residual(35) = (y(5)) - (params(37));
    residual(36) = (y(6)) - (params(37));
    residual(37) = (y(7)) - (params(37));
    residual(38) = (y(3)) - (params(5)+y(29));
    residual(39) = (y(41)) - (y(29)+y(29)+y(42)+y(43));
    residual(40) = (y(2)) - (y(31)+params(6));
    residual(41) = (y(1)) - (y(28)+params(4));
    residual(42) = (y(42)) - (y(29));
    residual(43) = (y(43)) - (y(42));
end