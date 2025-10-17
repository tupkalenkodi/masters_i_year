% interpolation 1st approach
x=0:3;
y=[-5 -6 -1 16];
disp([x;y])
V=vander(x);
c=V\y'
% we obtain polynomial x^3-2x-5
xx=linspace(0,3,1000);
plot(x,y,'r*',xx,polyval(coef,xx),'g-')