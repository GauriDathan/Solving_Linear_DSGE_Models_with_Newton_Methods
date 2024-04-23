function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 39);

T = NK_DEFK17_rep.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(30) = getPowerDeriv(y(10),(-params(2)),1);
T(31) = getPowerDeriv(y(43),(-params(2)),1);
T(32) = params(1)*T(31);
T(33) = getPowerDeriv(y(14)/y(2),1-params(6),1);
T(34) = getPowerDeriv(y(2)/y(14),params(6),1);
T(35) = getPowerDeriv(T(27),1-params(16),1);
T(36) = (params(4)*(y(45)-y(44)*params(5))-params(4)*(y(44)-y(45))*(-params(5)))/((y(45)-y(44)*params(5))*(y(45)-y(44)*params(5)));
T(37) = ((y(45)-y(44)*params(5))*(-params(4))-params(4)*(y(44)-y(45)))/((y(45)-y(44)*params(5))*(y(45)-y(44)*params(5)));
T(38) = (-(y(6)*y(5)*y(1)))/(y(36)*y(36));
T(39) = (-(params(13)*getPowerDeriv(y(36),T(12),1)))/(1-params(13));

end
