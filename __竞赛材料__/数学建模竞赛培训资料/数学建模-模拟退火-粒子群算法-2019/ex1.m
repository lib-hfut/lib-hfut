clc
clear all;
f1=@(x)x(1).^2+x(2).^2
N=50;
c1=1;
c2=2;
w=1;
M=100000;
D=2;

PSO(f1,N,c1,c2,w,M,D)