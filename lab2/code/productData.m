function [R1, R2] = productData()

number = 100;                % 产生数据个数
mu = [2 3];                  % 生成数据的均值
sigma = [1 0;0 2];           % 数据的协方差矩阵
R1 = mvnrnd(mu, sigma, number); % y = 0
plot(R1(:,1),R1(:,2),'+');
hold on;

mu = [4 5];
sigma = [1 0; 0 2];
R2 = mvnrnd(mu, sigma, number); % y = 1
plot(R2(:,1),R2(:,2),'*');