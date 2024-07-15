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

assert(length(T) >= 14);

T(1) = params(11)^(-1)*params(39)^params(14);
T(2) = 1-(1-params(13))/params(39);
T(3) = params(18)*((1-params(9))/params(9)*(T(1)-(1-params(13)))/(params(9)^params(9)*(1-params(9))^(1-params(9))/(params(18)*(T(1)-(1-params(13)))^params(9)))^(1/(1-params(9))))^(params(9)-1);
T(4) = params(39)*T(2)*T(3);
T(5) = 1/(params(10)/(1-params(10)));
T(6) = params(39)*params(11)*params(39)^(-params(14));
T(7) = 1/(1+T(6));
T(8) = params(39)^2;
T(9) = T(8)*params(12);
T(10) = params(15)/params(39);
T(11) = (1-T(10))/(params(14)*(1+T(10)));
T(12) = (1-params(22))*(1-T(6)*params(22))/params(22)/(1+(params(18)-1)*params(3));
T(13) = T(6)/(1+T(6));
T(14) = 1/(1+(params(24)-1)*params(1))*(1-params(20))*(1-T(6)*params(20))/((1+T(6))*params(20));

end
