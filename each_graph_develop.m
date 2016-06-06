
vetorInst=[14 12 74; 19 12 67; 25 12 61; 20 12 56;15 12 51;13 12 49]
for k=1:6;
x=currentFinal(k).position;
h=currentFinal(k).height;
t=currentFinal(k).time;
Uf=currentFinal(k).Uf;
shape=currentFinal(k).shape;
px2cm=currentFinal(k).px2cm;

for i=1:size(shape,1); shape2(i,:)=shape(i,:)-smooth(shape(1,:),300)'; end
figure; plot([1:5541]'/px2cm,shape2/px2cm)
axis([0 200 0 14])
set(gca,'FontSize',14);
xlabel('$X \; [cm]$','interpreter','Latex','FontSize',18)
ylabel('$h \; [cm]$','interpreter','Latex','FontSize',18)

set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print(['height_develop_profile_exp',num2str(k)], '-depsc', '-r200');
 pause(2)
 
 
 
 
 
 
 
 
 
 
figure; hold; Lenged=cell((vetorInst(k,3)-vetorInst(k,1))/vetorInst(k,2),1); a=0;
for i=vetorInst(k,1):vetorInst(k,2):vetorInst(k,3); xNorm(i,:)=[1:5541]/x(i); shape3(i,:)=smooth((shape(i,:)-smooth(shape(1,:),300)')/h(i),300); 
plot(xNorm(i,:),shape3(i,:),'LineWidth',2)
    a=a+1; Legend{a}=['t=',num2str(i/4)];
end

axis([0 1.03 0 1.2])
set(gca,'FontSize',14);
xlabel('$x/x_{max} \; [-]$','interpreter','Latex','FontSize',18)
ylabel('$h/h_{max} \; [-]$','interpreter','Latex','FontSize',18)
legend(Legend,'Location','NorthWest')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
print(['SHOW_height_develop_profile_exp',num2str(k)], '-depsc', '-r200');
pause(2)
clear x h shape t Uf px2cm xNorm shape2 shape3

end














figure; hold;
for k=1:6;

x=currentFinal(k).position;
px2cm=currentFinal(k).px2cm;
II=currentFinal(k).images;
IIConc=currentFinal(k).imagesConc;
Uf=currentFinal(k).Uf;
height=currentFinal(k).height;
gPrime=currentFinal(k).initial.redGravity;
clear h

xNew=uint16(x-6*px2cm);

for i=11:size(II,3); 
    [VALA VALB]=find(II(:,xNew(i),i)<0.93); 
    h(i)=size(VALA,1); 
    S=0; 
    for j=1:size(VALA,1); 
        S=S+IIConc(VALA(j),xNew(i),i); 
        tConc(i)=S; 
    end
end
clear VALA VALB
if k==4; x(end)=[]; end
concAvg=tConc./h;
Fr=Uf./sqrt(gPrime.*concAvg.*h./px2cm);
Fr2=Uf./sqrt(gPrime.*concAvg.*height./px2cm);
plot(x/px2cm,[Fr2],'o')



clear x h II IIConf Uf gPrime px2cm tConc
end

set(gca,'FontSize',14);
ylabel('$Fr \; [-]$','interpreter','Latex','FontSize',18)
xlabel('$x \; [cm]$','interpreter','Latex','FontSize',18)
legend('exp01','exp02','exp03','exp04','exp05','exp06','Location','NorthEast')
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')

print('SHOW__Fr_position', '-depsc', '-r200');












figure; hold;
for k=1:6;

x=currentFinal(k).position;
px2cm=currentFinal(k).px2cm;
II=currentFinal(k).images;
IIConc=currentFinal(k).imagesConc;
Uf=currentFinal(k).Uf;
gPrime=currentFinal(k).initial.redGravity;
height=currentFinal(k).height;
rho0=currentFinal(k).initial.density;
clear h

xNew=uint16(x-6*px2cm);

for i=11:size(II,3); 
    [VALA VALB]=find(II(:,xNew(i),i)<0.93); 
    h(i)=size(VALA,1); 
    S=0; 
    for j=1:size(VALA,1); 
        S=S+IIConc(VALA(j),xNew(i),i); 
        tConc(i)=S; 
    end
end
clear VALA VALB

concAvg=tConc./h;

rhoP=0.9982+concAvg*(rho0-0.9982);
Re=100*Uf*height.*rhoP/px2cm;
plot(x/px2cm,Re,'o')


pause(2)
clear x h II IIConf Uf gPrime px2cm tConc
end

set(gca,'FontSize',14);
ylabel('$Re \; [-]$','interpreter','Latex','FontSize',18)
xlabel('$x \; [cm]$','interpreter','Latex','FontSize',18)
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
legend('exp01','exp02','exp03','exp04','exp05','exp06','Location','NorthWest')


print('SHOW__Re_position', '-depsc', '-r200');




%Concentração

for k=1:6
figure; hold

II=currentFinal(k).images;
IIConc=currentFinal(k).imagesConc;

   if k==2 | k==4; IIConc(:,:,end)=[];end
IIConcNew=IIConc;

%IIConcNew=(II<0.93).*IIConc;
concs(:,:)=sum(IIConcNew);
concs(concs<5)=0;
pixels(:,:)=sum(II<0.93);
pixels(pixels<20)=0;
concsAvg=concs./pixels;
plot([1:5541]/currentFinal(1).px2cm,concsAvg(:,10:4:end))
axis([0 200 0 0.5])


clear pixels concs concsAvg IIConcNew II IIConc

set(gca,'FontSize',14);
ylabel('$Avg \; Cs/Cs_{0} \; [-]$','interpreter','Latex','FontSize',18)
xlabel('$X \; [cm]$','interpreter','Latex','FontSize',18)
set(gcf, 'position',[0 0 1000 500])
set(gcf,'PaperPositionMode','auto')
%legend('exp01','exp02','exp03','exp04','exp05','exp06','Location','NorthWest')

pause(30)
print(['conc_behav',num2str(k)], '-depsc', '-r200');
end
