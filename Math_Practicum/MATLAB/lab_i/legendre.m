function f = legendre(t, n)
    if n == 0 
        f = 1;
    elseif n == 1
        f = t;
    else
        f = ((2 .* (n-1) + 1) .* t .* legendre(t, n - 1) - (n-1) .* legendre(t, n - 2) ) / (n -1 + 1);
    end
end