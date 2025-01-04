clear all 

m = 2^5;
n1 = sqrt(m);
%u1= exp( sin(1:l)); % initial condition

ones1 = ones(m, 1);
 % time matrix 

last = -7;
first = -1;
solution = find_solution(m,n1);

g = 1;
k = 1/m;
for n = first:-1:last
    h = 2^n;
    A = diag(ones1(1:m-1), -1) + diag(ones1(1:m-1), 1);
    %h = sqrt(k); % space discretization 
    
    u1= exp(sin(1:m)).'; 
    T1 = 0; % time 
    while T1 <1 
        u1 = inv(A)*(k/h)*A;

        T1 = T1 + k; % increase by t by time discretization
    end
    fe = norm(solution -u1  ,2);
    errorfe(g) = max(fe);
    g = g + 1;
end

kk = 2.^(last:first);
kk = flip(kk,2);

tiledlayout(1,1)
nexttile

loglog(kk , flip(errorfe))
hold on 
loglog(kk, kk)
title("Scheme Convergence in h")
legend("Scheme", "Slope = 2", "Location","southwestoutside")
