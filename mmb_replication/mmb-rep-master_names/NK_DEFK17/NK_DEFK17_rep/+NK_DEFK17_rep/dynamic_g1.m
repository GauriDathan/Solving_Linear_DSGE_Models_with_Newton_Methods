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
    T = NK_DEFK17_rep.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(33, 54);
g1(1,10)=T(30);
g1(1,43)=(-(T(4)*y(28)*T(32)));
g1(1,44)=(-(T(3)*y(28)*T(36)));
g1(1,45)=(-(T(3)*y(28)*T(37)));
g1(1,28)=(-(T(3)*T(4)));
g1(2,10)=T(30);
g1(2,43)=(-(T(7)*T(5)*T(32)));
g1(2,24)=(-(T(7)*T(3)*(-(y(46)+y(44)*(1-params(8))))/(y(24)*y(24))));
g1(2,44)=(-(T(7)*T(3)*(1-params(8))/y(24)+T(3)*T(5)*(T(6)*(params(4)*(y(46)+y(44)*(1-params(8))*y(53))+params(4)*(y(44)-y(45))*(1-params(8))*y(53))-params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53))*((y(46)+y(44)*(1-params(8)))*(-params(5))+(y(45)-y(44)*params(5))*(1-params(8))))/(T(6)*T(6))));
g1(2,45)=(-(T(3)*T(5)*(T(6)*(y(46)+y(44)*(1-params(8))*y(53))*(-params(4))-(y(46)+y(44)*(1-params(8)))*params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53)))/(T(6)*T(6))));
g1(2,46)=(-(T(7)*T(3)*1/y(24)+T(3)*T(5)*(params(4)*(y(44)-y(45))*T(6)-(y(45)-y(44)*params(5))*params(4)*(y(44)-y(45))*(y(46)+y(44)*(1-params(8))*y(53)))/(T(6)*T(6))));
g1(2,53)=(-(T(3)*T(5)*params(4)*(y(44)-y(45))*y(44)*(1-params(8))/T(6)));
g1(3,11)=y(25)-params(5)*y(24);
g1(3,1)=(-(params(4)*y(6)*y(5)/y(36)));
g1(3,16)=params(4);
g1(3,3)=(-(params(4)*(y(26)+y(24)*(1-params(8))*y(42))));
g1(3,5)=(-(params(4)*y(6)*y(1)/y(36)));
g1(3,6)=(-(params(4)*y(5)*y(1)/y(36)));
g1(3,24)=y(11)*(-params(5))-params(4)*(1-params(8))*y(42)*y(3);
g1(3,25)=y(11);
g1(3,26)=(-(params(4)*y(3)));
g1(3,36)=(-(params(4)*T(38)));
g1(3,42)=(-(params(4)*y(3)*(1-params(8))*y(24)));
g1(4,11)=(-(y(13)*1/params(22)));
g1(4,12)=(-1);
g1(4,13)=(-(y(11)/params(22)));
g1(4,25)=1;
g1(5,11)=(-(params(9)*1/params(22)*2*(y(11)/params(22)-1)/2));
g1(5,12)=1;
g1(6,11)=(-(params(9)*1/params(22)));
g1(6,13)=1;
g1(7,14)=(-(T(8)*getPowerDeriv(y(14),1-params(6),1)));
g1(7,15)=y(39);
g1(7,2)=(-(T(9)*params(32)*getPowerDeriv(y(2),params(6),1)));
g1(7,39)=y(15);
g1(8,14)=(-(params(32)*params(6)*y(35)*1/y(2)*T(33)));
g1(8,2)=(-(params(32)*params(6)*y(35)*T(33)*(-y(14))/(y(2)*y(2))));
g1(8,27)=1;
g1(8,35)=(-(T(10)*params(32)*params(6)));
g1(9,14)=(-(params(32)*(1-params(6))*y(35)*(-y(2))/(y(14)*y(14))*T(34)));
g1(9,2)=(-(params(32)*(1-params(6))*y(35)*T(34)*1/y(14)));
g1(9,31)=1;
g1(9,35)=(-(T(11)*params(32)*(1-params(6))));
g1(10,11)=(-(y(25)-(1+y(12))));
g1(10,12)=y(11);
g1(10,14)=y(31);
g1(10,15)=(-1);
g1(10,2)=y(26);
g1(10,25)=(-y(11));
g1(10,26)=y(2);
g1(10,31)=y(14);
g1(11,17)=1;
g1(11,18)=(-1);
g1(11,19)=(-1);
g1(12,11)=(-1);
g1(12,2)=(-(1-params(8)));
g1(12,17)=1;
g1(13,36)=(-(y(38)*T(39)*getPowerDeriv(T(13),(-params(11)),1)));
g1(13,37)=1;
g1(13,38)=(-T(14));
g1(14,10)=(-(y(35)*y(15)*(1+params(11))*T(30)));
g1(14,15)=(-(y(35)*T(1)*(1+params(11))));
g1(14,35)=(-(y(15)*T(1)*(1+params(11))));
g1(14,50)=(-(y(51)*params(1)*params(13)*getPowerDeriv(y(50),T(15),1)));
g1(14,37)=1;
g1(14,51)=(-T(16));
g1(15,10)=(-(y(15)*T(30)));
g1(15,15)=(-T(1));
g1(15,50)=(-(y(52)*params(1)*params(13)*getPowerDeriv(y(50),T(12),1)));
g1(15,38)=1;
g1(15,52)=(-T(17));
g1(16,32)=(-(y(34)*(-(params(12)*getPowerDeriv(y(32),T(18),1)))/(1-params(12))*getPowerDeriv(T(19),(-(params(10)+(1+params(10))*params(3))),1)));
g1(16,33)=1;
g1(16,34)=(-T(20));
g1(17,14)=(-((1+params(10))*getPowerDeriv(y(14),1+params(3),1)));
g1(17,47)=(-(y(48)*params(1)*params(12)*getPowerDeriv(y(47),(1+params(10))*(1+params(3))/params(10),1)));
g1(17,33)=1;
g1(17,48)=(-T(21));
g1(18,10)=(-(y(14)*y(31)*T(30)));
g1(18,14)=(-(T(1)*y(31)));
g1(18,31)=(-(T(1)*y(14)));
g1(18,47)=(-(y(49)*params(1)*params(12)*getPowerDeriv(y(47),T(18),1)));
g1(18,34)=1;
g1(18,49)=(-T(22));
g1(19,7)=(-y(32));
g1(19,31)=y(36);
g1(19,32)=(-y(7));
g1(19,36)=y(31);
g1(20,36)=(-(params(13)*y(8)*getPowerDeriv(y(36),T(15),1)+(1-params(13))*T(39)*getPowerDeriv(T(13),1+params(11),1)));
g1(20,8)=(-(params(13)*T(23)));
g1(20,39)=1;
g1(21,15)=(-(T(24)*T(25)*1/params(20)*getPowerDeriv(y(15)/params(20),params(15),1)*T(35)*(T(29)>1)));
g1(21,6)=(-((T(29)>1)*T(28)*getPowerDeriv(y(6),params(16),1)));
g1(21,23)=1;
g1(21,36)=(-((T(29)>1)*T(24)*T(35)*T(26)*params(25)*getPowerDeriv(y(36),params(14),1)));
g1(22,19)=1;
g1(22,42)=(-params(17));
g1(23,1)=(-(params(18)*y(6)*y(5)/y(36)));
g1(23,16)=1;
g1(23,4)=(-(params(18)*(-y(24))));
g1(23,5)=(-(params(18)*y(6)*y(1)/y(36)));
g1(23,6)=(-(params(18)*y(5)*y(1)/y(36)));
g1(23,24)=(-(params(18)*(-y(4))));
g1(23,36)=(-(params(18)*T(38)));
g1(24,1)=y(6)*y(5)/y(36);
g1(24,15)=(-y(20));
g1(24,16)=(-1);
g1(24,4)=(-(y(26)+(1-params(8))*y(24)));
g1(24,19)=y(24);
g1(24,5)=y(6)*y(1)/y(36);
g1(24,20)=(-y(15));
g1(24,6)=y(5)*y(1)/y(36);
g1(24,24)=y(19)-(1-params(8))*y(4);
g1(24,26)=(-y(4));
g1(24,36)=T(38);
g1(25,10)=(-1);
g1(25,11)=(-(1+y(12)));
g1(25,12)=(-y(11));
g1(25,15)=1;
g1(26,23)=(-(1/y(50)));
g1(26,28)=1;
g1(26,50)=(-((-y(23))/(y(50)*y(50))));
g1(27,24)=(-((-(y(46)+y(44)*(1-params(8))))/(y(24)*y(24))));
g1(27,44)=(-((1-params(8))/y(24)));
g1(27,46)=(-(1/y(24)));
g1(27,30)=1;
g1(28,28)=1;
g1(28,30)=(-1);
g1(28,41)=1;
g1(29,44)=(-T(36));
g1(29,45)=(-T(37));
g1(29,40)=1;
g1(30,2)=(-y(24));
g1(30,21)=1;
g1(30,24)=(-y(2));
g1(31,10)=(-1);
g1(31,11)=(-y(25));
g1(31,22)=1;
g1(31,25)=(-y(11));
g1(32,10)=T(30);
g1(32,43)=(-(params(1)*y(29)*T(31)));
g1(32,29)=(-T(3));
g1(33,9)=(-params(19));
g1(33,42)=1;
g1(33,54)=(-1);

end
