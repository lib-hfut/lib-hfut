%子函数，建议放于独立的m文件中，命名为DrawBiasedUnitOut.m
%绘制标准差较小的单个隐节点输出
function DrawBiasedUnitOut(UnitOut)
[xxx,PtNum]=size(UnitOut);
figure('Position',[300 300 400 300])
echo off
axis([0 PtNum 0 1])
axis on
grid
hold on
plot(1:PtNum,UnitOut,'k-')