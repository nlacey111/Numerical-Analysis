clear all 

l=100; 
u1= exp( sin(1:l)); % initial condition

ones1 = ones(l, 1);
A = diag(ones1(1:l-1), -1) + diag(ones1(1:l-1), 1); % time matrix 

last = -9;
first = -3;
solution = find_solution(l,sqrt(2^5));
for n = first:-1:last
    vector_time(-n) = 2^n;
end

g = 1;
k = .01;
for n = first:-1:last
    h = 2^n;
    %h = sqrt(k); % space discretization 
    B = - diag(((1/k) + (1/h^2)) .* ones1, 0) + diag(ones1(1:l-1)./(2*h^2), -1) + diag(ones1(1:l-1)./(2*h^2), 1); % space matrix 

    u1= exp(sin(1:l)).'; 
    T1 = 0; % time 
    while T1 <1 
        C = inv((1/k + 1/h^2).*eye(l) - 1/(2*h^2).*A);
        D = B*(u1);
        u1 = C*D;
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
