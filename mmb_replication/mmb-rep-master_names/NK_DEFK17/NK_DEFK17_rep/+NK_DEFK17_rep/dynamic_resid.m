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
    T = NK_DEFK17_rep.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(33, 1);
lhs = T(1);
rhs = T(3)*y(28)*T(4);
residual(1) = lhs - rhs;
lhs = T(1);
rhs = T(3)*T(5)*T(7);
residual(2) = lhs - rhs;
lhs = (y(25)-params(5)*y(24))*y(11);
rhs = params(4)*((y(26)+y(24)*(1-params(8))*y(42))*y(3)+y(6)*y(5)*y(1)/y(36)-y(16));
residual(3) = lhs - rhs;
lhs = y(25);
rhs = 1+y(12)+y(13)*y(11)/params(22);
residual(4) = lhs - rhs;
lhs = y(12);
rhs = params(9)*(y(11)/params(22)-1)^2/2;
residual(5) = lhs - rhs;
lhs = y(13);
rhs = params(9)*(y(11)/params(22)-1);
residual(6) = lhs - rhs;
lhs = y(15)*y(39);
rhs = T(8)*T(9)-params(7);
residual(7) = lhs - rhs;
lhs = y(27);
rhs = params(32)*params(6)*y(35)*T(10);
residual(8) = lhs - rhs;
lhs = y(31);
rhs = params(32)*(1-params(6))*y(35)*T(11);
residual(9) = lhs - rhs;
lhs = y(26)*y(2);
rhs = y(15)-y(14)*y(31)+y(11)*(y(25)-(1+y(12)));
residual(10) = lhs - rhs;
lhs = y(17);
rhs = y(18)+y(19);
residual(11) = lhs - rhs;
lhs = y(17);
rhs = y(11)+(1-params(8))*y(2);
residual(12) = lhs - rhs;
lhs = y(37);
rhs = y(38)*T(14);
residual(13) = lhs - rhs;
lhs = y(37);
rhs = y(35)*y(15)*T(1)*(1+params(11))+T(16)*y(51);
residual(14) = lhs - rhs;
lhs = y(38);
rhs = T(1)*y(15)+T(17)*y(52);
residual(15) = lhs - rhs;
lhs = y(33);
rhs = y(34)*T(20);
residual(16) = lhs - rhs;
lhs = y(33);
rhs = (1+params(10))*y(14)^(1+params(3))+T(21)*y(48);
residual(17) = lhs - rhs;
lhs = y(34);
rhs = y(14)*T(1)*y(31)+T(22)*y(49);
residual(18) = lhs - rhs;
lhs = y(36)*y(31);
rhs = y(32)*y(7);
residual(19) = lhs - rhs;
lhs = y(39);
rhs = params(13)*y(8)*T(23)+(1-params(13))*T(13)^(1+params(11));
residual(20) = lhs - rhs;
lhs = y(23);
rhs = max(T(29),1);
residual(21) = lhs - rhs;
lhs = y(19);
rhs = params(17)*(y(42)-params(33));
residual(22) = lhs - rhs;
lhs = y(16);
rhs = params(30)+params(18)*(y(6)*y(5)*y(1)/y(36)-params(20)*params(25)*params(31)-y(24)*y(4));
residual(23) = lhs - rhs;
lhs = y(6)*y(5)*y(1)/y(36)+y(24)*y(19);
rhs = y(16)+y(4)*(y(26)+(1-params(8))*y(24))+y(15)*y(20);
residual(24) = lhs - rhs;
lhs = y(15);
rhs = y(10)+y(11)*(1+y(12));
residual(25) = lhs - rhs;
lhs = y(28);
rhs = y(23)/y(50);
residual(26) = lhs - rhs;
lhs = y(30);
rhs = T(5);
residual(27) = lhs - rhs;
lhs = y(41);
rhs = y(30)-y(28);
residual(28) = lhs - rhs;
lhs = y(40);
rhs = params(4)*(y(44)-y(45))/(y(45)-y(44)*params(5));
residual(29) = lhs - rhs;
lhs = y(21);
rhs = y(24)*y(2);
residual(30) = lhs - rhs;
lhs = y(22);
rhs = y(10)+y(25)*y(11);
residual(31) = lhs - rhs;
lhs = T(1);
rhs = params(1)*T(2)*y(29);
residual(32) = lhs - rhs;
lhs = y(42);
rhs = params(33)*(1-params(19))+params(19)*y(9)+x(it_, 1);
residual(33) = lhs - rhs;

end
