clear all

figure;
A = [1 1 ; 1 1];

subplot(1,2,1)

[U,S,rightsingular] = svd(A);

%plot unit circle
cplot = @(r,x0,y0) plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-');
cplot(1,0,0)
hold on 

plot([0,rightsingular(1)],[0, rightsingular(3)])
plot([0,rightsingular(2)],[0, rightsingular(4)])

labels = {'v1','v2'};
plot([rightsingular(1), rightsingular(3)],[rightsingular(2), rightsingular(4)],'o')
text([rightsingular(1), rightsingular(3)],[rightsingular(2), rightsingular(4)],labels,'VerticalAlignment','bottom','HorizontalAlignment','right')
axis([-1.3 1.3 -1.3 1.3])
pbaspect([1 1 1])

%% 

subplot(1,2,2)
theta = linspace(0, 2*pi);
x = cos(theta);
y = sin(theta);

ellipse_point = A*[x;y];

plot(ellipse_point(1,:), ellipse_point(2,:))
hold on
plot([0,S(1)*U(1)],[0, S(1)*U(2)])
hold on 
plot([0, S(4)*U(3)], [0, S(4)*U(4)])

labels = {'sigma1*u1','sigma2*u2'};
plot([S(1)*U(1), S(4)*U(3)],[S(1)*U(2), S(4)*U(4)],'o')
text([S(1)*U(1), S(4)*U(3)],[S(1)*U(2), S(4)*U(4)],labels,'VerticalAlignment','bottom','HorizontalAlignment','right')

axis padded
pbaspect([1 1 1])










