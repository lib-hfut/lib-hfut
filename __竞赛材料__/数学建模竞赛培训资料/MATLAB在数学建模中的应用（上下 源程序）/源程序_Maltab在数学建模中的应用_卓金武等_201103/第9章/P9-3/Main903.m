%本程序画出在正方体内嵌套1/4圆的组合图形
%程序虽小，但是蕴含着用结构体设置图形属性和图形对象及坐标轴属性底层设置
clc;
x=0:0.01:1;
y=sqrt(1-x.^2);
figure;
h=plot(x,y);
active.linestyle='-';
active.linewidth=3;
active.color='k';
set(h,active);
set(gcf,'color','y');
set(gca,'color','b');
xlabel('x');
ylabel('y');
grid on;
axis square;
