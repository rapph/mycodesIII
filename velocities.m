%Velocidade

initial=13;

figure;
hold;
for i=1:1;
    i
t=currentFinal(i).time;
x=currentFinal(i).position;
B(i)=currentFinal(i).initial.B;
px2cm=currentFinal(i).px2cm;


if i<7
plot(t(initial:end),x(initial:end)/px2cm,'s')
elseif i<14
    plot(t(initial:end),x(initial:end)/px2cm,'o')
else
    plot(t(initial:end),x(initial:end)/px2cm,'+')
end
end

xlabel('t [s]'); ylabel('x [cm]')
set(gca,'FontSize',14)
set(gcf, 'position',[0 0 1000 500])
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
%          'Location','SouthEast')
set(gcf,'PaperPositionMode','auto')
print('position_time', '-depsc', '-r300');
clear t x B px2cm;




figure;
hold;
for i=1:1;
t=currentFinal(i).time;
x=currentFinal(i).position;
B(i)=currentFinal(i).initial.B;
px2cm=currentFinal(i).px2cm;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end
plot(t(initial:end).*B(i).^(1/3),x(initial:end)/px2cm,fmt)
end

xlabel('$ t \cdot (Q \cdot g^\prime_0)^{\frac{1}{3}}$ [cm]','Interpreter','LaTex'); ylabel('x [cm]','Interpreter','LaTex')
set(gca,'FontSize',14)
set(gcf, 'position',[0 0 1000 500])
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
%          'Location','SouthEast')

set(gcf,'PaperPositionMode','auto')
print('position_buoyancyFlux', '-depsc', '-r300');
clear t x B px2cm;

figure;
hold;
for i=1:1;
t=currentFinal(i).time;
x=currentFinal(i).position;
Uf(i)=x/t;
B(i)=currentFinal(i).initial.B;
px2cm=currentFinal(i).px2cm;

end
plot(B.^(1./3),Uf/px2cm,'*')
xlabel('$ (Q \cdot g^\prime_0)^{\frac{1}{3}} [cm \cdot s^{-1}]$','Interpreter','LaTex'); ylabel('$U_f [cm \cdot s^{-1}]$','Interpreter','LaTex')
set(gca,'FontSize',14)
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('velocity_buoyancyFlux', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%HEAD POSITION
figure;
hold
for i=1:1;
t=currentFinal(i).time;
x=currentFinal(i).position;
h=currentFinal(i).height;
px2cm=currentFinal(i).px2cm;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end

plot(x(initial:end)/px2cm,h(initial:end)/px2cm,fmt)
p(i,:)=polyfit(x(initial:end)/px2cm,h(initial:end)/px2cm,1)
end
clear p

set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$h \; [cm]$','Interpreter','LaTex','FontSize',20)
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
%          'Location','SouthEast')
     set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('head_position', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HEAD NORM%%%%%%%%%%%%%%%
figure;
hold
for i=1:1;
t=currentFinal(i).time;
x=currentFinal(i).position;
h=currentFinal(i).height;
hNorm=currentFinal(i).height./currentFinal(i).height(end);
px2cm=currentFinal(i).px2cm;

plot(x(initial:end)/px2cm,hNorm(initial:end),'o')
p(i,:)=polyfit(x(initial:end)/px2cm,h(initial:end)/px2cm,1)
end


set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$h/max(h) \; [-]$','Interpreter','LaTex','FontSize',20)
legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('headNorm_position', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VIRTUAL ORIGIN%%%%%%%%%%%%%%%
figure;
hold

%plot(B(1:6), -p(1:6,2)./p(1:6,1),'gs')
%plot(B(7:13), -p(7:13,2)./p(7:13,1),'bo')
%plot(B(14), -p(14,2)./p(14,1),'r+')




set(gca,'FontSize',14)
xlabel('$ (Q \cdot g^\prime_0) \; [cm^3 \cdot s^{-3}]$','Interpreter','LaTex','FontSize',20); ylabel('$ x_0 \; [cm]$','Interpreter','LaTex','FontSize',20)
legend('Q','0.8 \cdot Q','0.6 \cdot Q','Location','SouthEast')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('virtualorigin_buoyancy', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%LENGHT
figure;
hold
for i=1:1;
t=currentFinal(i).time;
x=currentFinal(i).position;
l=currentFinal(i).lenght;
px2cm=currentFinal(i).px2cm;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end

plot(x(initial:end)/px2cm,l(initial:end)/px2cm,fmt)
p(i,:)=polyfit(x(initial:end)/px2cm,l(initial:end)/px2cm,1)
end


set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$L \; [cm]$','Interpreter','LaTex','FontSize',20)
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
%          'Location','SouthEast')
     set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('lenght_position', '-depsc', '-r300');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENTRAINMENT AS FUNCTION OF BUYOANCY FLUX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(B,p(:,1),'o')
set(gca,'FontSize',14)
xlabel('$ (Q \cdot g^\prime_0) \; [cm^3 \cdot s^{-3}]$','Interpreter','LaTex','FontSize',20); ylabel('$dH/dx \; [-]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('EHead_buoynacyFlux', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AREA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold
for i=1:1;
    px2cm=currentFinal(i).px2cm;
Area=currentFinal(i).areaTotal/(px2cm.^2);
x=currentFinal(i).position;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,Area(initial:end),fmt)

end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Area \; [cm^2]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('area_position', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AREA HEAD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold
for i=1:1;
AreaHead=currentFinal(i).areaHead/(px2cm.^2);
x=currentFinal(i).position;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,AreaHead(initial:end),fmt)

end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Area Head \; [cm^2]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('areaHead_position', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AREA TAIL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold
for i=1:1;
AreaTail=currentFinal(i).areaTail/(px2cm.^2);
x=currentFinal(i).position;


if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,AreaTail(initial:end),fmt)

end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Area Tail \; [cm^2]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('areaTail_position', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AREAS BY AREA TOTAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold
for i=1:1;
px2cm=currentFinal(i).px2cm;
Area=currentFinal(i).areaTotal/(px2cm.^2);
AreaTail=currentFinal(i).areaTail/(px2cm.^2);
AreaHead=currentFinal(i).areaHead/(px2cm.^2);
x=currentFinal(i).position;



if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,AreaTail(initial:end)./Area(initial:end),fmt)
plot(x(initial:end)/px2cm,AreaHead(initial:end)./Area(initial:end),fmt)

end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Area \; [cm^2]$','Interpreter','LaTex','FontSize',20)
legend('Tail','Head','Location','SouthEast')

set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('areasByArea_position', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Concs BY AREA TOTAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; hold
for i=1:1;
px2cm=currentFinal(i).px2cm;
concTotal=currentFinal(i).concTotal;
concTail=currentFinal(i).concTail;
concHead=currentFinal(i).concHead;
x=currentFinal(i).position;



if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,concTail(initial:end),fmt,'LineWidth',2)
plot(x(initial:end)/px2cm,concHead(initial:end),fmt,'LineWidth',2)
plot(x(initial:end)/px2cm,concTotal(initial:end),fmt,'LineWidth',2)

end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Conc \; [-]$','Interpreter','LaTex','FontSize',20)
legend('Tail','Head','Gravity Current','Location','NorthWest')

set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('concsByArea_position', '-depsc', '-r300');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VOLUME ENTRAINMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; hold
for i=1:1;
Area=currentFinal(i).areaTotal/(px2cm.^2);
t=currentFinal(i).time;
x=currentFinal(i).position;
AreaEst=currentFinal(i).volumeFlowRate.*t/10.5;
%EVolume=(Area-AreaEst)./AreaEst;
EVolume=(Area)./AreaEst;
if i<7; fmt='sb'; elseif i<14; fmt='ob'; else fmt='+b'; end
plot(AreaEst(initial:end),Area(initial:end),fmt)
%plot(x(initial+14:end)/px2cm,EVolume(initial+14:end),fmt)

end
set(gca,'FontSize',14)
xlabel('$ (Q \cdot t) \; [cm^2]$','Interpreter','LaTex','FontSize',20); ylabel('$ \int h .dx \; [cm^2]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','NorthEast')
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('Evolume_position', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SALT CONSERVATION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; hold;
for i=1:1:1;
    px2cm=currentFinal(i).px2cm;
rho=currentFinal(i).initial.density;
Q=currentFinal(i).volumeFlowRate;
t=currentFinal(i).time;
cs=currentFinal(i).initial.massSaltConc;
x=currentFinal(i).position;

%wsEst=cs*Q.*t*rho;


%totalConc=currentFinal(i).totalConc;
wsEst=currentFinal(i).totalSaltMassEst;
%ws=totalConc*(10.5/(px2cm^2))*cs*rho;

ws=currentFinal(i).totalSaltMass;
if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end
plot(x(initial:end)/28.2,wsEst(initial:end),'-','LineWidth',2);
plot(x(initial:end)/28.2,ws(initial:end)/0.81,'o','LineWidth',2);
%p1(i)=plot(t(9:end),wsEst(9:end),'-');
%p2(i)=plot(t(9:end),ws(9:end)/0.9,fmt,'color',p1(i).Color);
clear concAvg rho Q t cs wsEst x clear wsEst ws t totalConc Area x 
end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ w_s \; [g]$','Interpreter','LaTex','FontSize',20)
%legend(p2(1:1:6),'Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','NorthWest')
% legend(p2(1:1:14),'1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('salt_conservation', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SALT CONSERVATION ERROR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; hold;
for i=1:1:1;
    px2cm=currentFinal(i).px2cm;
rho=currentFinal(i).initial.density;
Q=currentFinal(i).volumeFlowRate;
t=currentFinal(i).time;
cs=currentFinal(i).initial.massSaltConc;
x=currentFinal(i).position(1:size(t,2));

wsEst=currentFinal(i).totalSaltMassEst;

% totalConc=currentFinal(i).totalConc;

ws=currentFinal(i).totalSaltMass;

errorRel=100*(wsEst-ws)./wsEst;

if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end

p1=plot(x(9:end)/px2cm,errorRel(9:end),fmt,'LineWidth',2);
clear concAvg rho Q t cs wsEst x clear wsEst ws t totalConc Area x errorRel clear p1 p2
end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$w_s \; Error \; [\%]$','Interpreter','LaTex','FontSize',20)
%legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
% legend('1Exp03','1Exp04','1Exp05','1Exp06','1Exp07','1Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','SouthEast');



plot([1 200],[10 10],'-k'); plot([1 200], -[10 10],'-k');
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('salt_conservationError', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%REYNOLDS NUMBER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; hold;
for i=1:1:1;
    px2cm=currentFinal(i).px2cm;
i
    x=currentFinal(i).position;
    Uf=currentFinal(i).Uf;
    h=currentFinal(i).height;
   
% p=[-330.2745 -64.1169 99.3627];
% rho_mu=polyval(p,concAvgHead);

Re=95.*h*Uf/px2cm;

if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end

plot(x(initial:end)/px2cm,Re(initial:end),fmt);

clear density
clear concAvg rho Q t cs wsEst x clear wsEst ws t totalConc Area x errorRel clear p1 p2 Re Uf rho_my h aMedia
end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Re \; [-]$','Interpreter','LaTex','FontSize',20)
% legend('1Exp03','2Exp04','3Exp05','4Exp06','5Exp07','6Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','NorthWest')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('reynolds_number', '-depsc', '-r300');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%FROUDE NUMBER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; hold;
for i=1:1:1;
    px2cm=currentFinal(i).px2cm;
i
    x=currentFinal(i).position;
    Uf=currentFinal(i).Uf;
    gprime0=currentFinal(i).initial.redGravity;
    h=currentFinal(i).height;
    hp=currentFinal(i).heightPosition;
    %l=currentFinal(i).lenght;
    shapeConc=currentFinal(i).shapeAvgConc;

    for k=13:size(shapeConc,2); concHead(k)=(shapeConc(hp(k),k)); end
    %for k=1:size(shapeAvgConc,1); if l(k)>x(k); l(k)=x(k); end; aMedia(k)=mean(shapeAvgConc(k,x(k)-l(k)+1:x(k))); end
    
    Fr=Uf./sqrt((gprime0*concHead).*(h/px2cm));
    
%for k=2:size(currentFinal(i).imagesConc,3); density(k)=currentFinal(i).imagesConc(456,(x(k)-28), k); end;
%for k=9:size(currentFinal(i).imagesConc,3); density(k)=currentFinal(i).imagesConc(456,(x(k-7)-28), k); end;
if i<7; fmt='s'; elseif i<14; fmt='o'; else fmt='+'; end


plot(x(initial:end)/px2cm,Fr(initial:end),fmt)
%plot(currentFinal(i).position/px2cm,(100)*density.*((currentFinal(i).initial.density-0.9982)+0.9982)*currentFinal(i).Uf.*currentFinal(i).height/px2cm,fmt);
clear density
clear concAvg rho Q t cs wsEst x clear wsEst ws t totalConc Area x errorRel clear p1 p2 shapeAvgConc l Uf Fr aMedia
end
set(gca,'FontSize',14)
xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Fr \; [-]$','Interpreter','LaTex','FontSize',20)
% legend('1Exp03','2Exp04','3Exp05','4Exp06','5Exp07','6Exp08', ...
%         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%          '3Exp01', ...
% 'Location','NorthWest')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print('froude_number', '-depsc', '-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%MAXIMAS E MEDIAS CONC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure; hold;
% for i=1:1:1;
%     px2cm=currentFinal(i).px2cm;
% i
%     x=currentFinal(i).position;
%     Uf=currentFinal(i).Uf;
%     gprime0=currentFinal(i).initial.redGravity;
%     h=currentFinal(i).height;
%     l=currentFinal(i).lenght;
%     
%     shapeAvgConc=currentFinal(i).shapeAvgConc;
%     shapeAvgConc(isnan(shapeAvgConc))=0;
%     
%     for k=1:size(shapeAvgConc,1); if l(k)>x(k); l(k)=x(k); end; aMedia(k)=mean(shapeAvgConc(k,x(k)-l(k)+1:x(k))); aMax(k)=max(shapeAvgConc(k,x(k)-l(k)+1:x(k)));end
%     
%     Fr=Uf./sqrt(gprime0*aMedia.*h/px2cm);
%     
% %for k=2:size(currentFinal(i).imagesConc,3); density(k)=currentFinal(i).imagesConc(456,(x(k)-28), k); end;
% %for k=9:size(currentFinal(i).imagesConc,3); density(k)=currentFinal(i).imagesConc(456,(x(k-7)-28), k); end;
% if i<7; fmt='s-'; elseif i<14; fmt='o-'; else fmt='+-'; end
% 
% 
% plot(x/px2cm,aMedia,fmt)
% %plot(currentFinal(i).position/px2cm,(100)*density.*((currentFinal(i).initial.density-0.9982)+0.9982)*currentFinal(i).Uf.*currentFinal(i).height/px2cm,fmt);
% clear density
% clear concAvg rho Q t cs wsEst x clear wsEst ws t totalConc Area x errorRel clear p1 p2 shapeAvgConc l Uf Fr aMedia aMax
% end
% set(gca,'FontSize',14)
% xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Avg(Conc) \; [-]$','Interpreter','LaTex','FontSize',20)
% % legend('1Exp03','2Exp04','3Exp05','4Exp06','5Exp07','6Exp08', ...
% %         '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
% %          '3Exp01', ...
% % 'Location','NorthWest')
% set(gcf, 'position',[0 0 1000 500])
% set(gcf,'PaperPositionMode','auto')
% print('avg_conc', '-depsc', '-r300');









