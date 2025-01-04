ndim = 1000;
scaled_error = zeros(1,ndim);
for M=5:ndim
    h = 1/(M+1);
    xjs = ndgrid(0:h:1);
    xjs = xjs(2:M+1);
    
    f = pi*(kappaprime(xjs).*cos(pi*xjs)+ kappa(xjs)*(-pi).*sin(pi*xjs));
    A = zeros(M);
    A = 1/h^2 * (diag(kappa(xjs(2:end)-.5*h),-1) + diag(-(kappa(xjs+.5*h)+kappa(xjs-.5*h)),0) + diag(kappa(xjs(1:end-1)+.5*h),1));

    u = A\f;
    u_sol = sin(pi*xjs);
    
    scaled_error(M) =  sqrt(h)*norm(u - u_sol);
end
M = 1:ndim;
h = 1./(M+1);
loglog(h ,scaled_error)
hold on 
loglog(h, (h).^2)

function [kx] = kappa(x)
summ = 2;
    for l = 1:5
        summ = summ + (1/(l+1))*sin(l*pi*x);
    end
    kx = summ;
end

function [kxp] = kappaprime(x)
summ = 0;
    for l = 1:5
        summ = summ + (1/(l+1))*l*pi*cos(l*pi*x);
    end
    kxp = summ;
end





