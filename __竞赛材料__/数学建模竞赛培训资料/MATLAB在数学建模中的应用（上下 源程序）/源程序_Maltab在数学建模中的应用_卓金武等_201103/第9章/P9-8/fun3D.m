%这是子程序，命名为fun3D.m
function CPoint=fun3D(t)
global xx yy zz;
Q=30000;Cq=6.68;K=4.2/(24*60*6);
Dx=50;Dy=5;Dz=2;ux=1.5;uy=0.2;uz=0.1;
CPoint=Cq*Q./(8.*(pi.*t).^(3./2).*sqrt(Dx.*Dy.*Dz)).*exp(-(xx-ux.*t).^2./(4.*Dx.*...
    t)-(yy-uy.*t).^2./(4.*Dy.*t)-(zz-uz.*t).^2./(4.*Dz.*t)).*exp(-K.*t);
