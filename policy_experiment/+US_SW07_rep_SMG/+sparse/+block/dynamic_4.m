function [y, T] = dynamic_4(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(85)=y(29);
  y(86)=y(42);
  y(84)=y(72)+y(29)+y(42)+y(43);
  y(45)=y(74)+params(6);
  y(44)=y(71)+params(4);
  y(46)=params(5)+y(72);
  y(50)=params(37)+y(73)-y(30);
  y(49)=params(37)+y(69)-y(26);
  y(48)=params(37)+y(68)-y(25);
  y(47)=y(70)-y(27)+params(37);
end
