%此程序实现数字图像的水印嵌入
function dwtgl
clc;clear all;close all;
disp('计算机正在准备输出数字水印图像，请耐心等待……');
input=imread('d:\image.jpg');%从D盘里读出原始图像
input_add=input;
water=imread('d:\water1.jpg');%读出水印图像
water_add=water;
%将原始图像和水印的RGB三色分离
input=double(input);water=double(water);inputr=input(:,:,1);waterr=water(:,:,1);
inputg=input(:,:,2);waterg=water(:,:,2);inputb=input(:,:,3);waterb=water(:,:,3);
%系数r大，增加鲁棒性，不易随几何变形和物理变形失去水印,但是水印的透明性较差
r=0.06;
[Cwr,Swr]=WAVEDEC2(waterr,1,'haar');%水印R分解
[Cr,Sr]=WAVEDEC2(inputr,2,'haar');%图像R分解
%水印的嵌入
Cr(1:size(Cwr,2)/16)=Cr(1:size(Cwr,2)/16)+r*Cwr(1:size(Cwr,2)/16);
k=0;
while k<=size(Cr,2)/size(Cwr,2)-1
    Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4:size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/4+...
        k*size(Cwr,2)/4:size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+size(Cwr,2)/4:size(Cwr,2)/2); 
     Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4:size(Cr,2)/2+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/2+...
        k*size(Cwr,2)/4:size(Cr,2)/2+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+size(Cwr,2)/2:3*size(Cwr,2)/4); 
     Cr(1+3*size(Cr,2)/4+k*size(Cwr,2)/4:3*size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+3*size(Cr,2)/4+...
        k*size(Cwr,2)/4:3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+3*size(Cwr,2)/4:size(Cwr,2)); 
    k=k+1;
end;
Cr(1:size(Cwr,2)/4)=Cr(1:size(Cwr,2)/4)+r*Cwr(1:size(Cwr,2)/4);
g=0.03;
[Cwg,Swg]=WAVEDEC2(waterg,1,'haar');%水印G分解
[Cg,Sg]=WAVEDEC2(inputg,2,'haar');%图像G分解
%水印的嵌入
Cg(1:size(Cwg,2)/16)= Cg(1:size(Cwg,2)/16)+r*Cwg(1:size(Cwg,2)/16);
k=0;
while k<=size(Cg,2)/size(Cwg,2)-1
    Cg(1+size(Cg,2)/4+k*size(Cwg,2)/4:size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/4+...
        k*size(Cwg,2)/4:size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+size(Cwg,2)/4:size(Cwg,2)/2); 
     Cg(1+size(Cg,2)/2+k*size(Cwg,2)/4:size(Cg,2)/2+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/2+...
        k*size(Cwg,2)/4:size(Cg,2)/2+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+size(Cwg,2)/2:3*size(Cwg,2)/4); 
     Cg(1+3*size(Cg,2)/4+k*size(Cwg,2)/4:3*size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+3*size(Cg,2)/4+...
        k*size(Cwg,2)/4:3*size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+3*size(Cwg,2)/4:size(Cwg,2)); 
    k=k+1;
end;
Cg(1:size(Cwg,2)/4)=Cg(1:size(Cwg,2)/4)+g*Cwg(1:size(Cwg,2)/4);
b=0.12;
[Cwb,Swb]=WAVEDEC2(waterb,1,'haar');%水印B分解
[Cb,Sb]=WAVEDEC2(inputb,2,'haar');%图像B分解
%水印的嵌入
Cb(1:size(Cwb,2)/16)=Cb(1:size(Cwb,2)/16)+r*Cwb(1:size(Cwb,2)/16);
k=0;
while k<=size(Cb,2)/size(Cwb,2)-1
    Cb(1+size(Cb,2)/4+k*size(Cwb,2)/4:size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/4+...
        k*size(Cwb,2)/4:size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+size(Cwb,2)/4:size(Cwb,2)/2); 
     Cb(1+size(Cb,2)/2+k*size(Cwb,2)/4:size(Cb,2)/2+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/2+...
        k*size(Cwb,2)/4:size(Cb,2)/2+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+size(Cwb,2)/2:3*size(Cwb,2)/4); 
     Cb(1+3*size(Cb,2)/4+k*size(Cwb,2)/4:3*size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+3*size(Cb,2)/4+...
        k*size(Cwb,2)/4:3*size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+3*size(Cwb,2)/4:size(Cwb,2)); 
    k=k+1;
end;
Cb(1:size(Cwb,2)/4)=Cb(1:size(Cwb,2)/4)+b*Cwb(1:size(Cwb,2)/4);
%用哈尔小波重构图像，亦可用mexh等小波重构
inputr=waverec2(Cr,Sr,'haar');inputg=waverec2(Cg,Sg,'haar');inputb=waverec2(Cb,Sb,'haar');
%三色的叠加
temp=size(inputr);pic=zeros(temp(1),temp(2),3);
for i=1:temp(1);
    for j=1:temp(2);
        pic(i,j,1)=inputr(i,j);
        pic(i,j,2)=inputg(i,j);
        pic(i,j,3)=inputb(i,j);
    end
end
output=uint8(round(pic));
watermarked_image_uint8=uint8(output);%转化为uint8
imwrite(watermarked_image_uint8,'watermarked.jpg','jpg');
%画出水印图像
figure(2);subplot(3,1,1);image(input_add);
t1=title('原始图像');
set(t1,'fontsize',15,'color',[0 0 0],'fontname','隶书');
subplot(3,1,2);image(water_add);t2=title('水印图像');
set(t2,'fontsize',15,'color',[0 0 0],'fontname','隶书');
subplot(3,1,3);image(watermarked_image_uint8);t3=title('嵌入水印后的图像');
set(t3,'fontsize',15,'color',[0 0 0],'fontname','隶书');
