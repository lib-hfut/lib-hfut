%隐节点合成神经网络的主程序
function main()
clc;close all;clear all;
InDim=3;               %输入维数
OutDim=1;              %输出维数
Hidden1UnitNum=7;      %第一隐含层节点数
Hidden2UnitNum=5;      %第二隐含层节点数
AllSamNum=93;          %所有训练和测试样本总数
TrainDataNum=83;       %训练样本容量
TestDataNum=10;        %测试样本容量

%分配内存空间
TrainDataIn=[];
TrainDataOut=[];
TestDataIn=[];
TestDataOut=[];
%从D盘读入学习、测试和预测的样本数据
TrainTest=load('d:\water.txt');
TrainTest=TrainTest';
PredictDataIn=load('d:\third.txt');
PredictDataIn=PredictDataIn';

%对样本数据进行初始化处理，置于0.1~0.9区间
SampleCombin=[TrainTest(1:3,:) PredictDataIn];
A1=max(SampleCombin(1,:));
B1=min(SampleCombin(1,:));
A2=max(SampleCombin(2,:));
B2=min(SampleCombin(2,:));
A3=max(SampleCombin(3,:));
B3=min(SampleCombin(3,:));
C=max(TrainTest(4,:));
D=min(TrainTest(4,:));
InitSampleCombin1=0.8*(SampleCombin(1,:)-B1)/(A1-B1)+0.1;
InitSampleCombin2=0.8*(SampleCombin(2,:)-B2)/(A2-B2)+0.1;
InitSampleCombin3=0.8*(SampleCombin(3,:)-B3)/(A3-B3)+0.1;
InitTrainTestDataOut=0.8*(TrainTest(4,:)-D)/(C-D)+0.1;
SampleCombin=[InitSampleCombin1;InitSampleCombin2;InitSampleCombin3];

TrainDataIn=SampleCombin(1:InDim,1:TrainDataNum);
TrainDataOut=InitTrainTestDataOut(1,1:TrainDataNum);
TestDataIn=SampleCombin(1:InDim,TrainDataNum+1:AllSamNum);
TestDataOut=InitTrainTestDataOut(1,TrainDataNum+1:AllSamNum);
PredictDataIn=SampleCombin(1:InDim,AllSamNum+1:end);

W1=0.5*rands(Hidden1UnitNum,InDim);          %输入层到第一隐含层权值
B1=0.5*rands(Hidden1UnitNum,1);               %输入层到第一隐含层阈值
W2=0.5*rands(Hidden2UnitNum,Hidden1UnitNum); %第一隐含层层到第二隐含层权值
B2=0.5*rands(Hidden2UnitNum,1);              %第一隐含层层到第二隐含层阈值
W3=0.5*rands(OutDim,Hidden2UnitNum);         %第二隐含层层到输出层权值
B3=0.5*rands(OutDim,1);                       %第二隐含层层到输出层阈值

lr=0.10;                                      %学习速率
Alpha=0.08;                                   %动量因子
MaxEpoch=40000;                             %网络训练次数
ErrCombine=0.001;                             %合成时训练误差
ErrGoal=0.00005;                              %目标误差
UnitsCombineThreshold=0.8;                     %合成阈值
BiasCombineThreshold=0.01;                     %合成阈值

%扩展权值，将网络阈值看成是输入为1的阈值
W1Ex=[W1 B1];                               
W2Ex=[W2 B2];
W3Ex=[W3 B3];
%扩展样本
TrainDataInEx=[TrainDataIn' ones(TrainDataNum,1)]';
ErrHistory=[];
ReSizeFlag=1;
for epoch=1:MaxEpoch
if (ReSizeFlag==1),
[Hidden2UnitNum,Hidden1UnitNum]=size(W2Ex);
Hidden1UnitNum=Hidden1UnitNum-1;
W2=W2Ex(:,1:Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);
dW1Ex=zeros(size(W1Ex));
dW2Ex=zeros(size(W2Ex));
dW3Ex=zeros(size(W3Ex));
ReSizeFlag=0;
end

%计算网络各层输出
Hidden1Out=logsig(W1Ex*TrainDataInEx);
Hidden1OutEx=[Hidden1Out' ones(TrainDataNum,1)]';
Hidden2Out=logsig(W2Ex*Hidden1OutEx);
Hidden2OutEx=[Hidden2Out' ones(TrainDataNum,1)]';
NetworkOut=logsig(W3Ex*Hidden2OutEx);
%停止学习判断
Error=TrainDataOut-NetworkOut;
SSE=sumsqr(Error)
%记录每次权值调整后的训练误差
ErrHistory=[ErrHistory SSE];

if(SSE<ErrCombine),
%计算隐节点输出标准差
Hidden1Var=var(Hidden1Out');
Hidden2Var=var(Hidden2Out');
%计算隐节点输出相关系数
Hidden1Corr=corrcoef(Hidden1Out');
Hidden2Corr=corrcoef(Hidden2Out');
%检查第一隐含层是否需要隐节点进行合并
[Hidden1unit1,Hidden1unit2]=FindUnitToCombine(Hidden1Corr,...
     Hidden1Var,UnitsCombineThreshold,BiasCombineThreshold);

if(Hidden1unit1>0),
if(Hidden1unit2>0),  %两个隐节点进行合并
[a,b]=LinearReg(Hidden1Out(Hidden1unit1,:),Hidden1Out(Hidden1unit2,:));
epoch
CombineType=11
DrawCorrelatedUnitsOut(Hidden1Out...
    (Hidden1unit1,:),Hidden1Out(Hidden1unit2,:));
[W1Ex,W2Ex]=CombineTwoUnits(Hidden1unit1,Hidden1unit2,a,b,W1Ex,W2Ex);
else                 %隐节点并到偏移
epoch
CombineType=12
DrawBiasedUnitOut(Hidden1Out(Hidden1unit1,:));
UnitMean=mean(Hidden1Out(Hidden1unit1,:));
[W1Ex,W2Ex]=CombineUnitToBias(Hidden1unit1,UnitMean,W1Ex,W2Ex);
end
ReSizeFlag=1;
continue;
end

[Hidden2unit1,Hidden2unit2]=FindUnitToCombine(Hidden2Corr,Hidden2Var,...
              UnitsCombineThreshold,BiasCombineThreshold);
if(Hidden2unit1>0),
if(Hidden2unit2>0),
epoch
CombineType=21
[a,b]=LinearReg(Hidden2Out(Hidden2unit1,:),...
    Hidden2Out(Hidden2unit2,:));

DrawCorrelatedUnitsOut(Hidden2Out(Hidden2unit1,:),...
    Hidden2Out(Hidden2unit2,:));
[W2Ex,W3Ex]=CombineTwoUnits(Hidden2unit1,Hidden2unit2,a,b,W2Ex,W3Ex);
else
epoch
CombineType=22
DrawBiasedUnitOut(Hidden2Out(Hidden2unit1,:));
UnitMean=mean(Hidden2Out(Hidden2unit1,:));
[W2Ex,W3Ex]=CombineUnitToBias(Hidden2unit1,UnitMean,W2Ex,W3Ex);
end
ReSizeFlag=1;
continue;
end
end

if(SSE<ErrGoal),break,end
if(SSE<0.27),lr=0.12;end
%计算方向传播误差
Delta3=Error.*NetworkOut.*(1-NetworkOut);
Delta2=W3'*Delta3.*Hidden2Out.*(1-Hidden2Out);
Delta1=W2'*Delta2.*Hidden1Out.*(1-Hidden1Out);
%保存前一时刻权值调整量以便加入动量因子
dW1Ex0=lr*dW1Ex;
dW2Ex0=lr*dW2Ex;
dW3Ex0=lr*dW3Ex;
%计算权值调整量
dW3Ex=Delta3*Hidden2OutEx';
dW2Ex=Delta2*Hidden1OutEx';
dW1Ex=Delta1*TrainDataInEx';
%权值调节
W1Ex=W1Ex+lr*dW1Ex+Alpha*dW1Ex0;
W2Ex=W2Ex+lr*dW2Ex+Alpha*dW2Ex0;
W3Ex=W3Ex+lr*dW3Ex+Alpha*dW3Ex0;
%分离权值以便后面使用
W2=W2Ex(:,1:Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);

end
Hidden1UnitNum
Hidden2UnitNum
W1=W1Ex(:,1:InDim);
B1=W1Ex(:,InDim+1);
W2=W2Ex(:,1:Hidden1UnitNum);
B2=W2Ex(:,1+Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);
B3=W3Ex(:,1+Hidden2UnitNum);
TestNNOut=BPNet(TestDataIn,W1,B1,W2,B2,W3,B3);
TestNNOut;
BinOut=TestNNOut>0.5;
ErrNum=sum(TestDataOut-BinOut);

%输出网络训练误差
TrainNNOut=BPNet(TrainDataIn,W1,B1,W2,B2,W3,B3);
TrainError=TrainDataOut-TrainNNOut;
figure;
hd1=plot(1:TrainDataNum,TrainError);
set(hd1,'color',[1 0 0],'linestyle','-',...
    'linewidth',2.2,'marker','o','markersize',6);
hold on;
hd2=plot(1:TrainDataNum,TrainDataOut);
set(hd2,'color',[0 1 0],'linestyle','-',...
    'linewidth',2.2,'marker','s','markersize',6);
hd3=plot(1:TrainDataNum,TrainNNOut);
set(hd3,'color',[0 0 1],'linestyle','-',...
    'linewidth',2.2,'marker','*','markersize',6);
grid on;axis tight;
xlabel('网络学习样本个数');
ylabel('网络学习误差');
legend('学习误差','样本实际值','网络学习值');

%神经网络进行测试
figure;
grid on;
hd5=plot(1:TestDataNum,TestDataOut);
set(hd5,'color',[0 1 0],'linestyle','-',...
    'linewidth',2.2,'marker','s','markersize',6);
hold on;
hd4=plot(1:TestDataNum,TestNNOut);
set(hd4,'color',[0 0 1],'linestyle','-',...
    'linewidth',2.2,'marker','o','markersize',6);
xlabel('测试样本个数');
ylabel('网络测试误差');
axis tight;
legend('测试样本实际值','神经网络输出值');

figure;
echo off;axis on;
grid on;axis tight;
[xx,Num]=size(ErrHistory);
plot(1:Num,ErrHistory,'k-');

%神经网络进行预测
PredictNNOut=BPNet(PredictDataIn,W1,B1,W2,B2,W3,B3);
PredictDataOut=((PredictNNOut-0.1)*(C-D))/0.8+D
