function theta = gradientDescent(X,y,theta,alpha)

% X 为数据矩阵
% y 为给定函数值向量
% theta 为函数参数
% alpha 为步长

delta = zeros(size(X,2),1);
m = size(X,1);
cost = 0;
number=0;
while true
  for i = 1 : m
    delta = delta + (theta' * X(i,:)' - y(i)) * (X(i,:)');
  end
  delta = delta / m;
  theta = theta - alpha * delta;   % 更新theta
  number = number + 1;             % 记录迭代次数   
  
  predictions = X * theta;
  sqrErrors = (predictions-y).^2;
  
  J = 1 / (2 * m) * sum(sqrErrors);
  if abs(J-cost) < 1e-12   % 代价函数减小的量小于一定值后，结束循环
      disp(number);
      break;
  end
  cost = J;
end
