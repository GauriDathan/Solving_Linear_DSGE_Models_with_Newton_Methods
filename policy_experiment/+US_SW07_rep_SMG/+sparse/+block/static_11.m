function [y, T] = static_11(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(1)=y(28)+params(4);
  y(42)=y(29);
  y(43)=y(42);
  y(2)=y(31)+params(6);
  y(41)=y(29)+y(29)+y(42)+y(43);
  y(3)=params(5)+y(29);
end
