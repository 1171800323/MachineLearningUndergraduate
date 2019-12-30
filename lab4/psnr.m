function psnr()
 
img=imread('2.tiff');
[h, w]=size(img);

% ��ԭʼͼƬ���ŵ�64*64
img=imresize(img,[floor(h/4) floor(w/4)]);
img = im2double(img);
[h, w]=size(img);
% �������ź��ͼƬ
imshow(img);

X = img(:);
% ����һά
d = 1;
[~,Y,P]=PCA(X, d);
% �ؽ�
result = P*Y;
imgn = zeros(size(img));
theEnd = 0;
for i = 1:size(img)
    begin = theEnd+1;
    theEnd = i * size(img,1);
    imgn(:,i) = result(begin:theEnd,1);
end
% �����ؽ����ͼƬ
figure(2);
imshow(imgn);

B=8;                %����һ�������ö��ٶ�����λ
MAX=2^B-1;          %ͼ���ж��ٻҶȼ�
MES=sum(sum((img-imgn).^2))/(h*w);     %������
disp(MES);
PSNR=20*(log10(MAX)-log10(sqrt(MES)));           %��ֵ�����
disp(PSNR)