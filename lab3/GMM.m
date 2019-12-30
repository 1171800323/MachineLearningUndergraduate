function index=GMM(X, k)
close all;
[m,n] = size(X);
iter = 0;
% ��ʼ��
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
    % �㷨E��������ÿ����������ÿ����˹�ɷֵĺ������
    for i = 1:k
        px(:,i) = mvnpdf(X,mu(i,:),sigma{1,i});
    end
    gamma = repmat(alpha, m, 1) .* px;
    gamma = gamma ./ repmat(sum(gamma,2),1,k);
    % ��ͼ
    index = zeros(m,1);
    for i = 1:m
        [~,index(i)] = max(gamma(i,:));
    end
    figure(iter);
    palette = hsv(k);
    colors = palette(index, :);
    scatter(X(:,1),X(:,2),15,colors);
    hold on;
    % �㷨M��������ģ�Ͳ�����ʹ��LLD���
    Nk = sum(gamma,1);
    temp = gamma' * X;
    for i = 1:k
        mu(i,:) = temp(i,:) / Nk(:,i);   % ����mu
    end
    for i = 1:k
        XminusMu = X - repmat(mu(i,:),m,1);
        sigma{1,i} = XminusMu' * diag(gamma(:,i)) * XminusMu / Nk(:,i); % ����sigma
    end
    alpha = Nk / m; % ����alpha
    % ��ͼ����ֵ�������
    plot(mu(:,1),mu(:,2),'x','MarkerEdgeColor','k','MarkerSize',10);
    % ֹͣ���������LLD���Ӻ��٣���ֹͣ
    LLD = sum(log(alpha * px'));
    if abs(LLD - previous_LLD) < 1e-6
        break;
    end
    previous_LLD = LLD;
end