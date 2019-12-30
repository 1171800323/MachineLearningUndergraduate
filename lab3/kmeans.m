function index=kmeans(X,k)
close all;
[m,n] = size(X);
iter = 0;
% ��ʼ��k����ֵ����
mu = zeros(k,n);
previous_mu = mu;
R = randperm(m,k);
for i = 1:k
    mu(i,:) = X(R(i),:);
end
while true
    iter = iter + 1;
    % ��ÿһ�������ҵ�������������ĵ㣬E��
    index = zeros(m,1);
    distance = zeros(1,k);
    for i = 1:m
        for j = 1:k
            distance(j) = norm(X(i,:) - mu(j,:)); % ��������2-����
        end
        [~, index(i)] = min(distance);
    end
    % ����k����ֵ������M��
    for i = 1:k
        idx = find(index == i);
        number = length(idx);
        mu(i,:) = sum(X(idx,:)) / number;
    end
    % �����ֵ��������ǰ��һ��������ѭ��
    if sum(abs(previous_mu - mu)) == 0
        break;
    end
    previous_mu = mu;
    % ��ͼ
    figure(iter);
    palette = hsv(k);
    colors = palette(index, :);
    scatter(X(:,1),X(:,2),15,colors);
    hold on;
    plot(mu(:,1),mu(:,2),'x','MarkerEdgeColor','k','MarkerSize',10);
end
