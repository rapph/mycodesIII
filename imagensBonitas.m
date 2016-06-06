%Experimento Trheshold

% clear all;
% load var_exp2.mat
% load cmap.mat
% addpath('/home/rr521/Documents/Matlab/functions');
% workSet(:,:,:)=set2gray(setFilter(dataSet));
% S=[];

function S=imagesBonitas(workSet,time,kind,px2cm); 
S=[];
load cmap;
for k=time(1):time(2):time(3);

    if kind==1;
    
   f=figure('visible','off');
   %contour(II,[0.89 0.91 0.93 0.95 0.97 0.99]); caxis([0.89 0.99]); 
   %contourf(IIconc); %caxis([0 100]); 
   
   IIconc=workSet(:,:,k);
   imshow(IIconc); caxis([0 0.8]); 
   axis on
    colormap(cmap); %colorbar;
    funcao(px2cm);
    
   % if k~=time(3); set(gca,'xticklabel',[]); set(gca,'xlabel',[]); set(gca,'Position',[0.0700 0.05 0.9000 0.9000]) 
   % set(gcf,'Position',[69 805 1568 141]); end
    h=getframe(gcf);
    S(:,:,:,k)=h.cdata;

    end
close(f);
end


end

% %p=[-2.2091  5.6818 -5.0006 1.526];
% 
% v=VideoWriter('newfile.avi');
% v.FrameRate = 4;
% v.Quality=100;
% 
% open(v)
% 
% for k=9:1:81;
%     II=workSet(:,:,k); %II=flipud(II);
%     
%     IIconc=100*polyval(p,II)/0.15;
%     
%     
%     f=figure('visible','off');
%    %contour(II,[0.89 0.91 0.93 0.95 0.97 0.99]); caxis([0.89 0.99]); 
%    %contourf(IIconc); %caxis([0 100]); 
%     imshow(IIconc); caxis([0 40]); axis on
%     colormap(cmap); colorbar;
% 
% %funcao;
% %set(f,'Position',[130 634 1080 250])
% %set(gca,'Position',[0.06 0.4 0.85 0.47])
% 
% %if k~=81; set(gca,'xticklabel',[]); set(gca,'xlabel',[]); end
% %print(f, ['thr_contour_',num2str(k),'.png'], '-dpng','-r200','-noui');
% 
% h=getframe(gcf);
% size(h.cdata)
% writeVideo(v,getframe(gca));
% %S=cat(1,S,h.cdata);
% 
% close(f);
% end
% close(v);
