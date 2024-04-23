function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 29);

T(1) = y(10)^(-params(2));
T(2) = y(43)^(-params(2));
T(3) = params(1)*T(2);
T(4) = 1+params(4)*(y(44)-y(45))/(y(45)-y(44)*params(5));
T(5) = (y(46)+y(44)*(1-params(8)))/y(24);
T(6) = (y(45)-y(44)*params(5))*(y(46)+y(44)*(1-params(8)));
T(7) = 1+params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53))/T(6);
T(8) = params(32)*y(2)^params(6);
T(9) = y(14)^(1-params(6));
T(10) = (y(14)/y(2))^(1-params(6));
T(11) = (y(2)/y(14))^params(6);
T(12) = 1/params(11);
T(13) = (1-params(13)*y(36)^T(12))/(1-params(13));
T(14) = T(13)^(-params(11));
T(15) = (1+params(11))/params(11);
T(16) = params(1)*params(13)*y(50)^T(15);
T(17) = params(1)*params(13)*y(50)^T(12);
T(18) = 1/params(10);
T(19) = (1-params(12)*y(32)^T(18))/(1-params(12));
T(20) = T(19)^(-(params(10)+(1+params(10))*params(3)));
T(21) = params(1)*params(12)*y(47)^((1+params(10))*(1+params(3))/params(10));
T(22) = params(1)*params(12)*y(47)^T(18);
T(23) = y(36)^T(15);
T(24) = y(6)^params(16);
T(25) = params(25)*y(36)^params(14);
T(26) = (y(15)/params(20))^params(15);
T(27) = T(25)*T(26);
T(28) = T(27)^(1-params(16));
T(29) = T(24)*T(28);

end
