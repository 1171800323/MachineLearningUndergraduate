function theta = newton(X, y, theta)

m = size(X,1);
J = zeros(1);
number = 10;
for i = 1 : number
    h = g(X * theta);
    deltaJ = 1 / m * X' * (h - y);
    H = 1 / m * X' * diag(h) * diag(1 - h) * X;
    J(i) = costFunctionJ(X, y, theta);
    theta = theta - pinv(H) * deltaJ;
end
figure(3);
plot(1:number,J);