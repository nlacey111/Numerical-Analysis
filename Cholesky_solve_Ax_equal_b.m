% Implement the Cholesky method to solve Ax = b, where A is a symmetric positive definite matrix. 
% Suggest three test problems, and compare results with matlab's "Chol"

clear all 


A = hilb(3)
chol_ex_7(A)
b = [1; 1; 1;]

% H^T*H=A
% H^T*Hx = b
% y= Hx
% solve H^Ty = b for y 
% solve Hx = y for x

R = chol_ex_7(A.'*A);
w = R.'\(A.'*b);
ans1 = R\w

Q = chol(A.'*A);
v = Q.'\(A.'*b);
ans2 = Q\v
%% 
clear all 
A = [1, 0, 0; 0, 2, 0; 0, 0, 3];
b = [1; 1; 1;];

R = chol_ex_7(A.'*A);
w = R.'\(A.'*b);
ans1 = R\w

Q = chol(A.'*A);
v = Q.'\(A.'*b);
ans2 = Q\v
%% 

clear all
A = [1 , 1; 1, (1+10^(-14))];
b = [2; (2+10^(-14))];

R = chol_ex_7(A.'*A);
w = R.'\(A.'*b);
ans1 = R\w

Q = chol(A.'*A);
v = Q.'\(A.'*b);
ans2 = Q\v

