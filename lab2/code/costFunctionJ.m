function J = costFunctionJ(X, y, theta)

m = size(X,1);
J = 1 / m * (-y' * log(g(X * theta)) - (1 - y)' * log(1 - g(X * theta)));