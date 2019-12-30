function theta = gradientDescent(X, y, theta, alpha)

m = size(X,1);% 样本的数量
number = 0;   % 记录迭代次数
J = zeros(1); % 记录损失函数值
while true
    theta = theta - alpha / m * X' * (g(X * theta) - y);
    number = number + 1;
    J(number) = costFunctionJ(X, y, theta);
    if number > 1 && abs(J(number) - J(number - 1)) < 1e-7
        disp(number);
        figure(2)
        plot(1:number,J);
        break;
    end
end