%子函数，建议放于独立的m文件中，命名为DrawCorrelatedUnitsOut.m
%绘制两相关隐节点对所有样本的输出
function DrawCorrelatedUnitsOut(UnitOut1,UnitOut2)
[xxx,PtNum]=size(UnitOut1);
figure
echo off
axis([0 PtNum 0 1])
axis on
grid
hold on
plot(1:PtNum,UnitOut1,'b-')
plot(1:PtNum,UnitOut2,'k-')