function theta = gradientDescentRegularization(X,y,theta,alpha,lambda)

m = size(X,1);
cost = 0;  % ������ۺ���ֵ
number = 0;  %��¼��������
while true
    theta = theta * (1 - alpha * lambda / m) - alpha / m * X' * (g(X * theta) - y);
    J = costFunctionJ(X, y, theta);
    number = number + 1;
    if abs(J - cost) < 1e-5
        disp(number);
        break;
    end
    cost = J;
end