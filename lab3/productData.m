function X = productData()

number = 100;                % 产生数据个数

mu = [1 3];                  % 生成数据的均值
sigma = [1 0.5;0.5 2];           % 数据的协方差矩阵
R1 = mvnrnd(mu, sigma, number);
scatter(R1(:,1),R1(:,2));
hold on;
mu = [5 7];
sigma = [1 0.8; 0.8 2];
R2 = mvnrnd(mu, sigma, number);
scatter(R2(:,1),R2(:,2));
mu = [6 1];
sigma = [1 0.5;0.5 1];
R3 = mvnrnd(mu, sigma, number);
scatter(R3(:,1),R3(:,2));
X = [R1;R2;R3];
