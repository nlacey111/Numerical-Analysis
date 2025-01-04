% for the ode: -u''(x) = f(x), x in [0,1], with homogeneous BCs, empirically confirm that the numerical scheme
% - D+D- u_j = f_j is second order convergent. 

%algorithm 
scaled_error = zeros(1,1000);
for M=1:1000
    h = 1/(M+1);
    xjs = ndgrid(0:h:1);
    xjs = xjs(2:M+1);
    
    f =  ( -2*pi*cos(pi*xjs) + pi^2*xjs.*sin(pi*xjs));
    mOnes = ones(M, 1);

    A = 1/h^2 * (diag(2 * mOnes, 0) - diag(mOnes(1:M-1), -1) - diag(mOnes(1:M-1), 1));
    u = A\f; 
    u_sol = xjs.*sin(pi*xjs);
    
    scaled_error(M) =  sqrt(h)*norm(u - u_sol);
end
M = 1:1000;
h = 1./(M+1);
loglog(h ,scaled_error)
hold on 
loglog(h, (h).^2)











