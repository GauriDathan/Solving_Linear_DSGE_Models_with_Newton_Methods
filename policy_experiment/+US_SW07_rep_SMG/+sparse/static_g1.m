function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(16, 1);
end
[T_order, T] = US_SW07_rep_SMG.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(114, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-(1-params(7)));
g1_v(9)=1;
g1_v(10)=(-(1-params(8)));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=(-((T(1)-(1-params(13)))*T(3)));
g1_v(15)=(-params(9));
g1_v(16)=(-T(5));
g1_v(17)=1;
g1_v(18)=(-((T(1)-(1-params(13)))/T(1)));
g1_v(19)=1;
g1_v(20)=1;
g1_v(21)=(-(params(18)*params(9)));
g1_v(22)=(-(T(7)*1/T(9)));
g1_v(23)=1-(1-params(13))/T(1);
g1_v(24)=T(15);
g1_v(25)=(-(1-params(38)-T(4)));
g1_v(26)=(-T(16));
g1_v(27)=(-T(4));
g1_v(28)=(-T(2));
g1_v(29)=1;
g1_v(30)=1;
g1_v(31)=(1-params(29))*params(28);
g1_v(32)=(-1);
g1_v(33)=(-(params(18)*(1-params(9))));
g1_v(34)=(-params(23));
g1_v(35)=(-(1-params(9)));
g1_v(36)=(-1);
g1_v(37)=1;
g1_v(38)=1;
g1_v(39)=T(11);
g1_v(40)=1;
g1_v(41)=(-(1/(1+T(6)*params(21))*T(12)));
g1_v(42)=1;
g1_v(43)=(-1);
g1_v(44)=(-((T(1)-(1-params(13)))*T(3)));
g1_v(45)=(-params(9));
g1_v(46)=(-T(5));
g1_v(47)=1;
g1_v(48)=(-((T(1)-(1-params(13)))/T(1)));
g1_v(49)=1;
g1_v(50)=1;
g1_v(51)=(-(params(18)*params(9)));
g1_v(52)=(-(T(7)*1/T(9)));
g1_v(53)=1-(1-params(13))/T(1);
g1_v(54)=T(15);
g1_v(55)=(-(1-params(38)-T(4)));
g1_v(56)=(-(T(14)*T(16)));
g1_v(57)=(-T(4));
g1_v(58)=(-T(2));
g1_v(59)=1;
g1_v(60)=1;
g1_v(61)=(-((1-params(29))*params(28)));
g1_v(62)=(-1);
g1_v(63)=(-(params(18)*(1-params(9))));
g1_v(64)=(-(params(23)*T(14)));
g1_v(65)=(-1);
g1_v(66)=(-1);
g1_v(67)=(-T(11));
g1_v(68)=1-1/(1+T(6)*params(21))*(T(6)+params(21));
g1_v(69)=(-(T(13)+params(19)/(1+T(6))-(1+T(6)*params(19))/(1+T(6))));
g1_v(70)=(-(params(26)*(1-params(29))));
g1_v(71)=(-1);
g1_v(72)=(-2);
g1_v(73)=(-1);
g1_v(74)=(-(1-params(9)));
g1_v(75)=(-1);
g1_v(76)=1-(T(7)+T(13)-T(14));
g1_v(77)=1;
g1_v(78)=T(11);
g1_v(79)=1-params(29);
g1_v(80)=(-1);
g1_v(81)=1;
g1_v(82)=(-params(18));
g1_v(83)=1;
g1_v(84)=(-params(18));
g1_v(85)=1-params(30);
g1_v(86)=(-(1/T(11)));
g1_v(87)=(-1);
g1_v(88)=(-(1/T(11)));
g1_v(89)=(-1);
g1_v(90)=1-params(31);
g1_v(91)=(-1);
g1_v(92)=(-1);
g1_v(93)=1-params(32);
g1_v(94)=(-1);
g1_v(95)=(-(T(2)*T(9)));
g1_v(96)=(-1);
g1_v(97)=1-params(33);
g1_v(98)=(-(params(12)*T(2)*T(8)));
g1_v(99)=(-1);
g1_v(100)=1-params(34);
g1_v(101)=(-1);
g1_v(102)=1-params(35);
g1_v(103)=(-1);
g1_v(104)=1-params(36);
g1_v(105)=(-1);
g1_v(106)=1-(1-T(2));
g1_v(107)=(-1);
g1_v(108)=1-(1-T(2));
g1_v(109)=1;
g1_v(110)=(-1);
g1_v(111)=1;
g1_v(112)=(-1);
g1_v(113)=(-1);
g1_v(114)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 43, 43);
end
