%子函数，建议放于独立的m文件中，命名为LinearReg.m
%线性回归
function[a,b]=LinearReg(vect1,vect2)
[xxx,n]=size(vect1);
mean_v1=mean(vect1);
mean_v2=mean(vect2);
a=(vect1*vect2'/n-mean_v1*mean_v2)/(vect1*vect1'/n-mean_v1^2);
b=mean_v2-a*mean_v1;
