function x = CGRegularization(X,y,lambda)

columns = size(X,2);
temp = eye(columns);
temp(1,1) = 0;

A = X' * X + lambda * temp;
b = X' * y;

x = zeros(size(A,1),1);
r = b - A * x;
p = r;

 for k = 1 : size(A,1)
     if r == 0 
        break;
    end
    alpha = (r' * r) / ((A * p)' * p);
    x = x + alpha * p;
    temp = r' * r;
    r = r - alpha * A * p;
    belta = r' * r / temp;
    p = r + belta * p;
 end
    