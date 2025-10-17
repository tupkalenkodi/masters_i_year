% function that evaluates vector of divided differences=d for Hermite 
% inrepolating polynomial 

% input: X - vector of x coordinates, Y - vector of y coordinates,
% DY - vector of y coordinates for the derivative
function d = divided_difference(X, Y, DY)
    n = length(X);
    d = zeros(2 * n, 1);
    
    XX = zeros(2*n, 1);
    for i=1:n
        XX(2*i) = X(i);
        XX(2*i-1) = X(i);
        d(2*i) = Y(i);
        d(2*i-1) = Y(i);
    end
    % after this step d = {f(x_0), f(x_0), f(x_1), f(x_1), ...}
    
    d(2) = DY(1);
    for j=2:n
        d(2*j) = DY(j);
        d(2*j -1) = (Y(j) - Y(j-1)) / (X(j) - X(j-1));
    end
    % after this step d = {f(x_0), f'(x_0), f(x_1) - f(x_0) / x_1 - x_0, 
    % f'(x_1), ...}
    
    % outer loop is for the remaining columns and the inner is for the
    % rows
    for k=3:2*n
        for j=2*n:-1:k
            d(j) = (d(j) - d(j-1)) / (XX(j) - XX(j-k+1));
        end
    end

end