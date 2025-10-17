x = [1.5, 2.2, 3.1, 4.6, 5.7, 6.3, 9.4];
y = [2.3, 3.9, 4.3, 7.2, 4.5, 6.1, 1.1];
plot(x, y, "r*--")

h = [10, 1, 0.1 0.01, 0.001, 0.0001];
func = abs(1 + h + h.^2 ./ 2 - exp(h));
loglog(h, func, h, h.^3);

t = linspace(0, 10 * pi, 10000);
a = 12;
b = 5;

x = (a + b) * cos(t) - b * cos((a/b + 1)*t);
y = (a + b) * sin(t) - b * sin((a/b + 1)*t);

plot(x, y)

t = linspace(-1, 1, 1000);

clf
hold on
for i=1:4
   plot(t, legendre(t, i))
end
hold off

