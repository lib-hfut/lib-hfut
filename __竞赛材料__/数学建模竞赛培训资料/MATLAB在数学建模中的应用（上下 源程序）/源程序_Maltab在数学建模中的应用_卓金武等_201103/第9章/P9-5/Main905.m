%程序运行前在“file”菜单下“preferences”将输出格式调成“long”形式
clc;clear all;
T1=clock;
N=1000;
x10=[];x20=[];x30=[];vmax=-inf;
x1=unifrnd(20,30,N,1);
x2=unifrnd(10,20,N,1);
x3=unifrnd(-10,16,N,1);
for i=1:N
    for j=1:N
        for k=1:N
            if -x1(i)+2*x2(j)+2*x3(k)>=0&...
               x1(i)+2*x2(j)+2*x3(k)<=72&...
               x1(i)-x2(j)==10,
           v=x1(i)*x2(j)*x3(k);
           if v>vmax,
               vmax=v;x10=x1(i);x20=x2(j);x30=x3(k);
           end
            end
        end
    end
end
x=[x10,x20,x30],vmax
T2=clock;
API_elapsed_time=T2-T1;
if  API_elapsed_time(6)<0
    API_elapsed_time(6)=API_elapsed_time(6)+60;
    API_elapsed_time(5)=API_elapsed_time(5)-1;
end
if  API_elapsed_time(5)<0
    API_elapsed_time(5)=API_elapsed_time(5)+60;
    API_elapsed_time(4)=API_elapsed_time(4)-1;
end
if  API_elapsed_time(4)<0
    API_elapsed_time(4)=API_elapsed_time(4)+60;
    API_elapsed_time(3)=API_elapsed_time(4)-1;
end 
str=sprintf('MC程序共运行 %d 小时 %d 分钟 %.4f 秒',...
    API_elapsed_time(4),API_elapsed_time(5),API_elapsed_time(6));
disp(str);
