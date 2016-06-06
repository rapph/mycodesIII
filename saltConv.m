%Conservação de Sal 
%tic
% clear sumConc Area k i S j IIConc IIBoolean
% addpath('/home/rr521/Documents/Matlab/functions');
% 
% totalConc(81)=0; Area(81)=0; IIConc(441,5838)=0; IIBoolean(441,5838)=0; workSet1(441,5838,1,92)=0; workSet(441,5838,92)=0;
% load var_exp2.mat
% workSet1=set2gray(setFilter(dataSet)); workSet(:,:,:)=workSet1(:,:,1,:); clear workSet1

p=[-2.2091  5.6818 -5.0006 1.526];
 



%Determinar Área da Current
for k=9:81; 
    IIBoolean(:,:)=workSet(:,:,k)<thrsh; 
    IIConc(:,:)=polyval(p,workSet(:,:,k));
    Area(k)=sum(sum(IIBoolean)); %Area em Pixels.
S=0;
for i=1:441;
    for j=1:5838;
        if IIBoolean(i,j)==1; S=IIConc(i,j)+S; end
    end
end
totalConc(k)=S;
 


time(k)=k/4;

end
massSalt=(15)*totalConc/(30.7^2);

%Hipotetical Salt in the Tank
V=200; %cm³/s
rho=1.0707; %g/cm³
time=[1:91]/4;
salineSolutionConc=0.1;

hipMassSalt=(rho*V*time*salineSolutionConc);


hipMassSaltN=hipMassSalt(9:81);
massSaltN=massSalt(9:81);
timeN=time(9:81);

%Area THRSHOLD TIME

% f=figure;
% plot(timeN, massSaltN,'or','LineWidth', 1); hold
% plot(timeN, hipMassSaltN,'-k','LineWidth', 2)
% set(gca,'FontSize',14)
% set(gcf, 'Position',[0 0 1000 500])
% xlabel('Time [s]')
% ylabel('Mass of Salt [g]')
% 
% mdl=fitlm(max(mediaSmooth((9+25):81,:)'), polyval(p1,MPosition((9+25):81)/30.7));
% legend('Light attenuation','Experimental Estimation')
% [erroRelative,ww]=max(abs(massSaltN-hipMassSaltN)./hipMassSaltN)
% set(gcf, 'PaperPositionMode','auto')
% print(f, 'salt_conservation_time.png', '-dpng','-r200','-noui');


aux=0; for contTHRSH=1:10; i, thrsh=0.99+aux, saltConv; AreaTHRSH(:,contTHRSH)=Area'; totalConcTHRS(:,contTHRSH)=totalConc'; aux=aux-0.01, end



%Area THRSHOLD Position
% f=figure;
% plot(9.29*time(1:8:81)'+1.12,AreaTHRSH(1:8:81,:)/AreaTHRSH(81,1),'o-')
% grid on;
% set(gca,'FontSize',14)
% set(gcf, 'Position',[0 0 1010 509])
% xlabel('x [cm]')
% ylabel('Area/max(Area) [g]')
% legend('0.99','0.98','0.97','0.96', '0.94', '0.93', '0.92', '0.91', '0.9');
% set(gcf, 'PaperPositionMode','auto')
%  set(gca,'GridLineStyle','-')
%  set(gca,'GridAlpha',0.3)
%  set(gca,'gridColor','k')
%  print(f, 'area_thtrshold_position.png', '-dpng','-r200','-noui');
% 
% 
% %Mass of Salt Different Threshold

massSaltTHRS=(15)*totalConcTHRS/(30.7^2);
f=figure;
plot(9.29*time(1:8:81)'+1.12, massSaltTHRS(1:8:81,1:2:end),'o','LineWidth', 1); hold
plot(9.29*time(1:8:81)'+1.12, hipMassSalt(1:8:81),'-k','LineWidth', 2)
grid on;
set(gca,'FontSize',14)
set(gcf, 'Position',[0 0 1010 509])
xlabel('x [cm]')
ylabel('Mass Salt [g]')
legend('0.99','0.97', '0.94',  '0.92', '0.9');
set(gcf, 'PaperPositionMode','auto')
 set(gca,'GridLineStyle','-')
 set(gca,'GridAlpha',0.3)
 set(gca,'gridColor','k')
 print(f, 'massSAlt_thtrshold_position.png', '-dpng','-r200','-noui');
% 
% 
% 
% 
