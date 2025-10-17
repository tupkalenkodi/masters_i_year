function v = polyinterp(x,y,u)
%POLYINTERP(x,y,u)
%x,y are vectors that define the interpolating points
%u is a vector of points where the function is to be evaluated
%the output v has the elements v(k)=polyinterp(x,y,u(k))
%based on Lagrange basis polynomials

% degree of the interpolating polynomial
n=length(x)-1;
v=zeros(size(u));

for i=1:n+1
    w=ones(size(u));
    %define Lagrangee basis polynomials
    for j=[1:i-1,i+1:n+1]
        w=(u-x(j))./(x(i)-x(j)).*w;
    end
    v=v+w*y(i);
end

