function [R1, R2] = productData()

number = 100;                % �������ݸ���
mu = [2 3];                  % �������ݵľ�ֵ
sigma = [1 0;0 2];           % ���ݵ�Э�������
R1 = mvnrnd(mu, sigma, number); % y = 0
plot(R1(:,1),R1(:,2),'+');
hold on;

mu = [4 5];
sigma = [1 0; 0 2];
R2 = mvnrnd(mu, sigma, number); % y = 1
plot(R2(:,1),R2(:,2),'*');