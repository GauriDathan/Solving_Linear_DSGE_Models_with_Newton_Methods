function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(19, 1);
end
[T_order, T] = Smets_Wouters_2007_std.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(160, 1);
g1_v(1)=params(7);
g1_v(2)=params(8);
g1_v(3)=(-(T(6)/(1+T(6))));
g1_v(4)=T(9);
g1_v(5)=(-T(15));
g1_v(6)=(-params(26));
g1_v(7)=(-(T(6)/(1+T(6))));
g1_v(8)=(-(T(19)*(-T(9))));
g1_v(9)=1;
g1_v(10)=(-T(15));
g1_v(11)=1;
g1_v(12)=params(26);
g1_v(13)=1;
g1_v(14)=(-(params(20)*T(17)));
g1_v(15)=(-(params(18)/(1+T(14))));
g1_v(16)=(-T(15));
g1_v(17)=1;
g1_v(18)=(-params(28));
g1_v(19)=(-params(29));
g1_v(20)=(-params(31));
g1_v(21)=(-params(32));
g1_v(22)=(-params(34));
g1_v(23)=(-params(35));
g1_v(24)=(-params(36));
g1_v(25)=(-params(37));
g1_v(26)=(-1);
g1_v(27)=(-(1-T(12)));
g1_v(28)=(-1);
g1_v(29)=(-(1-T(12)));
g1_v(30)=1;
g1_v(31)=1;
g1_v(32)=1;
g1_v(33)=1;
g1_v(34)=1;
g1_v(35)=1;
g1_v(36)=1;
g1_v(37)=(-1);
g1_v(38)=1;
g1_v(39)=(-1);
g1_v(40)=1;
g1_v(41)=1;
g1_v(42)=(-1);
g1_v(43)=(-((T(11)-(1-params(12)))*T(13)));
g1_v(44)=(-params(9));
g1_v(45)=(-T(3));
g1_v(46)=1;
g1_v(47)=1;
g1_v(48)=1;
g1_v(49)=(-(params(17)*params(9)));
g1_v(50)=(-(1/T(5)*T(15)));
g1_v(51)=1;
g1_v(52)=1;
g1_v(53)=(-(1-params(39)-T(1)*T(12)*T(13)));
g1_v(54)=(-T(8));
g1_v(55)=1;
g1_v(56)=(-(T(1)*T(12)*T(13)));
g1_v(57)=(-T(12));
g1_v(58)=1;
g1_v(59)=1;
g1_v(60)=(-((-((1-params(28))*params(27)))-params(26)));
g1_v(61)=(-1);
g1_v(62)=(-T(16));
g1_v(63)=(-(params(17)*(1-params(9))));
g1_v(64)=(-params(22));
g1_v(65)=(-(1-params(9)));
g1_v(66)=(-1);
g1_v(67)=1;
g1_v(68)=1;
g1_v(69)=T(7);
g1_v(70)=1;
g1_v(71)=(-(T(17)*T(18)));
g1_v(72)=1;
g1_v(73)=(-1);
g1_v(74)=(-((T(11)-(1-params(12)))*T(13)));
g1_v(75)=(-params(9));
g1_v(76)=(-T(3));
g1_v(77)=1;
g1_v(78)=1;
g1_v(79)=1;
g1_v(80)=(-(params(17)*params(9)));
g1_v(81)=(-(1/T(5)*T(15)));
g1_v(82)=1;
g1_v(83)=1;
g1_v(84)=(-(1-params(39)-T(1)*T(12)*T(13)));
g1_v(85)=(-(T(8)*T(19)));
g1_v(86)=(-1);
g1_v(87)=1;
g1_v(88)=(-(T(1)*T(12)*T(13)));
g1_v(89)=(-T(12));
g1_v(90)=(-1);
g1_v(91)=1;
g1_v(92)=1;
g1_v(93)=(-((1-params(28))*params(27)+params(26)));
g1_v(94)=(-1);
g1_v(95)=(-1);
g1_v(96)=(-T(16));
g1_v(97)=(-(params(17)*(1-params(9))));
g1_v(98)=(-(params(22)*T(19)));
g1_v(99)=(-1);
g1_v(100)=1;
g1_v(101)=(1+params(18)*T(14))/(1+T(14));
g1_v(102)=(-(params(25)*(1-params(28))));
g1_v(103)=(-1);
g1_v(104)=(-(1-params(9)));
g1_v(105)=(-1);
g1_v(106)=1+T(19);
g1_v(107)=(-1);
g1_v(108)=1;
g1_v(109)=T(7);
g1_v(110)=1;
g1_v(111)=(-1);
g1_v(112)=1;
g1_v(113)=(-params(17));
g1_v(114)=1;
g1_v(115)=(-params(17));
g1_v(116)=1;
g1_v(117)=(-(1/T(7)));
g1_v(118)=(-1);
g1_v(119)=(-(1/T(7)));
g1_v(120)=(-1);
g1_v(121)=1;
g1_v(122)=(-1);
g1_v(123)=(-1);
g1_v(124)=1;
g1_v(125)=(-1);
g1_v(126)=(-(T(5)*T(12)));
g1_v(127)=(-1);
g1_v(128)=1;
g1_v(129)=(-(params(11)*T(4)*T(12)));
g1_v(130)=(-1);
g1_v(131)=1;
g1_v(132)=(-1);
g1_v(133)=1;
g1_v(134)=(-1);
g1_v(135)=1;
g1_v(136)=1;
g1_v(137)=1;
g1_v(138)=(-((T(11)-(1-params(12)))/T(11)));
g1_v(139)=(-((1-params(12))/T(11)));
g1_v(140)=(-(1/(1+T(6))));
g1_v(141)=(-(T(14)*T(15)));
g1_v(142)=T(16);
g1_v(143)=(-((T(11)-(1-params(12)))/T(11)));
g1_v(144)=(-((1-params(12))/T(11)));
g1_v(145)=(-(1/(1+T(6))));
g1_v(146)=(-(T(14)*T(15)));
g1_v(147)=T(16);
g1_v(148)=(-1);
g1_v(149)=(-T(7));
g1_v(150)=(-(T(14)*T(17)));
g1_v(151)=(-(T(14)/(1+T(14))));
g1_v(152)=(-(T(14)/(1+T(14))));
g1_v(153)=(-params(40));
g1_v(154)=(-(params(40)*params(2)));
g1_v(155)=(-params(41));
g1_v(156)=(-params(42));
g1_v(157)=(-params(43));
g1_v(158)=(-params(44));
g1_v(159)=(-params(45));
g1_v(160)=(-params(46));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 40, 127);
end
