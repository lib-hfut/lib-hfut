clc;close all;clear all;figure(1); 
%制作电影动画
m=moviein(28); %分配存储帧的内存      
a0=int2str(0);
for i=1:9      % 依次读入1-9张数字图像
  a=int2str(i);
  a1=strcat('d:\KonghuPanda\KonghuPanda',a0,a0,a,'.jpg');
  X1=imread(a1);imshow(X1);m(i)=getframe;
end
for i=10:28    % 依次读入10-28张数字图像
  a2=int2str(i);
  a3=strcat('d:\KonghuPanda\KonghuPanda',a0,a2,'.jpg');
  X2=imread(a3);imshow(X2);m(i)=getframe;
end
movie(m,8);    %播放动画
%输出各个电影帧
figure(2);
for i=1:9
  subplot(7,4,i);
  a=int2str(i);
  a1=strcat('d:\KonghuPanda\KonghuPanda',a0,a0,a,'.jpg');
  X1=imread(a1);
  image(X1);axis off;box off;
  a4=int2str(i);
  a5=strcat('第',a4,'帧');
  title(a5,'fontsize',9,'fontname','隶书');
end
for i=10:28
  subplot(7,4,i);
  a2=int2str(i);
  a3=strcat('d:\KonghuPanda\KonghuPanda',a0,a2,'.jpg');
  X2=imread(a3);
  image(X2);axis off;box off;
  a6=int2str(i);
  a7=strcat('第',a6,'帧');
  title(a7,'fontsize',9,'fontname','隶书');
end
