% GA main
% using toolbox of GAOT version 5
clc
clf
clear
bounds=ones(12,2);

global r

xmin=0; ymin=0; xmax=200; ymax=150;
r=25; n=6;
bounds(:,1)=zeros(12,1) + r;
bounds(1:6,2)=ones(6,1).*xmax - r;
bounds(7:12,2)=ones(6,1).*ymax - r;

[x,endPop] = ga(...
                bounds,'myfGAPLP',[],[],[1e-6 1 1]);

myfplotcircleGA(x,r,xmax,ymax);

%% 以下为辅助函数的程序，放于独立的的m文件中
function [x,fval]=myfGAPLP(x,options)
% options is required by the format of GAOT ver 5.

fval=1; dfo=0;
global r

n=6;lamdao=1e30;
for i=1:(n-1)
    for j=(i+1):n
        rtmp=sqrt((x(i)-x(j)).^2+(x(n+i)-x(n+j)).^2);
        fval=fval.*rtmp;
        if rtmp < 2*r
            dfo=dfo+1;
        end
    end
end
fval=fval-dfo.*lamdao;

