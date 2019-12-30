function X = productData()

number=100;
mu=[0 0];
sigma=diag([4 5]);

X = mvnrnd(mu, sigma, number);
scatter3(X(:,1),X(:,2),X(:,1).^2);
X = [X X(:,1).^2];
X = X';