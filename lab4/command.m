function [X,Y,P,Z,U]=command()

X=readPicture();

% 降维，原始256*256，形成15 * 256矩阵
[mu,Y,P]=PCA(X, 15);
% 重建，利用15*256矩阵重建
result = P*Y+repmat(mu,1,size(X,2));
imshow(result);
calc(X,result)

% 再次降维，15*256的矩阵，形成8*15矩阵
[nmu,Z,U]=PCA(Y', 8);
% 重建，利用8*15矩阵、第一次降维后的均值向量mu和主成分P
figure(2);
result = P*(U*Z + repmat(nmu,1,size(Y,1)))'+repmat(mu,1,size(X,2));
imshow(result);

calc(X,result)

function calc(img,imgn)
[h, w]=size(img);
B=8;                %编码一个像素用多少二进制位
MAX=2^B-1;          %图像有多少灰度级
MES=sum(sum((img-imgn).^2))/(h*w);     %均方差
disp(MES);
PSNR=20*(log10(MAX)-log10(sqrt(MES)));           %峰值信噪比
disp(PSNR)