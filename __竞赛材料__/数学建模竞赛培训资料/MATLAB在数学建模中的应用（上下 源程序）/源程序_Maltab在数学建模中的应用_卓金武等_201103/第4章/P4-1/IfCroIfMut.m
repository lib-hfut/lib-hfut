
%子程序：判断遗传运算是否需要进行交叉或变异, 函数名称存储为IfCroIfMut.m
function pcc=IfCroIfMut(mutORcro);
test(1:100)=0;
l=round(100*mutORcro);
test(1:l)=1;
n=round(rand*99)+1;
pcc=test(n);  