function index=GMM(X, k)
close all;
[m,n] = size(X);
iter = 0;
% 初始化
previous_LLD = 0;
alpha = zeros(1,k) + 1 / k;
mu = zeros(k,n);
R = randperm(m,k);
for i = 1:k
    mu(i,:) = X(R(i),:);
end
sigma = cell(1,k);
for i = 1:k
    sigma{1,i} = diag(zeros(1,n)+0.1);
end
px = zeros(m, k);
while true
    iter = iter + 1;
    % 算法E步，计算每个样本属于每个高斯成分的后验概率
    for i = 1:k
        px(:,i) = mvnpdf(X,mu(i,:),sigma{1,i});
    end
    gamma = repmat(alpha, m, 1) .* px;
    gamma = gamma ./ repmat(sum(gamma,2),1,k);
    % 绘图
    index = zeros(m,1);
    for i = 1:m
        [~,index(i)] = max(gamma(i,:));
    end
    figure(iter);
    palette = hsv(k);
    colors = palette(index, :);
    scatter(X(:,1),X(:,2),15,colors);
    hold on;
    % 算法M步，更新模型参数，使得LLD最大
    Nk = sum(gamma,1);
    temp = gamma' * X;
    for i = 1:k
        mu(i,:) = temp(i,:) / Nk(:,i);   % 更新mu
    end
    for i = 1:k
        XminusMu = X - repmat(mu(i,:),m,1);
        sigma{1,i} = XminusMu' * diag(gamma(:,i)) * XminusMu / Nk(:,i); % 更新sigma
    end
    alpha = Nk / m; % 更新alpha
    % 绘图，均值向量落点
    plot(mu(:,1),mu(:,2),'x','MarkerEdgeColor','k','MarkerSize',10);
    % 停止条件，如果LLD增加很少，则停止
    LLD = sum(log(alpha * px'));
    if abs(LLD - previous_LLD) < 1e-6
        break;
    end
    previous_LLD = LLD;
end