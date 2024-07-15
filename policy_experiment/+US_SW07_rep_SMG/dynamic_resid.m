function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = US_SW07_rep_SMG.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(43, 1);
    residual(1) = (y(54)) - (params(9)*y(33)+(1-params(9))*y(40));
    residual(2) = (y(32)) - (y(33)*T(3));
    residual(3) = (y(33)) - (y(40)+y(39)-y(34));
    residual(4) = (y(34)) - (y(32)+y(19));
    residual(5) = (y(37)) - (y(57)+T(11)*(1/T(5)*y(35)+y(4)+y(69)*T(10)));
    residual(6) = (y(35)) - (y(55)*1/T(7)-y(41)+y(66)*(T(1)-(1-params(13)))/T(1)+y(67)*(1-params(13))/T(1));
    residual(7) = (y(36)) - (y(55)+T(6)/(1+T(6))*y(3)+1/(1+T(6))*y(68)+(y(39)-y(70))*T(16)-y(41)*T(7));
    residual(8) = (y(38)) - (y(56)+y(36)*(1-params(38)-params(39)*T(2)*T(15))+y(37)*params(39)*T(2)*T(15)+y(32)*(T(1)-(1-params(13)))*T(15));
    residual(9) = (y(38)) - (params(18)*(y(54)+params(9)*y(34)+(1-params(9))*y(39)));
    residual(10) = (y(40)) - (y(39)*params(23)+y(36)*T(8)-y(3)*T(9));
    residual(11) = (y(61)) - (y(19)*(1-T(2))+T(2)*y(37)+y(57)*T(2)*T(5));
    residual(12) = (y(42)) - (params(9)*y(44)+(1-params(9))*y(52)-y(54));
    residual(13) = (y(43)) - (T(3)*y(44));
    residual(14) = (y(44)) - (y(52)+y(50)-y(45));
    residual(15) = (y(45)) - (y(43)+y(20));
    residual(16) = (y(48)) - (y(57)+T(11)*(1/T(5)*y(46)+y(7)+y(74)*T(10)));
    residual(17) = (y(46)) - (y(55)*1/T(7)+y(76)-y(53)+y(71)*(T(1)-(1-params(13)))/T(1)+y(72)*(1-params(13))/T(1));
    residual(18) = (y(47)) - (y(55)+T(6)/(1+T(6))*y(6)+1/(1+T(6))*y(73)+(y(50)-y(75))*T(16)-T(7)*(y(53)-y(76)));
    residual(19) = (y(49)) - (y(56)+y(47)*(1-params(38)-params(39)*T(2)*T(15))+y(48)*params(39)*T(2)*T(15)+y(43)*(T(1)-(1-params(13)))*T(15));
    residual(20) = (y(49)) - (params(18)*(y(54)+params(9)*y(45)+(1-params(9))*y(50)));
    residual(21) = (y(51)) - (y(59)+T(12)*(params(21)*y(9)+y(76)*T(10)+y(42)*T(13)));
    residual(22) = (y(52)) - (y(60)+y(10)*T(11)+y(77)*T(10)/(1+T(10))+y(9)*params(19)/(1+T(10))-y(51)*(1+params(19)*T(10))/(1+T(10))+y(76)*T(10)/(1+T(10))+(params(23)*y(50)+T(8)*y(47)-T(9)*y(6)-y(52))*T(14));
    residual(23) = (y(53)) - (y(51)*params(26)*(1-params(29))+(1-params(29))*params(28)*(y(49)-y(38))+params(27)*(y(49)-y(38)-y(8)+y(5))+params(29)*y(11)+y(58));
    residual(24) = (y(54)) - (params(30)*y(12)+x(it_, 1));
    residual(25) = (y(55)) - (params(31)*y(13)+x(it_, 2));
    residual(26) = (y(56)) - (params(32)*y(14)+x(it_, 4)+x(it_, 1)*params(2));
    residual(27) = (y(57)) - (params(33)*y(15)+x(it_, 3));
    residual(28) = (y(58)) - (params(34)*y(16)+x(it_, 5));
    residual(29) = (y(59)) - (params(35)*y(17)+y(31)-params(8)*y(2));
    residual(30) = (y(31)) - (x(it_, 6));
    residual(31) = (y(60)) - (params(36)*y(18)+y(30)-params(7)*y(1));
    residual(32) = (y(30)) - (x(it_, 7));
    residual(33) = (y(62)) - (y(20)*(1-T(2))+T(2)*y(48)+y(57)*params(12)*T(2)*T(4));
    residual(34) = (y(26)) - (y(49)-y(8)+params(37));
    residual(35) = (y(27)) - (params(37)+y(47)-y(6));
    residual(36) = (y(28)) - (params(37)+y(48)-y(7));
    residual(37) = (y(29)) - (params(37)+y(52)-y(10));
    residual(38) = (y(25)) - (params(5)+y(51));
    residual(39) = (y(63)) - (y(51)+y(9)+y(21)+y(22));
    residual(40) = (y(24)) - (y(53)+params(6));
    residual(41) = (y(23)) - (y(50)+params(4));
    residual(42) = (y(64)) - (y(9));
    residual(43) = (y(65)) - (y(21));

end
