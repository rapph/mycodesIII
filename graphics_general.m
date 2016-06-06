
%Load variable 
load('var_cal');




% Light Intensity Min, Max, and Average Values. 
f=figure;
plot(conc,lIntensity,'*r');hold; plot(conc, lIntensityMin,'ob'), plot(conc, lIntensityMax,'ob')

ylabel('$I \; [-]$','interpreter','Latex','FontSize',16);
xlabel('$C_{Dye} \; [g/L]$','interpreter','Latex','FontSize',16);
legend('Average Light Intensity', 'Max. and Min. Light Intensity')
set(gca,'FontSize',14)
set(gcf, 'position',[0 0 1000 500])
axis([0,0.3,0.40,1])
set(gca,'XMinorTick','on','YMinorTick','on')
set(gcf,'PaperPositionMode','auto');
print(f, 'lI_dye_relation', '-depsc','-r300','-noui');

%Light Intensity x Fit 
f=figure;
clear p;
p=polyfit(lIntensity(1:14),conc(1:14),4);
%p=polyfit(conc(1:14),lIntensity(1:14),4)
concS=polyval(p,lIntensity(1):-0.01:lIntensity(15));
plot(lIntensity(1:14),conc(1:14),'or'); 
set(gca,'FontSize',14)
xlabel('$I \; [-]$','interpreter','Latex','FontSize',16);
ylabel('$C_{Dye} \; [g/L]$','interpreter','Latex','FontSize',16);
set(gcf, 'position',[0 0 1000 500])

hold; plot(lIntensity(1):-0.01:lIntensity(15),concS,'k-');
legend('Average Light Intensity', ['C_{Dye}=', ... 
                                  num2str(p(1),'%+4.2f'),'\cdotI^5 ', ...
                                  num2str(p(2),'%+4.2f'),'\cdotI^4 ', ...
                                  num2str(p(3),'%+4.2f'),'\cdotI^3 ', ...
                                  num2str(p(4),'%+4.2f'),'\cdotI^2 ' , ...
                                  num2str(p(5),'%+4.2f'),'\cdotI' ]) %  , ...
                                 % num2str(p(6),'%+4.2f')])
axis([0.5,1, 0,0.2])
set(gcf,'PaperPositionMode','auto');
print(f, 'lI_dye_polyfit', '-depsc','-r200','-noui');


%Light intensity and STD comparing with errorbars.
f=figure; 
errorbar(conc,lIntensity,lIntensitySTD,'or');
ylabel('Light Intensity []');
xlabel('Dye Concentration [g/L]');
legend('Average Light Intensity', 'Avg. Light Intensity \pm 0.02')
set(0,'DefaultAxesFontSize',16)
set(gcf, 'position',[0 0 1000 500])
axis([0,0.3,0.45,1])

px2cm=28.2;
begin=14;
%Fit Velocity Position x Time
f=figure; plot(Mtime(begin:end),MPosition(begin:end)/px2cm,'or')
clear p;
p=polyfit(Mtime(begin:end),MPosition(begin:end)/px2cm,1); hold;
simPosition=polyval(p,Mtime);

mdl=fitlm(MPosition/px2cm, simPosition);

plot(Mtime,polyval(p,Mtime'),'k-');
set(gcf, 'position',[0 0 1000 500])
xlabel('Time [s]')
ylabel('x [cm]')
title(['x = ',num2str(p(1)),' \cdot t ',num2str(p(2)) ,'.    R^2 = ',num2str(mdl.Rsquared.Ordinary),'.'],'FontSize',12)
set(0,'DefaultAxesFontSize',16)

axis([0 20 0 200])
set(gcf,'PaperPositionMode','auto');
print(f, 'positionFront_time.png', '-dpng','-r200','-noui');

%Head by Position
begin=14;
f=figure;
clear p p1 p2
p1=polyfit(MPosition(begin:end)/px2cm,MHeightHead(begin:end)/px2cm,1)
%p2=polyfit(MPosition(begin:end)/px2cm,MHeightHead(begin:end)/px2cm,2)
plot(MPosition(begin:end)/px2cm,MHeightHead(begin:end)/px2cm,'*r')
hold;
plot(MPosition(begin:end)/px2cm,polyval(p1,MPosition(begin:end)/px2cm),'-g')
%plot(MPosition(begin:end)/px2cm,polyval(p2,MPosition(begin:end)/px2cm),'-b')

mdl=fitlm(MHeightHead(begin:end)/px2cm, polyval(p1,MPosition(begin:end)/px2cm));
title(['h = ',num2str(p1(1)),' \cdot x +',num2str(p1(2)), '  R^2 = ',num2str(mdl.Rsquared.Ordinary),'.'],'FontSize',12)

set(0,'DefaultAxesFontSize',16)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('h [cm]')

%legend('Max. Value Head', 'Linear'','FontSize',12)
set(gcf,'PaperPositionMode','auto');
print(f, 'headHeight_position.png', '-dpng','-r200','-noui');

%Lenght by Position 

%Lenght by HeadHeight

%Hight Evolution
f=figure;
plot([1:5838]/30.7,shape2Smooth(9:12:81,:)/30.7,'LineWidth',2);
hold;
plot([1:5838]/30.7,shape2(9:12:81,:)/30.7,'--','LineWidth',1);
set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('h [cm]')
time=[9:12:81]/4;
legend(num2str(time(1)), num2str(time(2)),num2str(time(3)),num2str(time(4)),num2str(time(5)),num2str(time(6)),num2str(time(7)))
set(gcf,'PaperPositionMode','auto');
print(f, 'headHeight_time.png', '-dpng','-r200','-noui');

%Lenght x Position

f=figure;
MLenght=((MPosition(1,1:end)-endHead(1,1:end)));


group=[MPosition' MHeightHead' MLenght'];
AA=find(MLenght<250);
group(AA,:)=[];


p1=polyfit(group(:,1)/30.7,group(:,3)/30.7,2)

plot(group(:,1)/30.7,(group(:,3)/30.7),'*r')
hold;
plot(group(:,1)/30.7,polyval(p1,group(:,1)/30.7),'-g')
set(0,'DefaultAxesFontSize',16)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('L [cm]')
mdl=fitlm(group(:,1)/30.7, polyval(p1,group(:,1)/30.7));
title(['L = ',num2str(p1(1)),' \cdot x^2 ',num2str(p1(2)),' \cdot x  + ', num2str(p1(3)) ...    
    '  R^2 = ',num2str(mdl.Rsquared.Ordinary),'.'],'FontSize',12)

set(gcf,'PaperPositionMode','auto');
print(f, 'position_lenght.png', '-dpng','-r200','-noui');

%Lenght x Head

f=figure;
MLenght=((MPosition(1,1:end)-endHead(1,1:end)));


group=[MPosition(1,16:end)' MHeightHead(1,16:end)' MLenght(1,16:end)'];
AA=find(group(:,3)<250);
group(AA,:)=[];


p1=polyfit(group(1:end-4,3)/30.7,group(1:end-4,2)/30.7,3)

plot(group(:,3)/30.7,(group(:,2)/30.7),'*r')
hold;
%plot(group(1:end-4,3)/30.7,polyval(p1,group(1:end-4,3)/30.7),'-g')
set(0,'DefaultAxesFontSize',16)
set(gcf, 'position',[0 0 1000 500])
xlabel('L [cm]')
ylabel('h [cm]')
mdl=fitlm(group(:,3)/30.7, polyval(p1,group(:,3)/30.7));
%title(['h = ',num2str(p1(1)),' \cdot L^2  + ',num2str(p1(2)),' \cdot L  + ', num2str(p1(3)) ...    
%    '     R^2 = ',num2str(mdl.Rsquared.Ordinary),'.'],'FontSize',12)

set(gcf,'PaperPositionMode','auto');
print(f, 'headHeight_lenght.png', '-dpng','-r200','-noui');






%Conc Evolution
for k=1:91; mediaSmooth(k,:)=smooth(media(k,:),100); end 

f=figure;
plot([1:5838]/30.7,media(9:12:81,:),'--','LineWidth',1);

hold;
h=plot([1:5838]/30.7,mediaSmooth(9:12:81,:),'LineWidth',2);
set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('Avg. Conc [%]')

time=[9:12:81]/4;
legend(h,num2str(time(1)), num2str(time(2)),num2str(time(3)),num2str(time(4)),num2str(time(5)),num2str(time(6)),num2str(time(7)))
set(gcf,'PaperPositionMode','auto');
print(f, 'avgConc_time.png', '-dpng','-r200','-noui');

%Conc Evolution
for k=1:91; mediaSmooth(k,:)=smooth(media(k,:),100); end 

f=figure;
plot([1:5838]/30.7,media(9:12:81,:),'--','LineWidth',1);

hold;
h=plot([1:5838]/30.7,mediaSmooth(9:12:81,:),'LineWidth',2);
set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('Avg. Conc [%]')

time=[9:12:81]/4;
legend(h,num2str(time(1)), num2str(time(2)),num2str(time(3)),num2str(time(4)),num2str(time(5)),num2str(time(6)),num2str(time(7)))
set(gcf,'PaperPositionMode','auto');
print(f, 'avgConc_time.png', '-dpng','-r200','-noui');



%Pico de Concentração no tempo

for k=1:91; mediaSmooth(k,:)=smooth(media(k,:),100); end 

f=figure;
for k=9:81; 
    if MLenght(k)<0; MLenght(k)=MLenght(k-1); end
        interval(k,:)=[(MPosition(k)-MLenght(k)) MPosition(k)]; 
concMax(k)=max(mediaSmooth(k,interval(k,1):interval(k,2)));
end

plot(MPosition(9:81)/30.7,concMax(9:81),'ro','LineWidth',1);

clear p1
p1=polyfit(MPosition(9:81)/30.7,concMax(9:81),1);
hold;

plot(MPosition(9:81)/30.7,polyval(p1,MPosition(9:81)/30.7),'g-');
set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1000 500])
xlabel('x [cm]')
ylabel('Avg. Conc [%]')

mdl=fitlm(max(mediaSmooth((9+25):81,:)'), polyval(p1,MPosition((9+25):81)/30.7));
title(['y = ',num2str(p1(1)),' \cdot x +',num2str(p1(2)), '   R^2 = ',num2str(mdl.Rsquared.Ordinary),'.'],'FontSize',12)
set(gcf,'PaperPositionMode','auto');
print(f, 'avgConc_Max_Position.png', '-dpng','-r200','-noui');


%Normlised Height and Position of the Current

for i=1:81; suave(i,:)=smooth(shape2(i,:),122); end
f=figure; hold; for i=33:8:81; plot([1:5838]/MPosition(i),suave(i,:)/max(suave(i,:)),'LineWidth',2); end; axis([0 1.02 0 1.0])

set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1010 500])
xlabel('x/x_n [-]')
ylabel('h/max(h) [-]')
time=[33:8:81]/4;
legend(num2str(time(1)), num2str(time(2)),num2str(time(3)),num2str(time(4)),num2str(time(5)),num2str(time(6)),num2str(time(7)))

set(gcf,'PaperPositionMode','auto');
print(f, 'headHeight_time_NORM.png', '-dpng','-r200','-noui');

%Normlised Conc and Position of the Current

for k=1:91; mediaSmooth(k,:)=smooth(media(k,:),100); end 
f=figure; hold; for i=33:8:81; plot([1:5838]/MPosition(i),mediaSmooth(i,:)/max(mediaSmooth(i,2000:end)),'LineWidth',2); end; axis([0 1.02 0 1.])

set(0,'DefaultAxesFontSize',12)
set(gcf, 'position',[0 0 1010 500])
xlabel('x/x_n [-]')
ylabel('c/max(c) [-]')
time=[33:8:81]/4;
legend(num2str(time(1)),num2str(time(2)),num2str(time(3)),num2str(time(4)),num2str(time(5)),num2str(time(6)))

set(gcf,'PaperPositionMode','auto');
print(f, 'conc_time_NORM.png', '-dpng','-r200','-noui');

