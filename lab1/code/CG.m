function x = CG(X,y)

A = X' * X; % 构造对称正定矩阵
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
    