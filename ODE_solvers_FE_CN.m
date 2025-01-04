clear all

C = 3;
l = 10;
u1= ((1:l) .* (-1).^(1:l))';
k= .001;

ones1 = ones(l, 1);
A = C^2*(- diag(2 * ones1, 0) + diag(ones1(1:l-1), -1) + diag(ones1(1:l-1), 1));

% forward euler
T1 = 0;
while T1 <1 
    u1 = (k*A + eye(l))*u1;
    T1 = T1 + k;
end

%crank nicolson
u2 = ((1:l) .* (-1).^(1:l))';
T2 = 0 ;
while T2 < 1
    u2 = (eye(l) - (k/2)*A)\(u2 + (k/2)*A*u2);
    T2 = T2 +k;
end
