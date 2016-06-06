%Plot images
%3D diagram - position x time x height.
%3D diagram - position x time x concentration.
%Gravity current images concentration color.
%
%Program to be used with variable currentFinal(i).

%Add path with functions and colormap.
addpath('/home/rr521/Documents/Matlab/functions');

%Chose which current if currentFinal(current). 
current=1;

%Load variables
imagesConc=currentFinal.imagesConc;
images=currentFinal.images;

shape=currentFinal(current).shape;
shapeConc=currentFinal(current).shapeAvgConc;

px2cm=currentFinal(current).px2cm;

t=currentFinal(current).time;
fps=currentFinal(current).fps;

%Graph information
B=currentFinal(current).initial.B;
V=currentFinal.volumeFlowRate;


%Took
hp=currentFinal(current).heightPosition;
x=currentFinal(current).position;
l=currentFinal(current).lenght;
took=x-l;


figure; imagesc(shape/px2cm); set(gca,'ydir','normal'); load cmap; colormap(cmap)

 hold on
    
    plot( took,fps*t,'^','MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[1,1,1]); 
    plot(   hp,fps*t,'o','MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[1,0,0])
    hold off

set(gca,'xtick',px2cm*[0:20:200]); set(gca,'xtickLabel',[0:20:200])
set(gca,'ytick',fps*[0:2:20]); set(gca,'ytickLabel',[0:2:20])
colorbar
title(['B ~ ',num2str(B,'%.0f'),' cm^{3} s^{-3}','  Q ~ ', num2str(V,'%.0f'),' cm^{3} s^{-1}']);
set(gca,'FontSize',16)
set(gcf,'position',[675   254   964   720]);
set(gcf,'PaperPositionMode','auto')

xlabel('x [cm]'); %ylabel('t [s]'), 
ylabel('t [s]'); %ylabel('t [s]'), 


print(['AAshape_color',num2str(current)], '-depsc', '-r300');

for k=1:size(shapeConc,2); shapeConc(x(k):end,k)=0; end

figure; imagesc(shapeConc'); set(gca,'ydir','normal'); load cmap; colormap(cmap); caxis([0 1])

hold on
    
    plot( took,fps*t,'^','MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[1,1,1]); 
    plot(   hp,fps*t,'o','MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[1,0,0])
    hold off
    
    
set(gca,'xtick',px2cm*[0:20:200]); set(gca,'xtickLabel',[0:20:200])
set(gca,'ytick',fps*[0:2:20]); set(gca,'ytickLabel',[0:2:20])
colorbar
title(['B ~ ',num2str(B,'%.0f'),' cm^{3} s^{-3}','  Q ~ ', num2str(V,'%.0f'),' cm^{3} s^{-1}']);
set(gca,'FontSize',16)
set(gcf,'position',[675   254   964   720]);
set(gcf,'PaperPositionMode','auto')

xlabel('x [cm]'); %ylabel('t [s]'), 
ylabel('t [s]'); %ylabel('t [s]'), 


print(['AAconc_color',num2str(current)], '-depsc', '-r300');
close all
%Begins current developed concentration.
S=[]; 

for k=size(imagesConc,3):-4:1; 
    
   f=figure('visible','off');
   
   imshow(imagesConc(:,:,k)); 
    
     set(gcf,'position',[216         662        1488         205]); 
    
    set(gca,'position',[0.0633    0.3187    0.8723    0.5561]);
    
    colormap(cmap); ;caxis([0 1]); 
    
    dim = [.08 .55 .3 .3];

    str = ['t=', num2str(k/4),' s.'];

    annotation('textbox',dim,'String',str,'FitBoxToText','on','Color','red', 'fontSize',24);
    
     hold on
    
    plot(took(k),454/2,'^','MarkerSize',12,'MarkerEdgeColor','b','MarkerFaceColor',[1,1,1]); 
    plot(hp(k),454/2,'o','MarkerSize',12,'MarkerEdgeColor','b','MarkerFaceColor',[1,0,0])
    hold off
    
   
    
    pause(0.2); h=getframe(gca);  S=cat(1,h.cdata,S); 
    
   close(f);
end

figure; imshow(S); axis on;
set(gca,'xtick',28.2*.2507*[0:20:200]); set(gca,'xtickLabel',[0:20:200])
set(gca,'ytick',[]); set(gca,'ytickLabel',[])
xlabel('x [cm]'); %ylabel('t [s]'), 
colormap(cmap); caxis([0 1]); 
set(gca,'FontSize',16);
set(gcf,'position',[540     3   840   961]);
set(gcf,'PaperPositionMode','auto')
print(['AAcurrent_conc_develop',num2str(current)], '-demf', '-r300');

