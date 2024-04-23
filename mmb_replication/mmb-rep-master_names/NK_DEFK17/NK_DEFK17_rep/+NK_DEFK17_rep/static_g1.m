function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = NK_DEFK17_rep.static_g1_tt(T, y, x, params);
end
g1 = zeros(33, 33);
g1(1,1)=T(23)-T(2)*y(19)*params(1)*T(23);
g1(1,15)=(-(T(1)*params(1)*y(19)*T(27)));
g1(1,16)=(-(T(1)*params(1)*y(19)*T(28)));
g1(1,19)=(-(T(1)*params(1)*T(2)));
g1(2,1)=T(23)-T(5)*T(3)*params(1)*T(23);
g1(2,15)=(-(T(5)*T(1)*params(1)*(y(15)*(1-params(8))-(y(17)+y(15)*(1-params(8))))/(y(15)*y(15))+T(1)*params(1)*T(3)*(T(4)*(params(4)*(y(17)+y(15)*(1-params(8))*y(33))+params(4)*(y(15)-y(16))*(1-params(8))*y(33))-params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(33))*((y(17)+y(15)*(1-params(8)))*(-params(5))+(y(16)-y(15)*params(5))*(1-params(8))))/(T(4)*T(4))));
g1(2,16)=(-(T(1)*params(1)*T(3)*(T(4)*(y(17)+y(15)*(1-params(8))*y(33))*(-params(4))-(y(17)+y(15)*(1-params(8)))*params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(33)))/(T(4)*T(4))));
g1(2,17)=(-(T(5)*T(1)*params(1)*1/y(15)+T(1)*params(1)*T(3)*(params(4)*(y(15)-y(16))*T(4)-(y(16)-y(15)*params(5))*params(4)*(y(15)-y(16))*(y(17)+y(15)*(1-params(8))*y(33)))/(T(4)*T(4))));
g1(2,33)=(-(T(1)*params(1)*T(3)*params(4)*(y(15)-y(16))*y(15)*(1-params(8))/T(4)));
g1(3,2)=y(16)-y(15)*params(5);
g1(3,6)=(-(params(4)*y(14)*y(11)/y(27)));
g1(3,7)=params(4);
g1(3,9)=(-(params(4)*(y(17)+y(15)*(1-params(8))*y(33))));
g1(3,11)=(-(params(4)*y(14)*y(6)/y(27)));
g1(3,14)=(-(params(4)*y(11)*y(6)/y(27)));
g1(3,15)=y(2)*(-params(5))-params(4)*(1-params(8))*y(33)*y(9);
g1(3,16)=y(2);
g1(3,17)=(-(params(4)*y(9)));
g1(3,27)=(-(params(4)*T(30)));
g1(3,33)=(-(params(4)*y(15)*(1-params(8))*y(9)));
g1(4,2)=(-(y(4)*1/params(22)));
g1(4,3)=(-1);
g1(4,4)=(-(y(2)/params(22)));
g1(4,16)=1;
g1(5,2)=(-(params(9)*1/params(22)*2*(y(2)/params(22)-1)/2));
g1(5,3)=1;
g1(6,2)=(-(params(9)*1/params(22)));
g1(6,4)=1;
g1(7,5)=(-(T(6)*getPowerDeriv(y(5),1-params(6),1)));
g1(7,6)=y(30);
g1(7,8)=(-(T(7)*params(32)*getPowerDeriv(y(8),params(6),1)));
g1(7,30)=y(6);
g1(8,5)=(-(params(32)*params(6)*y(26)*1/y(8)*T(24)));
g1(8,8)=(-(params(32)*params(6)*y(26)*T(24)*(-y(5))/(y(8)*y(8))));
g1(8,18)=1;
g1(8,26)=(-(T(8)*params(32)*params(6)));
g1(9,5)=(-(params(32)*(1-params(6))*y(26)*(-y(8))/(y(5)*y(5))*T(25)));
g1(9,8)=(-(params(32)*(1-params(6))*y(26)*T(25)*1/y(5)));
g1(9,22)=1;
g1(9,26)=(-(T(9)*params(32)*(1-params(6))));
g1(10,2)=(-(y(16)-(1+y(3))));
g1(10,3)=y(2);
g1(10,5)=y(22);
g1(10,6)=(-1);
g1(10,8)=y(17);
g1(10,16)=(-y(2));
g1(10,17)=y(8);
g1(10,22)=y(5);
g1(11,8)=1;
g1(11,9)=(-1);
g1(11,10)=(-1);
g1(12,2)=(-1);
g1(12,8)=1-(1-params(8));
g1(13,27)=(-(y(29)*(-(params(13)*T(31)))/(1-params(13))*getPowerDeriv(T(11),(-params(11)),1)));
g1(13,28)=1;
g1(13,29)=(-T(12));
g1(14,1)=(-(y(26)*y(6)*(1+params(11))*T(23)));
g1(14,6)=(-(y(26)*T(1)*(1+params(11))));
g1(14,26)=(-(y(6)*T(1)*(1+params(11))));
g1(14,27)=(-(y(28)*params(1)*params(13)*T(32)));
g1(14,28)=1-params(1)*params(13)*T(13);
g1(15,1)=(-(y(6)*T(23)));
g1(15,6)=(-T(1));
g1(15,27)=(-(y(29)*params(1)*params(13)*T(31)));
g1(15,29)=1-T(10)*params(1)*params(13);
g1(16,23)=(-(y(25)*(-(params(12)*T(29)))/(1-params(12))*getPowerDeriv((1-params(12)*T(14))/(1-params(12)),(-(params(10)+(1+params(10))*params(3))),1)));
g1(16,24)=1;
g1(16,25)=(-T(15));
g1(17,5)=(-((1+params(10))*getPowerDeriv(y(5),1+params(3),1)));
g1(17,23)=(-(y(24)*params(1)*params(12)*getPowerDeriv(y(23),(1+params(10))*(1+params(3))/params(10),1)));
g1(17,24)=1-T(16);
g1(18,1)=(-(y(5)*y(22)*T(23)));
g1(18,5)=(-(T(1)*y(22)));
g1(18,22)=(-(T(1)*y(5)));
g1(18,23)=(-(y(25)*params(1)*params(12)*T(29)));
g1(18,25)=1-T(14)*params(1)*params(12);
g1(19,22)=y(27)-y(23);
g1(19,23)=(-y(22));
g1(19,27)=y(22);
g1(20,27)=(-(y(30)*params(13)*T(32)+(1-params(13))*(-(params(13)*T(31)))/(1-params(13))*getPowerDeriv(T(11),1+params(11),1)));
g1(20,30)=1-params(13)*T(13);
g1(21,6)=(-(T(17)*T(18)*1/params(20)*getPowerDeriv(y(6)/params(20),params(15),1)*T(26)*(T(22)>1)));
g1(21,14)=1-(T(22)>1)*T(21)*getPowerDeriv(y(14),params(16),1);
g1(21,27)=(-((T(22)>1)*T(17)*T(26)*T(19)*params(25)*getPowerDeriv(y(27),params(14),1)));
g1(22,10)=1;
g1(22,33)=(-params(17));
g1(23,6)=(-(params(18)*y(14)*y(11)/y(27)));
g1(23,7)=1;
g1(23,10)=(-(params(18)*(-y(15))));
g1(23,11)=(-(params(18)*y(14)*y(6)/y(27)));
g1(23,14)=(-(params(18)*y(11)*y(6)/y(27)));
g1(23,15)=(-(params(18)*(-y(10))));
g1(23,27)=(-(params(18)*T(30)));
g1(24,6)=y(14)*y(11)/y(27)-y(11);
g1(24,7)=(-1);
g1(24,10)=y(15)-(y(17)+y(15)*(1-params(8)));
g1(24,11)=y(14)*y(6)/y(27)-y(6);
g1(24,14)=y(11)*y(6)/y(27);
g1(24,15)=y(10)-(1-params(8))*y(10);
g1(24,17)=(-y(10));
g1(24,27)=T(30);
g1(25,1)=(-1);
g1(25,2)=(-(1+y(3)));
g1(25,3)=(-y(2));
g1(25,6)=1;
g1(26,14)=(-(1/y(27)));
g1(26,19)=1;
g1(26,27)=(-((-y(14))/(y(27)*y(27))));
g1(27,15)=(-((y(15)*(1-params(8))-(y(17)+y(15)*(1-params(8))))/(y(15)*y(15))));
g1(27,17)=(-(1/y(15)));
g1(27,21)=1;
g1(28,19)=1;
g1(28,21)=(-1);
g1(28,32)=1;
g1(29,15)=(-T(27));
g1(29,16)=(-T(28));
g1(29,31)=1;
g1(30,8)=(-y(15));
g1(30,12)=1;
g1(30,15)=(-y(8));
g1(31,1)=(-1);
g1(31,2)=(-y(16));
g1(31,13)=1;
g1(31,16)=(-y(2));
g1(32,1)=T(23)-params(1)*y(20)*T(23);
g1(32,20)=(-(T(1)*params(1)));
g1(33,33)=1-params(19);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
