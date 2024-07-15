%% Building infos:
% Linux and gfortran (Debug)
% mex -R2018a -g -v FFLAGS='$FFLAGS -Wall -Wextra -Warray-temporaries -Wconversion -fimplicit-none -fcheck=all -fbacktrace -ffree-line-length-0 -ffpe-trap=invalid,zero,overflow,underflow -finit-real=nan' SB04QD.F ../../lib/lpkaux.a ../../lib/slicot.a ../../lib/liblapack.a ../../lib/librefblas.a
% Linux and gfortran (Release)
% mex -R2018a SB04QD.F ../../lib/lpkaux.a ../../lib/slicot.a ../../lib/liblapack.a ../../lib/librefblas.a
% Windows and ifort (Intel OneAPI Base + HPC and Visual Studio) (Debug)
% mex -R2018a -lmwblas -lmwlapack -g -v COMPFLAGS='$COMPFLAGS /Debug /traceback' SB04QD.F ../lib/lpkaux.a ../lib/slicot.a
% Windows and ifort (Intel OneAPI Base + HPC and Visual Studio) (Release)
% mex -R2018a -lmwblas -lmwlapack OPTIMFLAGS='/Od /DNDEBUG' SB04QD.F ../../lib/lpkaux.lib ../../lib/slicot.lib

format short;
num_simulations = 3;

%% Run example
N = 3;
M = 3;
A = [1.0   2.0   3.0; ...
     6.0   7.0   8.0; ...
     9.0   2.0   3.0];
B = [7.0   2.0   3.0; ... 
     2.0   1.0   2.0; ...
     3.0   4.0   1.0];
C = [271.0   135.0   147.0; ...
     923.0   494.0   482.0; ...
     578.0   383.0   287.0];

tic;
for i = 1:num_simulations
    [X Z info] = SB04QD(N,M,A,B,C);
end
timeuse = toc;
fprintf('\nTime elapsed: %3.2f\n\n', timeuse);

disp('Solution matrix X:');
disp(X(1:3,1:3));   
disp('Orthogonal matrix Z:');
disp(Z(1:3,1:3));
disp('Info:');
disp(info);