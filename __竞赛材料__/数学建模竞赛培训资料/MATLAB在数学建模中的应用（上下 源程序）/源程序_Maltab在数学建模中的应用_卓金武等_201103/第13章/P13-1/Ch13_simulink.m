%本程序实现神州飞船跟踪测控的计算机虚拟，动画中地球、飞船
%和地面12个测控站同时运动。本程序是有声动画的仿真，
%使用时只要把bhk_med.wav文件放在D盘里然后运行该程序就Okay了。
clc;clear all;close all;
disp('计算机正在缓冲之中，请耐心等待……');
disp('动画运行时请将界面最大化以便产生强烈的视觉冲击');
a1=20;b1=7;a2=35;b2=37;checklength=45;
e=0;f=0;k=1;h=1;p=0;q=0;geshu1=1000;
%给动画的声音数据赋予一个空集
Music_sound_vector=[];
%声音的来源根据需要，可以将不同幅值不同频率的正弦函数进行叠加产生声音，
%也可以从网络上下载*.wave格式的音频读入程序。可以从网络上多下载一些音频，
%然后将它们变成声音列矢量，播放时会产生立体效果
[sound_vector,sf]=wavread('D:\bhk_med.wav');
%小波的一维分解，用小波函数的重构原理消除原声音文件的杂音，
%这里默认高频d5为杂音
[c,l]=wavedec(sound_vector,5,'db8');
%重构第1~5层逼近信号，为了避免与前面的a1/a2/a3等混淆，
%将逼近信号用af表示
af5=wrcoef('a',c,l,'db8',5);af4=wrcoef('a',c,l,'db8',4);af3=wrcoef('a',c,l,'db8',3);
af2=wrcoef('a',c,l,'db8',2);af1=wrcoef('a',c,l,'db8',1);
%重构第1~5层细节信号
d5=wrcoef('d',c,l,'db8',5);d4=wrcoef('d',c,l,'db8',4);d3=wrcoef('d',c,l,'db8',3);
d2=wrcoef('d',c,l,'db8',2);d1=wrcoef('d',c,l,'db8',1);
sound_vector=af5+d1+d2+d3+d4; %将声音中的杂质过滤掉
%为防止计算机仿真动画在播放中声音的数据量不够，
%所以对波形声音的矢量数据进行拓展
%另外，为了方便整合数据，将Wave音乐文件的数据输出由纵向改成横向
sound_vector=sound_vector';
if geshu1./length(sound_vector)<1
    Music_sound_vector=sound_vector;
end
if geshu1./length(sound_vector)>1
    if round(geshu1./length(sound_vector))==2
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,2]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,3]);
       end 
    end 
    if round(geshu1./length(sound_vector))==3
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,3]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,4]);
       end 
    end   
     if round(geshu1./length(sound_vector))==4
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,4]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,5]);
       end 
     end  
     if round(geshu1./length(sound_vector))==5
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
          Music_sound_vector=repmat(sound_vector,[1,5]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
          Music_sound_vector=repmat(sound_vector,[1,6]);
       end 
     end     
end
Music_sound_vector=Music_sound_vector';
%理论上声音的播放需要放在程序的后面，与形成动画的set函数一起运行，
%但声音的形成是建立在数据连续读取的前提下，
%否则一个一个的读入数据不会形成声音
%将形成声音的函数soundsc放在此处，就会形成声音，
%虽然声音会比动画稍微提前一点释放出来，
%此处形成的声音具有连续性，一直会伴随动画的播放而存在。
%可以根据动画播放的时间长度来调整声音文件的大小以便尽可能使声音和
%动画同时结束。
%需要注意的是，声音要尽量与模拟的对象匹配，
%可以将不同格式的音频通过软件转化变
%成.wave格式。之所以使用了soundsc函数而没有使用sound函数是
%因为sound函数会剪除%[-1 1]区间之外声音数据。
soundsc(Music_sound_vector,sf);
%声音信息处理完毕，进行计算机模拟时会一边播放动画一边发出与动画相衬的声音
%地面上12个测控站的坐标
stationx1=1.508;stationy1=6.98;stationx2=8.181;stationy2=6.388;
stationx3=14.85;stationy3=4.69;stationx4=19.95;stationy4=0.4729;
stationx5=16.93;stationy5=-3.726;stationx6=9.699;stationy6=-6.122;
stationx7=1.32;stationy7=-6.985;stationx8=-5.525;stationy8=-6.728;
stationx9=-13.66;stationy9=-5.114;stationx10=-19.98;stationy10=0.2971;
stationx11=-14.93;stationy11=4.658;stationx12=-8.066;stationy12=6.406;
%地球12个监测点的所覆盖的起止位置
stationsigalbegin1=(-87)/180*pi;stationsigalend1=(87)/180*pi;
stationsigalbegin2=(-57)/180*pi;stationsigalend2=(117)/180*pi;
stationsigalbegin3=(-27)/180*pi;stationsigalend3=(147)/180*pi;
stationsigalbegin4=(3)/180*pi;stationsigalend4=(177)/180*pi;
stationsigalbegin5=(33)/180*pi;stationsigalend5=(207)/180*pi;
stationsigalbegin6=(63)/180*pi;stationsigalend6=(237)/180*pi;
stationsigalbegin7=(93)/180*pi;stationsigalend7=(267)/180*pi;
stationsigalbegin8=(123)/180*pi;stationsigalend8=(297)/180*pi;
stationsigalbegin9=(153)/180*pi;stationsigalend9=(327)/180*pi;
stationsigalbegin10=(183)/180*pi;stationsigalend10=(357)/180*pi;
stationsigalbegin11=(213)/180*pi;stationsigalend11=(387)/180*pi;
stationsigalbegin12=(243)/180*pi;stationsigalend12=(417)/180*pi;
w1=linspace(0,2*pi,geshu1);w2=linspace(1,2*pi+1,geshu1);
tc1=a1*sin(w1);uc1=b1*cos(w1);tc2=a2*sin(w2)+tc1;uc2=b2*cos(w2)+uc1;
title('计算机虚拟神舟号飞船测控系统','fontsize',20,'color',[0 0 0],'fontname','隶书');
%设定动画运行的边框范围，否则动画可能跑出坐标图形之外
line([-50 50],[-50 -50]);line([-50 -50],[-50 50]);
line([50 50],[-50 50]);line([50 -50],[50 50]);
hold on;
sun= line(tc1(1),uc1(1),'color',[e f k],'marker','.',...
    'markersize',110,'erasemode','xor');
earth=line(tc2(1),uc2(1),'color',[e f k],'marker','.',...
    'markersize',50,'erasemode','xor');
%规划地球上的12个监测点所监控的目标范围
checkstation1=line(stationx1,stationy1,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation2=line(stationx2,stationy2,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation3=line(stationx3,stationy3,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation4=line(stationx4,stationy4,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx5,stationy5,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx6,stationy6,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx7,stationy7,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx8,stationy8,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx9,stationy9,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx10,stationy10,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx11,stationy11,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx12,stationy12,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');                   
hold on;guiji1=plot(a1*sin(w1),b1*cos(w1));
%设置地球监测点仿真的初始值,checkstation1的角度的处理要尤其注意
checkstation1=plot([stationx1,stationx1+checklength*sin(stationsigalbegin1)],...
                   [stationy1,stationy1+checklength*sin(stationsigalend1)]);
checkstation2=plot([stationx2,stationx2+checklength*sin(stationsigalbegin2)],...
                   [stationy2,stationy2+checklength*sin(stationsigalend2)]);
checkstation3=plot([stationx3,stationx3+checklength*sin(stationsigalbegin3)],...
                   [stationy3,stationy3+checklength*sin(stationsigalend3)]);
checkstation4=plot([stationx4,stationx4+checklength*sin(stationsigalbegin4)],...
                   [stationy4,stationy4+checklength*sin(stationsigalend4)]);
checkstation5=plot([stationx5,stationx5+checklength*sin(stationsigalbegin5)],...
                   [stationy5,stationy5+checklength*sin(stationsigalend5)]);
checkstation6=plot([stationx6,stationx6+checklength*sin(stationsigalbegin6)],...
                   [stationy6,stationy6+checklength*sin(stationsigalend6)]);
checkstation7=plot([stationx7,stationx7+checklength*sin(stationsigalbegin7)],...
                   [stationy7,stationy7+checklength*sin(stationsigalend7)]);
checkstation8=plot([stationx8,stationx8+checklength*sin(stationsigalbegin8)],...
                   [stationy8,stationy8+checklength*sin(stationsigalend8)]);
checkstation9=plot([stationx9,stationx9+checklength*sin(stationsigalbegin9)],...
                   [stationy9,stationy9+checklength*sin(stationsigalend9)]);
checkstation10=plot([stationx10,stationx10+checklength*sin(stationsigalbegin10)],...
                   [stationy10,stationy10+checklength*sin(stationsigalend10)]);
checkstation11=plot([stationx11,stationx11+checklength*sin(stationsigalbegin11)],...
                    [stationy11,stationy11+checklength*sin(stationsigalend11)]);
checkstation12=plot([stationx12,stationx12+checklength*sin(stationsigalbegin12)],...
                    [stationy12,stationy12+checklength*sin(stationsigalend12)]);
hold off;axis off;box off;    
set(guiji1,'color','r','linestyle','-','linewidth',2.0,'erasemode','none');
set(earth,'color','g','erasemode','xor');set(sun,'erasemode','xor');
%设置地球监测点仿真的属性
set(checkstation1,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation2,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation3,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation4,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation5,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation6,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation7,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation8,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation9,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation10,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation11,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation12,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
%动画开始放映了
for i=1:4; 
for r=1:geshu1;
e1=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
f1=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
k1=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
e2=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
f2=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
k2=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
e3=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
f3=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
k3=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
%将动画的点进行列阵
stationseprate1=[linspace(stationsigalbegin1,stationsigalend1,geshu1)];
stationseprate2=[linspace(stationsigalbegin2,stationsigalend2,geshu1)];
stationseprate3=[linspace(stationsigalbegin3,stationsigalend3,geshu1)];
stationseprate4=[linspace(stationsigalbegin4,stationsigalend4,geshu1)];
stationseprate5=[linspace(stationsigalbegin5,stationsigalend5,geshu1)];
stationseprate6=[linspace(stationsigalbegin6,stationsigalend6,geshu1)];
stationseprate7=[linspace(stationsigalbegin7,stationsigalend7,geshu1)];
stationseprate8=[linspace(stationsigalbegin8,stationsigalend8,geshu1)];
stationseprate9=[linspace(stationsigalbegin9,stationsigalend9,geshu1)];
stationseprate10=[linspace(stationsigalbegin10,stationsigalend10,geshu1)];
stationseprate11=[linspace(stationsigalbegin11,stationsigalend11,geshu1)];
stationseprate12=[linspace(stationsigalbegin12,stationsigalend12,geshu1)];
set(guiji1,'color',[0.1,0.3,0.4],'XData',a1*sin(w1),'YData',b1*cos(w1));
%MarkerEdgeColor表示点型边色，'MarkerFaceColor表示点型填充色；
%[0.49 1 0.48]色彩是宝石蓝，[1 0.62 0.40]表示铜黄色
set(sun,'marker','o','markersize',45,'linewidth',8.0,'MarkerEdgeColor',...
[0.49 1 0.48],'MarkerFaceColor',[1 0.62 0.40],'XData',tc1(r),'YData',uc1(r));
mm1=[a2*sin(w2)+tc1(r)*ones(1,geshu1)
     a2*sin(w2)+tc1(r)*ones(1,geshu1) 
     a2*sin(w2)+tc1(r)*ones(1,geshu1)];
nn1=[b2*cos(w2)+uc1(r)*ones(1,geshu1)
     b2*cos(w2)+uc1(r)*ones(1,geshu1)
     b2*cos(w2)+uc1(r)*ones(1,geshu1)];
set(earth,'color',[e2(2*r) f2(2*r) k2(2*r)],'XData',mm1(3*r),'YData',nn1(3*r));
%监测站开始进行监测动画模拟,颜色需要进行重新配置
set(checkstation1,'color',[0 0.4 0.8],'XData',...
    [stationx1,stationx1+checklength*sin(stationseprate1(r))],...
    'YData',[stationy1,stationy1+checklength*cos(stationseprate1(r))]);
set(checkstation2,'color',[0.1 0.3 0.7],'XData',...
    [stationx2,stationx2+checklength*sin(stationseprate2(r))],...
    'YData',[stationy2,stationy2+checklength*cos(stationseprate2(r))]);
set(checkstation3,'color',[0.2 0.2 0.6],'XData',...
    [stationx3,stationx3+checklength*sin(stationseprate3(r))],...
    'YData',[stationy3,stationy3+checklength*cos(stationseprate3(r))]);
set(checkstation4,'color',[0.3 0.1 0.5],'XData',...
    [stationx4,stationx4+checklength*sin(stationseprate4(r))],...
    'YData',[stationy4,stationy4+checklength*cos(stationseprate4(r))]);
set(checkstation5,'color',[0.4 0.2 0.4],'XData',...
    [stationx5,stationx5+checklength*sin(stationseprate5(r))],...
    'YData',[stationy5,stationy5+checklength*cos(stationseprate5(r))]);
set(checkstation6,'color',[0.5 0.3 0.3],'XData',...
    [stationx6,stationx6+checklength*sin(stationseprate6(r))],...
    'YData',[stationy6,stationy6+checklength*cos(stationseprate6(r))]);
set(checkstation7,'color',[0.6 0.4 0.2],'XData',...
    [stationx7,stationx7+checklength*sin(stationseprate7(r))],...
    'YData',[stationy7,stationy7+checklength*cos(stationseprate7(r))]);
set(checkstation8,'color',[0.7 0.5 0.1],'XData',...
    [stationx8,stationx8+checklength*sin(stationseprate8(r))],...
    'YData',[stationy8,stationy8+checklength*cos(stationseprate8(r))]);
set(checkstation9,'color',[0.8 0.6 0.2],'XData',...
    [stationx9,stationx9+checklength*sin(stationseprate9(r))],...
    'YData',[stationy9,stationy9+checklength*cos(stationseprate9(r))]);
set(checkstation10,'color',[0.9 0.7 0.3],'XData',...
    [stationx10,stationx10+checklength*sin(stationseprate10(r))],...
    'YData',[stationy10,stationy10+checklength*cos(stationseprate10(r))]);
set(checkstation11,'color',[0.8 0.8 0.4],'XData',...
    [stationx11,stationx11+checklength*sin(stationseprate11(r))],...
    'YData',[stationy11,stationy11+checklength*cos(stationseprate11(r))]);
set(checkstation12,'color',[0.7 0.9 0.5],'XData',...
    [stationx12,stationx12+checklength*sin(stationseprate12(r))],...
    'YData',[stationy12,stationy12+checklength*cos(stationseprate12(r))]);
end
pause(0.1);drawnow;
end
