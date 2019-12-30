function [mu,Y,P]=PCA(X, d)

% 设有m条n维数据，则X应为n行m列
% d，为降维后的维度
% mu，为X的每一行求均值形成的n维列向量
% Y，是降维到d维后的数据
% P，d个主成分

[~,m] = size(X);
mu = mean(X,2);
if size(X,2) > 1
    X = X - repmat(mu,1,m);  % 零均值化
end
sigma = 1/m * (X * X');  % 协方差矩阵
[U,S,~] = svd(sigma);    % 特征值分解，U(:,i)为特征向量，S(i,i)为特征值
% disp(S);
% disp(U);
P = U(:,1:d);  % 取U前d个最大的特征值对应的特征向量（svd分解后U默认按特征值降序排列）
Y = P' * X;    % 降维到d维后的数据

J = 0;
for i=1:d
    J = J+S(i,i);
end
J = J / sum(sum(S)); % 最小化误差角度，此处J应该越大，1-J越小，重建后失真越小
disp(J);