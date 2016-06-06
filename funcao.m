function []=funcao(px2cm)

 %Figure Position
 %set(gcf,'Position',[0 0 1800 265]);
  set(gcf,'Position',[138 605 1568 205]); %%%%%%%%%%%%%
%Axis label
xlabel('x [cm]');
ylabel('y [cm]');

%Font Size of Label and Ticks Numbers.
set(gca,'FontSize',16)

%Set of X and Y Ticks.
set(gca,'XTick',px2cm*([0:10:250])); h = get(gca,'xtick'); set(gca,'xticklabel',round(h/px2cm*10^2)/10^2);
set(gca,'YTick',(px2cm*([0:4:16]+1.08))); h = get(gca,'ytick'); set(gca,'yticklabel',+17-round((h/px2cm*10^2)/10^2));
%set(gca,'YTick',30.7*([0:4:14])); h = get(gca,'ytick'); set(gca,'yticklabel',round(h/30.7*10^2)/10^2);

%Enable Minor Ticks
set(gca,'XMinorTick','on','YMinorTick','on')

%Set ticks outside of plot area.
set(gca,'TickDir','out')

%Set position of the plot area.
%set(gca,'Position',[0.055 0.3 0.88 0.6]);
%set(gca,'Position',[0.07 0.34 0.83 0.6]); %%%%%%%%%%%%%%%%
set(gca,'Position', [0.0700 0.3400 0.9000 0.6000]) %new!!!!!!!!! 
%PaperPosition Auto.
set(gcf,'PaperPositionMode','auto');
%set(gcf,'PaperPosition',[435 487 1062 163]);


% set(gcf,'Position',[1 1 1847 191])
% set(gcf,'PaperPosition',[0    0    1062    163])
% set(gcf,'PaperPositionMode','auto');
% set(gcf,'PaperOrientation','portrait');
% set(gca,'Position',[0.0700    0.3400    0.8300    0.6000])




end
