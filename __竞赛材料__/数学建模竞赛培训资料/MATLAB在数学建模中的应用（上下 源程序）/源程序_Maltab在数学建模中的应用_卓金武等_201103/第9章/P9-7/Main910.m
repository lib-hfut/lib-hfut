%这是主程序,命名为Main1206.m
clc;clear all;close all;
%本程序研究的对象是瞬时点源污染扩散问题
subplot(1,2,1);
daspect([1 1 1]);
xmin=-500;dx=10;xmax=500;ymin=-100;dy=5;ymax=100;zmin=-10;dz=1;zmax=10;
[cx,cy,ct]=meshgrid(xmin:dx:xmax,ymin:dy:ymax,10:10:50);
[grad_cx,grad_cy,grad_cz,grad_ct]=grad(cx,cy,0,ct);
hcone=coneplot(-500:10:500,-100:5:100,10:10:50,grad_cx,grad_cy,grad_ct,cx,cy,ct,0.9);
xlim([-60 70]);ylim([-50 25]);zlim([0 150]);
grid on;camlight right;lighting phong;camproj perspective;
xlabel('横向/(mg/L*s)','fontsize',18);ylabel('纵向/(mg/L*s)','fontsize',18);
zlabel('时间/s','fontsize',18);view(3);
title('10秒至50秒XOY切面扩散梯度流锥图','fontsize',18);
subplot(1,2,2);
[x,y,z]=meshgrid(xmin:dx:xmax,ymin:dy:ymax,zmin:dz:zmax);
[grad_x,grad_y,grad_z,grad_t]=grad(x,y,z,20);
quiver3(x,y,z,grad_x,grad_y,grad_z,1.1,'r-');
xlabel('横向/(mg/L*s)','fontsize',18);ylabel('纵向/(mg/L*s)','fontsize',18);
zlabel('河流竖直方向(mg/L*s)','fontsize',18);
axis tight;
title('时间T=20秒时3D扩散梯度向量图','fontsize',18);

