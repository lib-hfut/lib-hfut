%主程序：用遗传算法求解y=200*exp(-0.05*x).*sin(x)在[-2 2]区间上的最大值
clc;
clear all;
close all;
global BitLength
global boundsbegin
global boundsend
bounds=[-2 2];%一维自变量的取值范围
precision=0.0001; %运算精度
boundsbegin=bounds(:,1);
boundsend=bounds(:,2);
%计算如果满足求解精度至少需要多长的染色体
BitLength=ceil(log2((boundsend-boundsbegin)' ./ precision));
popsize=50; %初始种群大小
Generationnmax=12;  %最大代数
pcrossover=0.90; %交配概率
pmutation=0.09; %变异概率
%产生初始种群
population=round(rand(popsize,BitLength));
%计算适应度,返回适应度Fitvalue和累积概率cumsump
[Fitvalue,cumsump]=fitnessfun(population);  
Generation=1;
while Generation<Generationnmax+1
   for j=1:2:popsize 
      %选择操作
      seln=selection(population,cumsump);
      %交叉操作
      scro=crossover(population,seln,pcrossover);
      scnew(j,:)=scro(1,:);
      scnew(j+1,:)=scro(2,:);
      %变异操作
      smnew(j,:)=mutation(scnew(j,:),pmutation);
      smnew(j+1,:)=mutation(scnew(j+1,:),pmutation);
   end
   population=smnew;  %产生了新的种群
   %计算新种群的适应度   
   [Fitvalue,cumsump]=fitnessfun(population);
   %记录当前代最好的适应度和平均适应度
   [fmax,nmax]=max(Fitvalue);
   fmean=mean(Fitvalue);
   ymax(Generation)=fmax;
   ymean(Generation)=fmean;
   %记录当前代的最佳染色体个体
   x=transform2to10(population(nmax,:));
   %自变量取值范围是[-2 2],需要把经过遗传运算的最佳染色体整合到[-2 2]区间
  xx=boundsbegin+x*(boundsend-boundsbegin)/(power((boundsend),BitLength)-1);
   xmax(Generation)=xx;
   Generation=Generation+1
end
Generation=Generation-1;
Bestpopulation=xx
Besttargetfunvalue=targetfun(xx)
%绘制经过遗传运算后的适应度曲线。一般地，如果进化过程中种群的平均适应度与最大适
%应度在曲线上有相互趋同的形态，表示算法收敛进行得很顺利，没有出现震荡；在这种前
%提下，最大适应度个体连续若干代都没有发生进化表明种群已经成熟。
figure(1);
hand1=plot(1:Generation,ymax);
set(hand1,'linestyle','-','linewidth',1.8,'marker','*','markersize',6)
hold on;
hand2=plot(1:Generation,ymean);
set(hand2,'color','r','linestyle','-','linewidth',1.8,...
'marker','h','markersize',6)
xlabel('进化代数');ylabel('最大/平均适应度');xlim([1 Generationnmax]);
legend('最大适应度','平均适应度');
box off;hold off;
