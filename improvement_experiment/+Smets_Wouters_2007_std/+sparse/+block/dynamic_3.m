function [y, T, residual, g1] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(12, 1);
  y(60)=params(9)*y(62)+(1-params(9))*y(70)-y(72);
  residual(1)=(y(63))-(y(61)+y(40));
  residual(2)=(y(67))-(y(74)+y(65)*(1-params(39)-(1+params(38)/100)*T(5)*T(6))+y(66)*(1+params(38)/100)*T(5)*T(6)+y(61)*T(4)*T(6));
  residual(3)=(y(67))-(params(17)*(y(72)+params(9)*y(63)+(1-params(9))*y(68)));
  residual(4)=(y(71))-(y(69)*params(25)*(1-params(28))+(1-params(28))*params(27)*(y(67)-y(56))+params(26)*(y(67)-y(56)-y(27)+y(16))+params(28)*y(31)+y(76));
  residual(5)=(y(80))-(y(40)*(1-T(5))+y(66)*T(5)+y(75)*params(11)*T(8)*T(5));
  residual(6)=(y(66))-(y(75)+1/(1+T(11))*(y(64)*1/T(9)+y(26)+y(106)*T(11)));
  residual(7)=(y(65))-(y(73)+y(25)*T(2)+y(105)*1/(1+params(14)/(1+params(38)/100))+(y(68)-y(108))*T(7)-(y(71)-y(109))*T(1));
  T(14)=(1-params(21))*(1-params(21)*T(11))/params(21)/(1+(params(17)-1)*params(3));
  residual(8)=(y(69))-(y(77)+1/(1+params(20)*T(11))*(params(20)*y(29)+y(109)*T(11)+y(60)*T(14)));
  T(15)=1/(1+(params(23)-1)*params(1))*(1-params(19))*(1-params(19)*T(11))/(params(19)*(1+T(11)));
  residual(9)=(y(70))-(y(78)+y(30)*1/(1+T(11))+y(110)*T(11)/(1+T(11))+y(29)*params(18)/(1+T(11))-y(69)*(1+params(18)*T(11))/(1+T(11))+y(109)*T(11)/(1+T(11))+(params(22)*y(68)+y(65)*T(12)-y(25)*T(13)-y(70))*T(15));
  residual(10)=(y(61))-(1/(params(10)/(1-params(10)))*y(62));
  residual(11)=(y(62))-(y(70)+y(68)-y(63));
  residual(12)=(y(64))-(y(109)-y(71)+y(73)*1/T(1)+y(102)*T(4)/T(3)+y(104)*(1-params(12))/T(3));
if nargout > 3
    g1_v = NaN(54, 1);
g1_v(1)=params(26);
g1_v(2)=(-params(28));
g1_v(3)=(-1);
g1_v(4)=(-(1-T(5)));
g1_v(5)=(-(1/(1+T(11))));
g1_v(6)=(-T(2));
g1_v(7)=(-(T(15)*(-T(13))));
g1_v(8)=(-(params(20)*1/(1+params(20)*T(11))));
g1_v(9)=(-(params(18)/(1+T(11))));
g1_v(10)=(-(1/(1+T(11))));
g1_v(11)=1;
g1_v(12)=(-(params(17)*params(9)));
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=(-(T(4)*T(6)));
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=(-((1-params(28))*params(27)+params(26)));
g1_v(20)=1;
g1_v(21)=T(1);
g1_v(22)=1;
g1_v(23)=1;
g1_v(24)=(-((1+params(38)/100)*T(5)*T(6)));
g1_v(25)=(-T(5));
g1_v(26)=1;
g1_v(27)=(-(1-params(39)-(1+params(38)/100)*T(5)*T(6)));
g1_v(28)=1;
g1_v(29)=(-(T(12)*T(15)));
g1_v(30)=(-(params(25)*(1-params(28))));
g1_v(31)=1;
g1_v(32)=(1+params(18)*T(11))/(1+T(11));
g1_v(33)=(-(1/(1+params(20)*T(11))*(1-params(9))*T(14)));
g1_v(34)=1+T(15);
g1_v(35)=(-1);
g1_v(36)=(-(1/(1+params(20)*T(11))*params(9)*T(14)));
g1_v(37)=(-(1/(params(10)/(1-params(10)))));
g1_v(38)=1;
g1_v(39)=(-(params(17)*(1-params(9))));
g1_v(40)=(-T(7));
g1_v(41)=(-(params(22)*T(15)));
g1_v(42)=(-1);
g1_v(43)=(-(1/T(9)*1/(1+T(11))));
g1_v(44)=1;
g1_v(45)=(-(T(11)*1/(1+T(11))));
g1_v(46)=(-(1/(1+params(14)/(1+params(38)/100))));
g1_v(47)=(-T(1));
g1_v(48)=(-(T(11)*1/(1+params(20)*T(11))));
g1_v(49)=(-(T(11)/(1+T(11))));
g1_v(50)=(-1);
g1_v(51)=(-(T(11)/(1+T(11))));
g1_v(52)=(-(T(4)/T(3)));
g1_v(53)=T(7);
g1_v(54)=(-((1-params(12))/T(3)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 36);
end
end
