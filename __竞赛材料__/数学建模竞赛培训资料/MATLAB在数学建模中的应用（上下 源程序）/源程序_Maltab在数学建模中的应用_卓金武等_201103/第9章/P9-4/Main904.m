%本例没有使用循环语句而是将相关量矢量化
%程序运行前在“file”菜单下“preferences”将输出格式调成“long”形式
clc;
clear all;
n=1000000;
a=rand(n,1);
%必须用rand指令而不能用randn指令因为产生的随机数必须是均匀的
b=rand(n,1);
c=find(a.^2+b.^2<=1);
d=length(c);
pi_value=d/n*4
