function [xk, k] = gauss_seidel(A,b, tol)
n = size(A, 1);
k = 0;
currenterror = inf;
xk1 = [0;0;0];
answer = [1;1;1];

while currenterror > tol
    xk = xk1;
    for i = 1:n 
        asum = 0;
        for j = 1:(i-1)
            asum = asum + A(i,j)*xk1(j);
        end
        for j = (i+1):n
            asum = asum + A(i,j)*xk(j);
        end
        xk1(i) = (1/A(i,i))*(b(i) - asum);
    end
    k = k+1;
    currenterror = norm(xk1 - answer);
    
end













