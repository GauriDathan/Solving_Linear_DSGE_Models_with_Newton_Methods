function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(10, 1);
  y(59)=params(18)*(y(75)+params(9)*y(55)+(1-params(9))*y(60));
  residual(1)=(y(75))-(params(9)*y(54)+(1-params(9))*y(61));
  residual(2)=(y(54))-(y(61)+y(60)-y(55));
  residual(3)=(y(55))-(y(53)+y(39));
  T(1)=params(11)^(-1)*params(39)^params(14);
  T(2)=T(1)-(1-params(13));
  T(3)=1-(1-params(13))/params(39);
  T(4)=(1-params(15)/params(39))/(params(14)*(1+params(15)/params(39)));
  T(5)=params(18)*((1-params(9))/params(9)*T(2)/(params(9)^params(9)*(1-params(9))^(1-params(9))/(params(18)*T(2)^params(9)))^(1/(1-params(9))))^(params(9)-1);
  T(6)=(params(14)-1)*T(5)*T(2)*(1-params(9))*1/params(24)/params(9)/(1-params(38)-params(39)*T(3)*T(5))/(params(14)*(1+params(15)/params(39)));
  residual(4)=(y(57))-(y(76)+params(15)/params(39)/(1+params(15)/params(39))*y(14)+1/(1+params(15)/params(39))*y(100)+(y(60)-y(103))*T(6)-y(62)*T(4));
  T(7)=params(39)^2;
  T(8)=T(7)*params(12);
  residual(5)=(y(82))-(y(39)*(1-T(3))+T(3)*y(58)+y(78)*T(3)*T(8));
  T(9)=params(39)*params(11)*params(39)^(-params(14));
  residual(6)=(y(58))-(y(78)+1/(1+T(9))*(1/T(8)*y(56)+y(15)+y(101)*T(9)));
  residual(7)=(y(59))-(y(77)+y(57)*(1-params(38)-params(39)*T(3)*T(5))+y(58)*params(39)*T(3)*T(5)+y(53)*T(2)*T(5));
  T(10)=params(15)/params(39)/(1-params(15)/params(39));
  residual(8)=(y(61))-(y(60)*params(23)+y(57)*1/(1-params(15)/params(39))-y(14)*T(10));
  residual(9)=(y(53))-(y(54)*1/(params(10)/(1-params(10))));
  residual(10)=(y(56))-(y(76)*1/T(4)-y(62)+y(97)*T(2)/T(1)+y(99)*(1-params(13))/T(1));
if nargout > 3
    g1_v = NaN(37, 1);
g1_v(1)=(-1);
g1_v(2)=(-(1-T(3)));
g1_v(3)=(-(1/(1+T(9))));
g1_v(4)=(-(params(15)/params(39)/(1+params(15)/params(39))));
g1_v(5)=T(10);
g1_v(6)=(-(1-params(9)));
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=params(18)*params(9);
g1_v(12)=(-1);
g1_v(13)=(-(T(2)*T(5)));
g1_v(14)=1;
g1_v(15)=T(4);
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=(-T(3));
g1_v(19)=1;
g1_v(20)=(-(params(39)*T(3)*T(5)));
g1_v(21)=1;
g1_v(22)=(-(1-params(38)-params(39)*T(3)*T(5)));
g1_v(23)=(-(1/(1-params(15)/params(39))));
g1_v(24)=(-1);
g1_v(25)=(-T(6));
g1_v(26)=params(18)*(1-params(9));
g1_v(27)=(-params(23));
g1_v(28)=(-params(9));
g1_v(29)=1;
g1_v(30)=(-(1/(params(10)/(1-params(10)))));
g1_v(31)=(-(1/T(8)*1/(1+T(9))));
g1_v(32)=1;
g1_v(33)=(-(T(9)*1/(1+T(9))));
g1_v(34)=(-(1/(1+params(15)/params(39))));
g1_v(35)=T(6);
g1_v(36)=(-(T(2)/T(1)));
g1_v(37)=(-((1-params(13))/T(1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 10, 30);
end
end
