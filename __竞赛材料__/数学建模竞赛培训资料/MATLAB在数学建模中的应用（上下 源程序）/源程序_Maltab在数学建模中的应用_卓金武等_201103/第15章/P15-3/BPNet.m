%子函数，建议放于独立的m文件中，命名为BPNet.m
%网络的输出结构
function Out=BPNet(In,W1,B1,W2,B2,W3,B3)
[xxx,InNum]=size(In);
Hidden1Out=logsig(W1*In+repmat(B1,1,InNum));
Hidden2Out=logsig(W2*Hidden1Out+repmat(B2,1,InNum));
Out=logsig(W3*Hidden2Out+repmat(B3,1,InNum));