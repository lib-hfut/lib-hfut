%灰色模型被调用子函数，该子函数命名为gm_1_1.m
function [y,p,e]=gm_1_1(X,k)   
x_orig=X; 
predict=k; 
x=cumsum(x_orig); 
n=length(x_orig); 
%生成灰色函数 
for i=1:(n-1); 
B(i)=-(x(i)+x(i+1))/2; 
end 
B=[B' ones(n-1,1)]; 
for i=1:(n-1); 
y(i)=x_orig(i+1); 
end 
Y=y'; 
au=(inv(B'*B))*(B'*Y); 
coef1=au(2)/au(1); 
coef2=x_orig(1)-coef1; 
coef3=0-au(1); 
costr1=num2str(coef1); 
costr2=num2str(abs(coef2)); 
costr3=num2str(coef3); 
eq=strcat(costr1,'+',costr2,'e^',costr3,'*(t-1))'); 
for t=1:n+predict 
   mcv(t)=coef1+coef2*exp(coef3*(t-1)); 
end 
x_mcv0=diff(mcv); 
x_mcve=[x_orig(1) x_mcv0]; 
x_mcv=diff(mcv(1:end-predict)); 
x_orig_n=x_orig(2:end); 
x_c_error=x_orig_n-x_mcv; 
x_error=mean(abs(x_c_error./x_orig_n)); 
%灰色模型误差的检验 
if x_error>0.2 
   disp('model disqualification!'); 
elseif x_error>0.1 
   disp('model check out'); 
else 
   disp('model is perfect!'); 
end 
e=x_error; 
p=x_mcve(end-predict+1:end);