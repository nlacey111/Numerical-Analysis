% Calculate and print, to 16 digits, the least squares coefficient vector x by the following methods:
% Normal equations, QR by modified gram-schmidt, x = A\b, and SVD. 

m = 50;
n = 12;
t = linspace(0,1,m);

A = fliplr(vander(t));
A = A(:, 1:(n));

b = cos(4*t).';

%a) formation and solution of the normal equations
R = chol(A.'*A);
w = R.'\A.'*b;
parta = R\w;

%b) QR facotrization - modified gram schmidt 
[Q,R] = mgs(A);
p = Q.'*b;
partb = R\p;

%e) \
parte = A\b;

%f) SVD
[U,S,V] = svd(A);
left = S*V.';
right = U.'*b;
partf = left\right;

% print to nice table
everythingelse = [parta, partb, parte, partf];
a2t = array2table(everythingelse,"VariableNames",["Normal Equations", "QR Factorization", "\","SVD"]);






