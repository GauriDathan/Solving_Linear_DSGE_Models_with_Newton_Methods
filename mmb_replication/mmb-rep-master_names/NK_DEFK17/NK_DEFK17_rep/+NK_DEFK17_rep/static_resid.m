function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = NK_DEFK17_rep.static_resid_tt(T, y, x, params);
end
residual = zeros(33, 1);
lhs = T(1);
rhs = T(1)*params(1)*y(19)*T(2);
residual(1) = lhs - rhs;
lhs = T(1);
rhs = T(1)*params(1)*T(3)*T(5);
residual(2) = lhs - rhs;
lhs = (y(16)-y(15)*params(5))*y(2);
rhs = params(4)*((y(17)+y(15)*(1-params(8))*y(33))*y(9)+y(14)*y(11)*y(6)/y(27)-y(7));
residual(3) = lhs - rhs;
lhs = y(16);
rhs = 1+y(3)+y(4)*y(2)/params(22);
residual(4) = lhs - rhs;
lhs = y(3);
rhs = params(9)*(y(2)/params(22)-1)^2/2;
residual(5) = lhs - rhs;
lhs = y(4);
rhs = params(9)*(y(2)/params(22)-1);
residual(6) = lhs - rhs;
lhs = y(6)*y(30);
rhs = T(6)*T(7)-params(7);
residual(7) = lhs - rhs;
lhs = y(18);
rhs = params(32)*params(6)*y(26)*T(8);
residual(8) = lhs - rhs;
lhs = y(22);
rhs = params(32)*(1-params(6))*y(26)*T(9);
residual(9) = lhs - rhs;
lhs = y(17)*y(8);
rhs = y(6)-y(5)*y(22)+y(2)*(y(16)-(1+y(3)));
residual(10) = lhs - rhs;
lhs = y(8);
rhs = y(9)+y(10);
residual(11) = lhs - rhs;
lhs = y(8);
rhs = y(2)+(1-params(8))*y(8);
residual(12) = lhs - rhs;
lhs = y(28);
rhs = y(29)*T(12);
residual(13) = lhs - rhs;
lhs = y(28);
rhs = y(26)*y(6)*T(1)*(1+params(11))+y(28)*params(1)*params(13)*T(13);
residual(14) = lhs - rhs;
lhs = y(29);
rhs = T(1)*y(6)+y(29)*T(10)*params(1)*params(13);
residual(15) = lhs - rhs;
lhs = y(24);
rhs = y(25)*T(15);
residual(16) = lhs - rhs;
lhs = y(24);
rhs = (1+params(10))*y(5)^(1+params(3))+y(24)*T(16);
residual(17) = lhs - rhs;
lhs = y(25);
rhs = y(5)*T(1)*y(22)+y(25)*T(14)*params(1)*params(12);
residual(18) = lhs - rhs;
lhs = y(27)*y(22);
rhs = y(22)*y(23);
residual(19) = lhs - rhs;
lhs = y(30);
rhs = T(13)*y(30)*params(13)+(1-params(13))*T(11)^(1+params(11));
residual(20) = lhs - rhs;
lhs = y(14);
rhs = max(T(22),1);
residual(21) = lhs - rhs;
lhs = y(10);
rhs = params(17)*(y(33)-params(33));
residual(22) = lhs - rhs;
lhs = y(7);
rhs = params(30)+params(18)*(y(14)*y(11)*y(6)/y(27)-params(20)*params(25)*params(31)-y(15)*y(10));
residual(23) = lhs - rhs;
lhs = y(14)*y(11)*y(6)/y(27)+y(15)*y(10);
rhs = y(7)+(y(17)+y(15)*(1-params(8)))*y(10)+y(11)*y(6);
residual(24) = lhs - rhs;
lhs = y(6);
rhs = y(1)+y(2)*(1+y(3));
residual(25) = lhs - rhs;
lhs = y(19);
rhs = y(14)/y(27);
residual(26) = lhs - rhs;
lhs = y(21);
rhs = T(3);
residual(27) = lhs - rhs;
lhs = y(32);
rhs = y(21)-y(19);
residual(28) = lhs - rhs;
lhs = y(31);
rhs = params(4)*(y(15)-y(16))/(y(16)-y(15)*params(5));
residual(29) = lhs - rhs;
lhs = y(12);
rhs = y(15)*y(8);
residual(30) = lhs - rhs;
lhs = y(13);
rhs = y(1)+y(16)*y(2);
residual(31) = lhs - rhs;
lhs = T(1);
rhs = params(1)*T(1)*y(20);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = params(33)*(1-params(19))+y(33)*params(19)+x(1);
residual(33) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
