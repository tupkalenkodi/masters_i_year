%file for testing function polyinterp
x=0:3;
y=[-5 -6 -1 16];
u=linspace(0,3,100);
v=polyinterp(x,y,u);
plot(x,y,'r*',u,v,'b-')

%using symbolic toolbox
symx=sym('x');
P=polyinterp(x,y,symx)
pretty(P)
P=simplify(P)