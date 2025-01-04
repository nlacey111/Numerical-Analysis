% Consider the polynomial p(x) = (x-2)^9, plot P for different values of x, evaluating p via its coefficients and the expression (x-2)^9. 

clear all

t = linspace(1.920,2.080,(2.080-1.920)*1000);
coefficients = [1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];
p1 = polyval(coefficients, t);
plot(t, p1);

hold on
p2 = (t -2).^9;
plot(t, p2);

title("Coefficients and Actual Comparison")
legend("Coefficient Evaluation", "Actual", "Location","northwest")


