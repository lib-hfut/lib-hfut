function main
clc;clear all;close all;
MaxRunningTime=1; %该参数是为了使网络集成，重复训练MaxRunningTime次
HiddenUnitNum=12;
rand('state',sum(100*clock));
TrainSamIn=-4:0.07:2.5;
TrainSamOut=1.1*(1-TrainSamIn+2*TrainSamIn.^2).*exp(-TrainSamIn.^2/2);
TestSamIn=2:0.04:3;
TestSamOut=1.1*(1-TestSamIn+2*TestSamIn.^2).*exp(-TestSamIn.^2/2);
[xxx,TrainSamNum]=size(TrainSamIn);
[xxx,TestSamNum]=size(TestSamIn);
% for HiddenUnitNum=3:MaxHiddenLayerNode %隐含层神经元的个数可以取逐渐增大的合理整数
    fprintf('\n the hidden layer node');HiddenUnitNum
    TrainNNOut=[];
    TestNNOut=[];
    for t=1:MaxRunningTime
        fprintf('the current running times is');t
        [NewW1,NewB1,NewW2,NewB2]=PSOTrain(TrainSamIn,TrainSamOut,HiddenUnitNum);
        disp('PSO算法训练神经网络结束，BP算法接着训练网络……');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BP算法参数初始化，注意与上面PSO参数一致
SamInNum=length(TrainSamIn);
TestSamNum=length(TestSamIn);
InDim=1;
OutDim=1;
%学习样本添加噪声
rand('state',sum(100*clock))
NoiseVar=0.01;
Noise=NoiseVar*randn(1,SamInNum);
SamIn=TrainSamIn;
SamOutNoNoise=TrainSamOut;
SamOut=SamOutNoNoise + Noise;
MaxEpochs=300;
lr=0.003;
E0=0.0001;
W1=NewW1;
B1=NewB1;
W2=NewW2';
B2=NewB2;
W1Ex=[W1 B1];
W2Ex=[W2 B2];
SamInEx=[SamIn' ones(SamInNum,1)]';
ErrHistory=[];
%网络参数初始化完毕
%给动画初始画图和构建动画框架和背景
HiddenOut=logsig(W1Ex*SamInEx);
HiddenOutEx=[HiddenOut' ones(SamInNum,1)]';
NetworkOut=W2Ex*HiddenOutEx;
Error=SamOut-NetworkOut;
%给误差的动画显示提供空矩阵和其维数
SSEINIT=zeros(1,MaxEpochs);
%这仅限于输出是一维的情况
SSE=sumsqr(Error);
%绘画动画显示的图形框架
figure(1);
rangecolour=linspace(0,1,MaxEpochs);
%采用分区画图，把两幅动画在一个figure中显示
%先画第一幅图形
subplot(2,1,1);
hold on
axis([1 SamInNum min(SamOut) max(SamOut)]);
hflash1=line(1:SamInNum,SamOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','d',...
    'markersize',2,'erasemode','none');
hflash2=line(1:SamInNum,NetworkOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2.5,'marker','h',...
    'markersize',2.3,'erasemode','xor');
xlabel('训练样本的数目');
ylabel('样本的输出值或网络的输出值');
title('样本的输出值与网络的输出值动画显示','fontsize',13);
legend('样本的输出值','网络的输出值');
hold off
%再画第二幅图形
subplot(2,1,2);
hold on
axis([1 MaxEpochs -0.2*SSE SSE]);
hflash3=line(1:MaxEpochs,E0*ones(1,MaxEpochs),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','--','linewidth',2,'marker','h',...
    'markersize',2,'erasemode','none');
hflash4=line(1,SSE,'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','*',...
    'markersize',2,'erasemode','xor');
xlabel('网络训练次数');
ylabel('目标误差或网络输出误差');
title('目标误差与网络输出误差动画显示','fontsize',13);
legend('目标误差','网络输出误差');
hold off

for i=2:MaxEpochs
    HiddenOut=logsig(W1Ex*SamInEx);
    HiddenOutEx=[HiddenOut' ones(SamInNum,1)]';
    NetworkOut=W2Ex*HiddenOutEx;
    
    Error=SamOut-NetworkOut;
    SSE=sumsqr(Error)
 %让第二幅动画逐点显示
          SSEINIT(:,i)=SSE;
%对于神经网络训练过程中发生震荡的瞬间图像将其显示出来
  ErrHistory=[ErrHistory SSE];
  SSEINIT(:,1);
  SSEINIT(:,2);
  SSEINIT2=SSEINIT(:,i);
  SSEINIT1=SSEINIT(:,i-1);
if SSE<E0,break, end   
    Delta2=Error;
    Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);

    dW2Ex=Delta2*HiddenOutEx';
    dW1Ex=Delta1*SamInEx';

    W1Ex=W1Ex+lr*dW1Ex;
    W2Ex=W2Ex+lr*dW2Ex;
    W2=W2Ex(:,1:HiddenUnitNum);
    if SSEINIT2>SSEINIT1
%如果网络学习时发生震荡，每10步显示一次
    if mod(i,10)==0
        Counter(i)=SSEINIT(:,i);
        Len=size(Counter);
        figure(Len(1,2));
       subplot(2,1,1);
      hold on
axis([1 SamInNum min(SamOut) max(SamOut)]);
hflash5=line(1:SamInNum,SamOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','d',...
    'markersize',2,'erasemode','none');
hflash6=line(1:SamInNum,NetworkOut,'color',[rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)],...
    'linestyle','-','linewidth',2.5,'marker','h',...
    'markersize',2.3,'erasemode','xor');
xlabel('训练样本的数目');
ylabel('样本的输出值或网络的输出值');
title('神经网络学习震荡时拟合曲线','fontsize',13);
legend('样本的输出值','网络的输出值');
hold off
%再画第二幅图形
subplot(2,1,2);
hold on
axis([1 MaxEpochs -2*SSEINIT(:,2) 2*SSEINIT(:,2)]);
hflash7=line(1:MaxEpochs,E0*ones(1,MaxEpochs),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','--','linewidth',2,'marker','h',...
    'markersize',2,'erasemode','none');
hflash8=line(1:i,SSEINIT(:,1:i),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','*',...
    'markersize',2,'erasemode','xor');
xlabel('网络训练次数');
ylabel('目标误差或网络输出误差');
title('神经网络学习震荡时误差','fontsize',13);
legend('目标误差','网络输出误差');
hold off
    end
    end
%动画开始放映    
set(hflash2,'XData',1:SamInNum,'YData',NetworkOut,'color',...
    [rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)]);
set(hflash4,'XData',1:i,'YData',SSEINIT(:,1:i),...
    'color',[rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)]);
drawnow;                       
end

W2=W2Ex(:,1:HiddenUnitNum);
W1=W1Ex(:,1:InDim);
B1=W1Ex(:,InDim+1);
B2=W2Ex(:,1+HiddenUnitNum); 
TrainHiddenOut=logsig(W1*SamIn+repmat(B1,1,SamInNum));
TrainNNOut=W2*TrainHiddenOut+repmat(B2,1,SamInNum);
TestHiddenOut=logsig(W1*TestSamIn+repmat(B1,1,TestSamNum));
TestNNOut=W2*TestHiddenOut+repmat(B2,1,TestSamNum);

figure(MaxEpochs+1);
hold on;
grid;
h1=plot(SamIn,SamOut);
set(h1,'color','r','linestyle','-',...
    'linewidth',2.5,'marker','p','markersize',5);
hold on 
h2=plot(TestSamIn,TestSamOut);
set(h2,'color','g','linestyle','--',...
    'linewidth',2.5,'marker','^','markersize',7);
h3=plot(SamIn,TrainNNOut);
set(h3,'color','c','linestyle','-.',...
    'linewidth',2.5,'marker','o','markersize',5);
h4=plot(TestSamIn,TestNNOut);
set(h4,'color','m','linestyle',':',...
    'linewidth',2.5,'marker','s','markersize',5);
xlabel('Input x','fontsize',13);ylabel('Output y','fontsize',13);
box on;axis tight;
%title('PSO-BP神经网络误差测试图');
legend('网络学习实际样本值','网络测试实际样本值',...
    '网络学习网络输出值','网络测试网络输出值');
hold off;
    end
% end
fidW1=fopen('d:\W1.txt','a+');fidB1=fopen('d:\B1.txt','a+');
fidW2=fopen('d:\W2.txt','a+');fidB2=fopen('d:\B2.txt','a+');
for i=1:length(W1)
    fprintf(fidW1,'\n %6.5f',W1(i));
end
for i=1:length(B1)
    fprintf(fidB1,'\n %6.5f',B1(i));
end
for i=1:length(W2)
    fprintf(fidW2,'\n %6.5f',W2(i));
end
for i=1:length(B2)
    fprintf(fidB2,'\n %6.5f',B2(i));
end
fclose(fidW1);fclose(fidB1);fclose(fidW2);fclose(fidB2);
