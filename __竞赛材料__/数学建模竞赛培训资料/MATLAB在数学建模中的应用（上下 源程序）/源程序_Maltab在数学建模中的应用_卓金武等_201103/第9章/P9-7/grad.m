% 这是子程序，命名为grad.m
function [grad_x,grad_y,grad_z,grad_t]=grad(x,y,z,t)
%以下各梯度grad_x,grad_y,grad_z,grad_t的表达式可以由此命令用计算机求出：
%syms t M Dx Dy Dz x ux y uy z uz K
%grad_maple=maple('grad(M/(8*(pi*t)^(3*2)*sqrt(Dx*Dy*Dz))*exp(-(x-ux*t)^2/(
%4*Dx*t)-(y-uy*t)^2/(4*Dy*t)-(z-uz*t)^2/(4*Dz*t))*exp(-K*t),vector([x,y,z,t]));')
%先用simplify和collect命令对各变量梯度表达式进行化简和合并
M=200400;K=4.2/(24*60*6);
Dx=50;Dy=5;Dz=2;ux=1.5;uy=0.2;uz=0.1;
grad_x=-1./16.*M./pi.^6./t.^7./(Dx.*Dy.*Dz).^(1./2).*(x-ux.*t)./Dx.*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*exp(-K.*t);
grad_y=-1./16.*M./pi.^6./t.^7./(Dx.*Dy.*Dz).^(1./2).*(y-uy.*t)./Dy.*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*exp(-K.*t);
grad_z=-1./16.*M./pi.^6./t.^7./(Dx.*Dy.*Dz).^(1./2).*(z-uz.*t)./Dz.*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*exp(-K.*t);
grad_t=-3./4.*M./pi.^6./t.^7./(Dx.*Dy.*Dz).^(1./2).*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*exp(-K.*t)+1./8.*M./pi.^6./t.^6./(Dx.*Dy.*Dz).^(1./2).*(1./2.*(x-ux.*t)./Dx./t.*ux+1./4.*(x-ux.*t).^2./Dx./t.^2+1./2.*(y-uy.*t)./Dy./t.*uy+1./4.*(y-uy.*t).^2./Dy./t.^2+1./2.*(z-uz.*t)./Dz./t.*uz+1./4.*(z-uz.*t).^2./Dz./t.^2).*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*exp(-K.*t)-1./8.*M./pi.^6./t.^6./(Dx.*Dy.*Dz).^(1./2).*exp(-1./4.*(x-ux.*t).^2./Dx./t-1./4.*(y-uy.*t).^2./Dy./t-1./4.*(z-uz.*t).^2./Dz./t).*K.*exp(-K.*t);
