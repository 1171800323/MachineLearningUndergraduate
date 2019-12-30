function [X,x,z] = productData(N,Order)

% N 为产生数据的个数
% Order 为多项式的阶数

% X 为数据矩阵，N * (Order + 1)
% x 为N个数据的横坐标向量
% z 为增加高斯噪声后的纵坐标向量

X = ones(N,1);
gap = 1 / N;
x = gap : gap : 1;
for i = 1 : Order
   temp = [X x(:).^i];
   X = temp;
end
y = (sin(2 * pi * x))';
z = y + 0.1*randn(N,1);