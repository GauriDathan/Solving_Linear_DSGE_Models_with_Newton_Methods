function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = US_SW07_rep_SMG.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(43, 84);
g1(1,33)=(-params(9));
g1(1,40)=(-(1-params(9)));
g1(1,54)=1;
g1(2,32)=1;
g1(2,33)=(-T(3));
g1(3,33)=1;
g1(3,34)=1;
g1(3,39)=(-1);
g1(3,40)=(-1);
g1(4,32)=(-1);
g1(4,34)=1;
g1(4,19)=(-1);
g1(5,35)=(-(1/T(5)*T(11)));
g1(5,4)=(-T(11));
g1(5,37)=1;
g1(5,69)=(-(T(10)*T(11)));
g1(5,57)=(-1);
g1(6,66)=(-((T(1)-(1-params(13)))/T(1)));
g1(6,35)=1;
g1(6,67)=(-((1-params(13))/T(1)));
g1(6,41)=1;
g1(6,55)=(-(1/T(7)));
g1(7,3)=(-(T(6)/(1+T(6))));
g1(7,36)=1;
g1(7,68)=(-(1/(1+T(6))));
g1(7,39)=(-T(16));
g1(7,70)=T(16);
g1(7,41)=T(7);
g1(7,55)=(-1);
g1(8,32)=(-((T(1)-(1-params(13)))*T(15)));
g1(8,36)=(-(1-params(38)-params(39)*T(2)*T(15)));
g1(8,37)=(-(params(39)*T(2)*T(15)));
g1(8,38)=1;
g1(8,56)=(-1);
g1(9,34)=(-(params(18)*params(9)));
g1(9,38)=1;
g1(9,39)=(-(params(18)*(1-params(9))));
g1(9,54)=(-params(18));
g1(10,3)=T(9);
g1(10,36)=(-T(8));
g1(10,39)=(-params(23));
g1(10,40)=1;
g1(11,37)=(-T(2));
g1(11,57)=(-(T(2)*T(5)));
g1(11,19)=(-(1-T(2)));
g1(11,61)=1;
g1(12,42)=1;
g1(12,44)=(-params(9));
g1(12,52)=(-(1-params(9)));
g1(12,54)=1;
g1(13,43)=1;
g1(13,44)=(-T(3));
g1(14,44)=1;
g1(14,45)=1;
g1(14,50)=(-1);
g1(14,52)=(-1);
g1(15,43)=(-1);
g1(15,45)=1;
g1(15,20)=(-1);
g1(16,46)=(-(1/T(5)*T(11)));
g1(16,7)=(-T(11));
g1(16,48)=1;
g1(16,74)=(-(T(10)*T(11)));
g1(16,57)=(-1);
g1(17,71)=(-((T(1)-(1-params(13)))/T(1)));
g1(17,46)=1;
g1(17,72)=(-((1-params(13))/T(1)));
g1(17,76)=(-1);
g1(17,53)=1;
g1(17,55)=(-(1/T(7)));
g1(18,6)=(-(T(6)/(1+T(6))));
g1(18,47)=1;
g1(18,73)=(-(1/(1+T(6))));
g1(18,50)=(-T(16));
g1(18,75)=T(16);
g1(18,76)=(-T(7));
g1(18,53)=T(7);
g1(18,55)=(-1);
g1(19,43)=(-((T(1)-(1-params(13)))*T(15)));
g1(19,47)=(-(1-params(38)-params(39)*T(2)*T(15)));
g1(19,48)=(-(params(39)*T(2)*T(15)));
g1(19,49)=1;
g1(19,56)=(-1);
g1(20,45)=(-(params(18)*params(9)));
g1(20,49)=1;
g1(20,50)=(-(params(18)*(1-params(9))));
g1(20,54)=(-params(18));
g1(21,42)=(-(T(12)*T(13)));
g1(21,9)=(-(params(21)*T(12)));
g1(21,51)=1;
g1(21,76)=(-(T(10)*T(12)));
g1(21,59)=(-1);
g1(22,6)=(-(T(14)*(-T(9))));
g1(22,47)=(-(T(8)*T(14)));
g1(22,50)=(-(params(23)*T(14)));
g1(22,9)=(-(params(19)/(1+T(10))));
g1(22,51)=(1+params(19)*T(10))/(1+T(10));
g1(22,76)=(-(T(10)/(1+T(10))));
g1(22,10)=(-T(11));
g1(22,52)=1+T(14);
g1(22,77)=(-(T(10)/(1+T(10))));
g1(22,60)=(-1);
g1(23,5)=(-params(27));
g1(23,38)=(-((-((1-params(29))*params(28)))-params(27)));
g1(23,8)=params(27);
g1(23,49)=(-((1-params(29))*params(28)+params(27)));
g1(23,51)=(-(params(26)*(1-params(29))));
g1(23,11)=(-params(29));
g1(23,53)=1;
g1(23,58)=(-1);
g1(24,12)=(-params(30));
g1(24,54)=1;
g1(24,78)=(-1);
g1(25,13)=(-params(31));
g1(25,55)=1;
g1(25,79)=(-1);
g1(26,14)=(-params(32));
g1(26,56)=1;
g1(26,78)=(-params(2));
g1(26,81)=(-1);
g1(27,15)=(-params(33));
g1(27,57)=1;
g1(27,80)=(-1);
g1(28,16)=(-params(34));
g1(28,58)=1;
g1(28,82)=(-1);
g1(29,2)=params(8);
g1(29,31)=(-1);
g1(29,17)=(-params(35));
g1(29,59)=1;
g1(30,31)=1;
g1(30,83)=(-1);
g1(31,1)=params(7);
g1(31,30)=(-1);
g1(31,18)=(-params(36));
g1(31,60)=1;
g1(32,30)=1;
g1(32,84)=(-1);
g1(33,48)=(-T(2));
g1(33,57)=(-(params(12)*T(2)*T(4)));
g1(33,20)=(-(1-T(2)));
g1(33,62)=1;
g1(34,26)=1;
g1(34,8)=1;
g1(34,49)=(-1);
g1(35,27)=1;
g1(35,6)=1;
g1(35,47)=(-1);
g1(36,28)=1;
g1(36,7)=1;
g1(36,48)=(-1);
g1(37,29)=1;
g1(37,10)=1;
g1(37,52)=(-1);
g1(38,25)=1;
g1(38,51)=(-1);
g1(39,9)=(-1);
g1(39,51)=(-1);
g1(39,63)=1;
g1(39,21)=(-1);
g1(39,22)=(-1);
g1(40,24)=1;
g1(40,53)=(-1);
g1(41,23)=1;
g1(41,50)=(-1);
g1(42,9)=(-1);
g1(42,64)=1;
g1(43,21)=(-1);
g1(43,65)=1;

end
