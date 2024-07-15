function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(10, 1);
  y(56)=params(17)*(y(72)+params(9)*y(52)+(1-params(9))*y(57));
  residual(1)=(y(72))-(params(9)*y(51)+(1-params(9))*y(58));
  residual(2)=(y(51))-(y(58)+y(57)-y(52));
  residual(3)=(y(52))-(y(50)+y(39));
  T(1)=(1-params(14)/(1+params(38)/100))/(params(13)*(1+params(14)/(1+params(38)/100)));
  T(2)=params(14)/(1+params(38)/100)/(1+params(14)/(1+params(38)/100));
  T(3)=(1/(1+params(6)/100))^(-1)*(1+params(38)/100)^params(13);
  T(4)=T(3)-(1-params(12));
  T(5)=1-(1-params(12))/(1+params(38)/100);
  T(6)=params(17)*((1-params(9))/params(9)*T(4)/(params(9)^params(9)*(1-params(9))^(1-params(9))/(params(17)*T(4)^params(9)))^(1/(1-params(9))))^(params(9)-1);
  T(7)=(params(13)-1)*T(6)*(1-params(9))*1/params(23)/params(9)*T(4)/(1-params(39)-(1+params(38)/100)*T(5)*T(6))/(params(13)*(1+params(14)/(1+params(38)/100)));
  residual(4)=(y(54))-(y(73)+y(14)*T(2)+y(94)*1/(1+params(14)/(1+params(38)/100))+(y(57)-y(97))*T(7)-y(59)*T(1));
  T(8)=(1+params(38)/100)^2;
  T(9)=params(11)*T(8);
  residual(5)=(y(79))-(y(39)*(1-T(5))+y(55)*T(5)+y(75)*T(9)*T(5));
  T(10)=1/(1+params(6)/100)*(1+params(38)/100)^(-params(13));
  T(11)=(1+params(38)/100)*T(10);
  residual(6)=(y(55))-(y(75)+1/(1+T(11))*(y(53)*1/T(9)+y(15)+y(95)*T(11)));
  residual(7)=(y(56))-(y(74)+y(54)*(1-params(39)-(1+params(38)/100)*T(5)*T(6))+y(55)*(1+params(38)/100)*T(5)*T(6)+y(50)*T(4)*T(6));
  T(12)=1/(1-params(14)/(1+params(38)/100));
  T(13)=params(14)/(1+params(38)/100)/(1-params(14)/(1+params(38)/100));
  residual(8)=(y(58))-(y(57)*params(22)+y(54)*T(12)-y(14)*T(13));
  residual(9)=(y(50))-(y(51)*1/(params(10)/(1-params(10))));
  residual(10)=(y(53))-(y(73)*1/T(1)-y(59)+y(91)*T(4)/T(3)+y(93)*(1-params(12))/T(3));
if nargout > 3
    g1_v = NaN(37, 1);
g1_v(1)=(-1);
g1_v(2)=(-(1-T(5)));
g1_v(3)=(-(1/(1+T(11))));
g1_v(4)=(-T(2));
g1_v(5)=T(13);
g1_v(6)=(-(1-params(9)));
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=params(17)*params(9);
g1_v(12)=(-1);
g1_v(13)=(-(T(4)*T(6)));
g1_v(14)=1;
g1_v(15)=T(1);
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=(-T(5));
g1_v(19)=1;
g1_v(20)=(-((1+params(38)/100)*T(5)*T(6)));
g1_v(21)=1;
g1_v(22)=(-(1-params(39)-(1+params(38)/100)*T(5)*T(6)));
g1_v(23)=(-T(12));
g1_v(24)=(-1);
g1_v(25)=(-T(7));
g1_v(26)=params(17)*(1-params(9));
g1_v(27)=(-params(22));
g1_v(28)=(-params(9));
g1_v(29)=1;
g1_v(30)=(-(1/(params(10)/(1-params(10)))));
g1_v(31)=(-(1/T(9)*1/(1+T(11))));
g1_v(32)=1;
g1_v(33)=(-(T(11)*1/(1+T(11))));
g1_v(34)=(-(1/(1+params(14)/(1+params(38)/100))));
g1_v(35)=T(7);
g1_v(36)=(-(T(4)/T(3)));
g1_v(37)=(-((1-params(12))/T(3)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 10, 30);
end
end