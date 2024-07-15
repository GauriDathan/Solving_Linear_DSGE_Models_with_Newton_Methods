function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(75)=params(30)*y(32)+x(1);
  y(76)=params(31)*y(33)+x(2);
  y(77)=params(32)*y(34)+x(4)+x(1)*params(2);
  y(78)=params(33)*y(35)+x(3);
  y(79)=params(34)*y(36)+x(5);
  y(52)=x(6);
  y(51)=x(7);
  y(80)=params(35)*y(37)+y(52)-params(8)*y(9);
  y(81)=params(36)*y(38)+y(51)-params(7)*y(8);
end
