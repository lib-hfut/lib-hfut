function [xm,fv]=PSO(fitness,N,c1,c2,w,M,D)
% fitness:待优化的目标函数
% N:粒子数目
% c1,c2:学习因子1，学习因子2
% w:惯性权重
% M:最大迭代次数
% D:问题的维数
% xm:目标函数取最小值时的自变量值
% fv:目标函数最小值
format long;
%---------初始化种群的个体-------------
for i=1:N
    for j=1:D
        x(i,j)=randn;
        v(i,j)=randn;
    end
end
%---------先计算各个粒子的适应度，并初始化Pi和Pg----------
for i=1:N
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(N,:);          %pg为全局最优
for i=1:(N-1);
    if fitness(x(i,:))<fitness(pg)
        pg=x(i,:);
    end
end
%---------进入主循环，按照公式依次迭代----------
for t=1:M
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if fitness(x(i,:))<p(i)
            p(i)=fitness(x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i)<fitness(pg)
            pg=y(i,:);
        end
    end
    pbest(t)=fitness(pg);
end
xm=pg';
fv=fitness(pg);