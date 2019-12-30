function index=kmeans(X,k)
close all;
[m,n] = size(X);
iter = 0;
% 初始化k个均值向量
mu = zeros(k,n);
previous_mu = mu;
R = randperm(m,k);
for i = 1:k
    mu(i,:) = X(R(i),:);
end
while true
    iter = iter + 1;
    % 对每一个样本找到离它最近的中心点，E步
    index = zeros(m,1);
    distance = zeros(1,k);
    for i = 1:m
        for j = 1:k
            distance(j) = norm(X(i,:) - mu(j,:)); % 计算矩阵的2-范数
        end
        [~, index(i)] = min(distance);
    end
    % 更新k个均值向量，M步
    for i = 1:k
        idx = find(index == i);
        number = length(idx);
        mu(i,:) = sum(X(idx,:)) / number;
    end
    % 如果均值向量和先前的一样，跳出循环
    if sum(abs(previous_mu - mu)) == 0
        break;
    end
    previous_mu = mu;
    % 绘图
    figure(iter);
    palette = hsv(k);
    colors = palette(index, :);
    scatter(X(:,1),X(:,2),15,colors);
    hold on;
    plot(mu(:,1),mu(:,2),'x','MarkerEdgeColor','k','MarkerSize',10);
end
