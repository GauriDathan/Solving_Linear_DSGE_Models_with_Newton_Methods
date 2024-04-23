function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 22);

T(1) = y(1)^(-params(2));
T(2) = 1+params(4)*(y(15)-y(16))/(y(16)-y(15)*params(5));
T(3) = (y(17)+y(15)*(1-params(8)))/y(15);
T(4) = (y(16)-y(15)*params(5))*(y(17)+y(15)*(1-params(8)));
T(5) = 1+params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(33))/T(4);
T(6) = params(32)*y(8)^params(6);
T(7) = y(5)^(1-params(6));
T(8) = (y(5)/y(8))^(1-params(6));
T(9) = (y(8)/y(5))^params(6);
T(10) = y(27)^(1/params(11));
T(11) = (1-params(13)*T(10))/(1-params(13));
T(12) = T(11)^(-params(11));
T(13) = y(27)^((1+params(11))/params(11));
T(14) = y(23)^(1/params(10));
T(15) = ((1-params(12)*T(14))/(1-params(12)))^(-(params(10)+(1+params(10))*params(3)));
T(16) = params(1)*params(12)*y(23)^((1+params(10))*(1+params(3))/params(10));
T(17) = y(14)^params(16);
T(18) = params(25)*y(27)^params(14);
T(19) = (y(6)/params(20))^params(15);
T(20) = T(18)*T(19);
T(21) = T(20)^(1-params(16));
T(22) = T(17)*T(21);

end
