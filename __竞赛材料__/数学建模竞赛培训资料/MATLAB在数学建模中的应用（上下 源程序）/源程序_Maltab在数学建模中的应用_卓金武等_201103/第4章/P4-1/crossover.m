%子程序：新种群交叉操作,函数名称存储为crossover.m
function scro=crossover(population,seln,pc);
BitLength=size(population,2);
pcc=IfCroIfMut(pc);  %根据交叉概率决定是否进行交叉操作，1则是，0则否
if pcc==1
   chb=round(rand*(BitLength-2))+1;  %在[1,BitLength-1]范围内随机产生一个交叉位
   scro(1,:)=[population(seln(1),1:chb) population(seln(2),chb+1:BitLength)];
   scro(2,:)=[population(seln(2),1:chb) population(seln(1),chb+1:BitLength)];
else
   scro(1,:)=population(seln(1),:);
   scro(2,:)=population(seln(2),:);
end  