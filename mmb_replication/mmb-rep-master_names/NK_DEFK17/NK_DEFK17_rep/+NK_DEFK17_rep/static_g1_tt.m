function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 32);

T = NK_DEFK17_rep.static_resid_tt(T, y, x, params);

T(23) = getPowerDeriv(y(1),(-params(2)),1);
T(24) = getPowerDeriv(y(5)/y(8),1-params(6),1);
T(25) = getPowerDeriv(y(8)/y(5),params(6),1);
T(26) = getPowerDeriv(T(20),1-params(16),1);
T(27) = (params(4)*(y(16)-y(15)*params(5))-params(4)*(y(15)-y(16))*(-params(5)))/((y(16)-y(15)*params(5))*(y(16)-y(15)*params(5)));
T(28) = ((y(16)-y(15)*params(5))*(-params(4))-params(4)*(y(15)-y(16)))/((y(16)-y(15)*params(5))*(y(16)-y(15)*params(5)));
T(29) = getPowerDeriv(y(23),1/params(10),1);
T(30) = (-(y(14)*y(11)*y(6)))/(y(27)*y(27));
T(31) = getPowerDeriv(y(27),1/params(11),1);
T(32) = getPowerDeriv(y(27),(1+params(11))/params(11),1);

end
