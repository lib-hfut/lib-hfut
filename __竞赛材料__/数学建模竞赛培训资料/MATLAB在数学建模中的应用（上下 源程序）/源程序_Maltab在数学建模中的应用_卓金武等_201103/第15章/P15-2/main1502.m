% 灰色模型主程序
clear
clc;close all;
p=[];
q=[];
k=[];
%数据文件data1.txt有两列，第一列是时间，第二列是供水量
A=load('d:\data1.txt');
  n=size(A);
 A=A';
 B=[];
for i=0:10000:60000         %此重循环的目的是锁定将2000年到2006年
   for j=1:n                  %此重循环是逐个寻找
     if A(1,j)==20000101+i  %此重循环将各年1月份的每日供水量数据抠出来
         B=[B;A(2,j:j+30)];
        end
     end
end

%06年1月、07年1月的预测数据
for i=1:31
     [y,p]=gm_1_1([B(1:6,i)'],2);
  q=[q,p(1,1)];         %06年1月的预测数据
  k=[k,p(1,2)]          %07年1月的预测数据
end

%用2006年一月份的数据作为灰色模型的检验样本
errorss=abs((B(7,:)-q)./B(7,:))*100
t=1:31;
figure(1);
h1=plot(t,errorss);
set(h1,'color',[1 0 0],'linestyle','-',...
    'linewidth',2.5,'marker','p','markersize',4);
xlabel('时间/天');
ylabel('预测误差百分比/%');
text(30,5.5,'');axis tight;grid on;
title('06年1月份日用水量预测值与实际值误差百分比');

figure(2);
h2=plot(t,k);
set(h2,'color',[0 0 1],'linestyle','-.',...
    'linewidth',2.5,'marker','^','markersize',4);
xlabel('时间/天');
ylabel('日用水量/吨');
axis tight;grid on;
title('07年1月份日用水量预测值');




