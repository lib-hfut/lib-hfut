%子程序：对于优化最大值或极大值函数问题，目标函数可以作为适应度函数
%函数名称存储为targetfun.m
function y=targetfun(x); %目标函数
y=200*exp(-0.05*x).*sin(x);
