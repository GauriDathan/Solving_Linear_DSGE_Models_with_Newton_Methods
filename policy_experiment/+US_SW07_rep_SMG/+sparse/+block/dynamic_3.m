function [y, T, residual, g1] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(12, 1);
  y(63)=params(9)*y(65)+(1-params(9))*y(73)-y(75);
  residual(1)=(y(65))-(y(73)+y(71)-y(66));
  residual(2)=(y(66))-(y(64)+y(40));
  residual(3)=(y(70))-(y(77)+y(68)*(1-params(38)-params(39)*T(3)*T(5))+y(69)*params(39)*T(3)*T(5)+y(64)*T(2)*T(5));
  residual(4)=(y(74))-(y(72)*params(26)*(1-params(29))+(1-params(29))*params(28)*(y(70)-y(59))+params(27)*(y(70)-y(59)-y(27)+y(16))+params(29)*y(31)+y(79));
  residual(5)=(y(83))-(y(40)*(1-T(3))+T(3)*y(69)+y(78)*params(12)*T(3)*T(7));
  residual(6)=(y(69))-(y(78)+1/(1+T(9))*(1/T(8)*y(67)+y(26)+y(112)*T(9)));
  residual(7)=(y(68))-(y(76)+params(15)/params(39)/(1+params(15)/params(39))*y(25)+1/(1+params(15)/params(39))*y(111)+(y(71)-y(114))*T(6)-T(4)*(y(74)-y(115)));
  T(11)=(1-params(22))*(1-params(22)*T(9))/params(22)/(1+(params(18)-1)*params(3));
  residual(8)=(y(72))-(y(80)+1/(1+params(21)*T(9))*(params(21)*y(29)+y(115)*T(9)+y(63)*T(11)));
  T(12)=1/(1+(params(24)-1)*params(1))*(1-params(20))*(1-params(20)*T(9))/(params(20)*(1+T(9)));
  residual(9)=(y(73))-(y(81)+y(30)*1/(1+T(9))+y(116)*T(9)/(1+T(9))+y(29)*params(19)/(1+T(9))-y(72)*(1+params(19)*T(9))/(1+T(9))+y(115)*T(9)/(1+T(9))+(params(23)*y(71)+1/(1-params(15)/params(39))*y(68)-T(10)*y(25)-y(73))*T(12));
  residual(10)=(y(64))-(1/(params(10)/(1-params(10)))*y(65));
  residual(11)=(y(67))-(y(76)*1/T(4)+y(115)-y(74)+y(108)*T(2)/T(1)+y(110)*(1-params(13))/T(1));
  residual(12)=(y(70))-(params(18)*(y(75)+params(9)*y(66)+(1-params(9))*y(71)));
if nargout > 3
    g1_v = NaN(54, 1);
g1_v(1)=params(27);
g1_v(2)=(-params(29));
g1_v(3)=(-1);
g1_v(4)=(-(1-T(3)));
g1_v(5)=(-(1/(1+T(9))));
g1_v(6)=(-(params(15)/params(39)/(1+params(15)/params(39))));
g1_v(7)=(-(T(12)*(-T(10))));
g1_v(8)=(-(params(21)*1/(1+params(21)*T(9))));
g1_v(9)=(-(params(19)/(1+T(9))));
g1_v(10)=(-(1/(1+T(9))));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=(-(params(18)*params(9)));
g1_v(14)=(-1);
g1_v(15)=(-(T(2)*T(5)));
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=(-((1-params(29))*params(28)+params(27)));
g1_v(19)=1;
g1_v(20)=1;
g1_v(21)=T(4);
g1_v(22)=1;
g1_v(23)=1;
g1_v(24)=(-(params(39)*T(3)*T(5)));
g1_v(25)=(-T(3));
g1_v(26)=1;
g1_v(27)=(-(1-params(38)-params(39)*T(3)*T(5)));
g1_v(28)=1;
g1_v(29)=(-(1/(1-params(15)/params(39))*T(12)));
g1_v(30)=(-(params(26)*(1-params(29))));
g1_v(31)=1;
g1_v(32)=(1+params(19)*T(9))/(1+T(9));
g1_v(33)=(-1);
g1_v(34)=(-(1/(1+params(21)*T(9))*(1-params(9))*T(11)));
g1_v(35)=1+T(12);
g1_v(36)=1;
g1_v(37)=(-(1/(1+params(21)*T(9))*params(9)*T(11)));
g1_v(38)=(-(1/(params(10)/(1-params(10)))));
g1_v(39)=(-(1/T(8)*1/(1+T(9))));
g1_v(40)=1;
g1_v(41)=(-1);
g1_v(42)=(-T(6));
g1_v(43)=(-(params(23)*T(12)));
g1_v(44)=(-(params(18)*(1-params(9))));
g1_v(45)=(-(T(9)*1/(1+T(9))));
g1_v(46)=(-(1/(1+params(15)/params(39))));
g1_v(47)=(-T(4));
g1_v(48)=(-(T(9)*1/(1+params(21)*T(9))));
g1_v(49)=(-(T(9)/(1+T(9))));
g1_v(50)=(-1);
g1_v(51)=(-(T(9)/(1+T(9))));
g1_v(52)=(-(T(2)/T(1)));
g1_v(53)=(-((1-params(13))/T(1)));
g1_v(54)=T(6);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 36);
end
end
