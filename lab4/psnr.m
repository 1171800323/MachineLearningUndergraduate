function psnr()
 
img=imread('2.tiff');
[h, w]=size(img);

% 将原始图片缩放到64*64
img=imresize(img,[floor(h/4) floor(w/4)]);
img = im2double(img);
[h, w]=size(img);
% 绘制缩放后的图片
imshow(img);

X = img(:);
% 降到一维
d = 1;
[~,Y,P]=PCA(X, d);
% 重建
result = P*Y;
imgn = zeros(size(img));
theEnd = 0;
for i = 1:size(img)
    begin = theEnd+1;
    theEnd = i * size(img,1);
    imgn(:,i) = result(begin:theEnd,1);
end
% 绘制重建后的图片
figure(2);
imshow(imgn);

B=8;                %编码一个像素用多少二进制位
MAX=2^B-1;          %图像有多少灰度级
MES=sum(sum((img-imgn).^2))/(h*w);     %均方差
disp(MES);
PSNR=20*(log10(MAX)-log10(sqrt(MES)));           %峰值信噪比
disp(PSNR)