function theta = gradientDescentRegularization(X,y,theta,alpha,lambda)

% X 为数据矩阵
% y 为给定函数值向量
% theta 为函数参数
% alpha 为步长
% lambda 为惩罚系数

delta = zeros(size(X,2),1);
m = size(X,1);
cost = 0;
number=0;
while true
  for i = 1 : m
    delta = delta + (theta' * X(i,:)' - y(i)) * (X(i,:)');
  end
  delta = delta / m;
  temp = theta(1,1);
  theta = theta * (1 - alpha * lambda / m) - alpha * delta;
  theta(1,1) = temp - alpha * delta(1,1);
  number = number + 1;
  
  predictions = X * theta;
  sqrErrors = (predictions-y).^2;
  
  J = 1 / (2 * m) * sum(sqrErrors);
  if abs(J-cost) < 1e-12
      disp(number);
      break;
  end
  cost = J;
end
