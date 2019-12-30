function [X,Y,P,Z,U]=command()

X=readPicture();

% ��ά��ԭʼ256*256���γ�15 * 256����
[mu,Y,P]=PCA(X, 15);
% �ؽ�������15*256�����ؽ�
result = P*Y+repmat(mu,1,size(X,2));
imshow(result);
calc(X,result)

% �ٴν�ά��15*256�ľ����γ�8*15����
[nmu,Z,U]=PCA(Y', 8);
% �ؽ�������8*15���󡢵�һ�ν�ά��ľ�ֵ����mu�����ɷ�P
figure(2);
result = P*(U*Z + repmat(nmu,1,size(Y,1)))'+repmat(mu,1,size(X,2));
imshow(result);

calc(X,result)

function calc(img,imgn)
[h, w]=size(img);
B=8;                %����һ�������ö��ٶ�����λ
MAX=2^B-1;          %ͼ���ж��ٻҶȼ�
MES=sum(sum((img-imgn).^2))/(h*w);     %������
disp(MES);
PSNR=20*(log10(MAX)-log10(sqrt(MES)));           %��ֵ�����
disp(PSNR)