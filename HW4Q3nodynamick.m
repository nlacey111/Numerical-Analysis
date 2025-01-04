clear all 

l=10; 
u1= exp( sin(1:l)); % initial condition

ones1 = ones(l, 1);
A = diag(ones1(1:l-1), -1) + diag(ones1(1:l-1), 1); % time matrix 

last = -10;
first = -1;

for n = first:-1:last
    vector_time(-n) = 2^n;
end

errorcalc = zeros(6,1); 

g = 1;
k=.01
    h = sqrt(k); % space discretization 
    B = - diag(((1/k) + (1/h^2)) .* ones1, 0) + diag(ones1(1:l-1)./(2*h^2), -1) + diag(ones1(1:l-1)./(2*h^2), 1); % space matrix 

    u1= exp(sin(1:l)).'; 
    T1 = 0; % time 
    while T1 <1 
        C = inv((1/k + 1/h^2).*eye(l) - 1/(2*h^2).*A);
        D = B*(u1);
        u1 = C*D;
        T1 = T1 + k; % increase by t by time discretization
    end
    
    solution = (1./sqrt(4.*pi.*[k:k:1])).*exp(-([h:h:2*pi]).^2 ./(4.*[k:k:1])); 

    fe = norm(solution -u1  ,2);
    errorfe(g) = max(fe);

    g = g + 1;


kk = 2.^(last:first);
kk = flip(kk,2);

tiledlayout(1,2)
nexttile

loglog(kk , errorfe)
hold on 
loglog(kk, kk)
title("Scheme Convergence")
legend("Scheme", "Slope = 2")

