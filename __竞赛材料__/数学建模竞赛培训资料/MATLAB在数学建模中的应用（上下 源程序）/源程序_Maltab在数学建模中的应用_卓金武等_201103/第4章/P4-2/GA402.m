%主程序：本程序采用遗传算法接力进化，
%将上次进化结束后得到的最终种群作为下次输入的初始种群
clc;
close all;
clear all;
%进化的代数
T=100;
optionsOrigin=gaoptimset('Generations',T/2);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%进行第二次接力进化
options1=gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,...
    'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval


