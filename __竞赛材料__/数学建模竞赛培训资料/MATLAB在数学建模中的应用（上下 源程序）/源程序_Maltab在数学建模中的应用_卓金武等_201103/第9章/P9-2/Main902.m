clc;close all;clear all;
disp('计算机大概需要两分钟的运行时间，请等待……');
p=zeros(10,100);avert=zeros(10,100);
%分别在顾客人数为10、100、500等情况时，模拟系统工作强度和顾客平均逗留时间
nn=[10 100 500 1000 5000 10000 20000 50000 100000 500000];
for d=1:10 %length(nn)=10
    for s=1:100 %每种情况重复模拟100次以便消除随机因素
        n=nn(d);%模拟顾客数目
        dt=exprnd(10,1,n);%到达时间间隔
        st=normrnd(6.5,1.2,1,n);%服务台服务时间
        a=zeros(1,n);%每个顾客到达时刻
        b=zeros(1,n);%每个顾客开始接受服务时刻
        c=zeros(1,n);%每个顾客离开时刻
        a(1)=0;
            for i=2:n
            a(i)=a(i-1)+dt(i-1);%第i顾客到达时刻
            end
        b(1)=0;%第一个顾客开始接受服务的时刻是其到达的时刻
        c(1)=b(1)+st(1);%第一个顾客的离开时刻为其接受的服务时间加上开始接受服务的时刻
           for i=2:n
%如果第i个顾客到达时间比前一个顾客离开时间早，则接受服务时间为前一人离开时间
               if(a(i)<=c(i-1))b(i)=c(i-1);
%如果第i个顾客到达时间比前一个顾客离开时间晚，则接受服务时间为其到达时间
               else b(i)=a(i);
               end
%第i个顾客离开时间为其开始接受服务的时刻+接受服务的时间长度
        c(i)=b(i)+st(i);
           end
        cost=zeros(1,n);%记录每个顾客在系统逗留时间
        for i=1:n
            cost(i)=c(i)-a(i);%第i个顾客在系统逗留时间
        end
        T=c(n);%总时间
        p(d,s)=sum(st)/T;
        avert(d,s)=sum(cost)/n;
    end
end
pc=sum(p')/100;avertc=sum(avert')/100;
figure(1);subplot(2,1,1);%分区画图
plot(pc,'color','g','linestyle','-','linewidth',2.5,'marker','*','markersize',5);
text(1,pc(:,1),texlabel('10人'),'fontsize',11);
text(2,pc(:,2),texlabel('10^2 人'),'fontsize',11);
text(3-0.15,pc(:,3)-0.004,texlabel('5x10^2 人'),'fontsize',11);
text(4-0.15,pc(:,4)-0.004,texlabel('10^3 人'),'fontsize',11);
text(5-0.15,pc(:,5)-0.004,texlabel('5x10^3 人'),'fontsize',11);
text(6-0.15,pc(:,6)-0.004,texlabel('10^4 人'),'fontsize',11);
text(7-0.15,pc(:,7)-0.004,texlabel('2x10^4 人'),'fontsize',11);
text(8-0.15,pc(:,8)-0.004,texlabel('5x10^4 人'),'fontsize',11);
text(9-0.15,pc(:,9)-0.004,texlabel('10^5 人'),'fontsize',11);
text(10-0.15,pc(:,10)-0.004,texlabel('5x10^5 人'),'fontsize',11);
xlim([1 11]);xlabel('顾客数量/个','fontsize',11);ylabel('系统工作强度','fontsize',11);
subplot(2,1,2);
plot(avertc,'color','r','linestyle','-','linewidth',2.5,'marker','s','markersize',5);
text(1,avertc(:,1)+0.4,texlabel('10人'),'fontsize',11);
text(2-0.15,avertc(:,2)-0.4,texlabel('10^2 人'),'fontsize',11);
text(3-0.15,avertc(:,3)-0.4,texlabel('5x10^2 人'),'fontsize',11);
text(4-0.15,avertc(:,4)-0.4,texlabel('10^3 人'),'fontsize',11);
text(5-0.15,avertc(:,5)-0.4,texlabel('5x10^3 人'),'fontsize',11);
text(6-0.15,avertc(:,6)-0.4,texlabel('10^4 人'),'fontsize',11);
text(7-0.15,avertc(:,7)-0.4,texlabel('2x10^4 人'),'fontsize',11);
text(8-0.15,avertc(:,8)-0.4,texlabel('5x10^4 人'),'fontsize',11);
text(9-0.15,avertc(:,9)-0.4,texlabel('10^5 人'),'fontsize',11);
text(10-0.15,avertc(:,10)-0.4,texlabel('5x10^5 人'),'fontsize',11);
xlim([1 11]);xlabel('顾客数量/个','fontsize',11);ylabel('顾客逗留时间/秒','fontsize',11);
