function theta = normalEquationRegularization(X,y,lambda)

% lambda 为惩罚系数

columns = size(X,2);
temp = eye(columns);
temp(1,1) = 0;

theta = pinv(X' * X - lambda * temp) * X' * y;