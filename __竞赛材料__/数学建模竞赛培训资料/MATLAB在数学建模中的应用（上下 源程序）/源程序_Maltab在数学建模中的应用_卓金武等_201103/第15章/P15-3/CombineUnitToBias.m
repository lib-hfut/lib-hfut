%子函数，建议放于独立的m文件中，命名为CombineUnitToBias.m
%将隐节点合并到偏移
function[W1Ex,W2Ex]=CombineUnitToBias(unit,UnitMean,W1Ex,W2Ex)
[xxx,BiasCol]=size(W2Ex);
W2Ex(:,BiasCol)=W2Ex(:,BiasCol)+UnitMean*W2Ex(:,unit);
W1Ex(unit,:)=[];
W2Ex(:,unit)=[];