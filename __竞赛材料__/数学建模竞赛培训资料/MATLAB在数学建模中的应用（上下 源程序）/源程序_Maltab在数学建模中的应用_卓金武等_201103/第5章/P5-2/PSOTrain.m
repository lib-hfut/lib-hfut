function [NewW1,NewB1,NewW2,NewB2]=PSOTrain(SamIn,SamOut,HiddenUnitNum);
Maxgeneration=700;
E0=0.0001;
Xmin=-10;
Xmax=10;
Vmin=-5;
Vmax=5;
M=100;
c1=2.7;
c2=1.3;
w=0.9;
[R,SamNum]=size(SamIn);
[S2,SamNum]=size(SamOut);
generation=1;
Done=0;

Pb1=zeros(HiddenUnitNum,R+S2+1,M);
Pb2=zeros(S2,M);
Pg1=zeros(HiddenUnitNum,R+S2+1);
Pg2=zeros(S2,1);
E=zeros(size(SamOut));
rand('state',sum(100*clock));
startP1=rand(HiddenUnitNum,R+S2+1,M)-0.5;
startP2=rand(S2,M)-0.5;
startV1=rand(HiddenUnitNum,R+S2+1,M)-0.5;
startV2=rand(S2,M)-0.5;
endP1=zeros(HiddenUnitNum,R+S2+1,M);
endP2=zeros(S2,M);
endV1=zeros(HiddenUnitNum,R+S2+1,M);
endV2=zeros(S2,M);
startE=zeros(1,M);
endE=zeros(1,M);
for i=1:M
    W1=startP1(1:HiddenUnitNum,1:R,i);
    W2=startP1(1:HiddenUnitNum,R+1:R+S2,i);
    B1=startP1(1:HiddenUnitNum,R+S2+1,i);
    B2=startP2(1:S2,i);
    for q=1:SamNum
        TempOut=logsig(W1*SamIn(:,q)+B1);
        NetworkOut(1,q)=W2'*TempOut+B2;
    end
    E=NetworkOut-SamOut;
    startE(1,i)=sumsqr(E)/(SamNum*S2);
    Pb1(:,:,i)=startP1(:,:,i);
    Pb2(:,i)=startP2(:,i);
end
[val,position]=min(startE(1,:));
Pg1=startP1(:,:,position);
Pg2=startP2(:,position);
Pgvalue=val;
Pgvalue_last=Pgvalue;

while(~Done)
    for num=1:M
        endV1(:,:,num)=w*startV1(:,:,num)+c1*rand*(Pb1(:,:,num)-startP1(:,:,num))+c2*rand*(Pg1-startP1(:,:,num));
        endV2(:,num)=w*startV2(:,num)+c1*rand*(Pb2(:,num)-startP2(:,num))+c2*rand*(Pg2-startP2(:,num));
        for i=1:HiddenUnitNum
            for j=1:(R+S2+1)
                endV1(i,j,num)=endV1(i,j,num);
                if endV1(i,j,num)>Vmax
                    endV1(i,j,num)=Vmax;
                elseif endV1(i,j,num)<Vmin
                        endV1(i,j,num)=Vmin;
                end
            end
        end
        for s2=1:S2
            endV2(s2,num)=endV2(s2,num);
            if endV2(s2,num)>Vmax
               endV2(s2,num)=Vmax;
            elseif endV2(s2,num)<Vmin
                   endV2(s2,num)=Vmin;
            end
        end
        endP1(:,:,num)=startP1(:,:,num)+endV1(:,:,num);
        endP2(:,num)=startP2(:,num)+endV2(:,num);
        for i=1:HiddenUnitNum
            for j=1:(R+S2+1)
                if endP1(i,j,num)>Xmax
                   endP1(i,j,num)=Xmax;
                elseif endP1(i,j,num)<Xmin
                       endP1(i,j,num)=Xmin;
                end
            end
        end
        for s2=1:S2
            if endP2(s2,num)>Xmax
               endP2(s2,num)=Xmax;
            elseif endP2(s2,num)<Xmin
               endP2(s2,num)=Xmin;
            end
        end  
        W1=endP1(1:HiddenUnitNum,1:R,num);
        W2=endP1(1:HiddenUnitNum,R+1:R+S2,num);
        B1=endP1(1:HiddenUnitNum,R+S2+1,num);
        B2=endP2(1:S2,num);
        for q=1:SamNum
            TempOut=logsig(W1*SamIn(:,q)+B1);
            NetworkOut(1,q)=W2'*TempOut+B2;
        end
        E=NetworkOut-SamOut;
        SSE=sumsqr(E)   %便于在命令窗口观察网络误差的变化情况
        endE(1,num)=sumsqr(E)/(SamNum*S2);
        if endE(1,num)<startE(1,num)
            Pb1(:,:,num)=endP1(:,:,num);
            Pb2(:,num)=endP2(:,num);
            startE(1,num)=endE(1,num);
        end
    end
    w=0.9-(0.5/Maxgeneration)*generation;
    [value,position]=min(startE(1,:));
    if value<Pgvalue
        Pg1=Pb1(:,:,position);
        Pg2=Pb2(:,position);
        Pgvalue=value;
    end
    if (generation>=Maxgeneration)
        Done=1;
    end
    if Pgvalue<E0
        Done=1;
    end
    
    startP1=endP1;
    startP2=endP2;
    startV1=endV1;
    startV2=endV2;
    startE=endE;
    generation=generation+1;
end
W1=Pg1(1:HiddenUnitNum,1:R);
W2=Pg1(1:HiddenUnitNum,R+1:R+S2);
B1=Pg1(1:HiddenUnitNum,R+S2+1);
B2=Pg2(:,1);
NewW1=W1;
NewW2=W2;
NewB1=B1;
NewB2=B2;
