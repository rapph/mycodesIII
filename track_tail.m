%Last Modification: 17/05/2016 ~ Raphael Santos

tstBegining=exist('currentFinal');
if tstBegining==0; display('ERROR'); display ('currentFinal=current;'); clear tstBeging; return; end

for current=1:1;
x=currentFinal(current).position; 
images=currentFinal(current).images; 
shape=currentFinal(current).shape;
imagesConc=currentFinal(current).imagesConc;

newShape(:,:)=sum(imagesConc>0.4); %newShape=newShape';

for k=1:size(newShape,2); [h1(k) hp(k)]=max(smooth(newShape(:,k),300)); end


B=currentFinal(current).initial.B;
Q=currentFinal(current).volumeFlowRate;

%Track end of the head.
AreaHeadMedia(1:size(shape,1))=0;

%figure; hold;

for m=0.45:0.01:0.45;

    for k=1:size(shape,1); corte(k)=round(m*h1(k)); end

for k=1:size(shape,1); 
    
    clear AA; 
    
    AA=(imagesConc(454-corte(k),1:hp(k),k)>0.40); 
    
    for i=size(AA,2):-1:1; 

        if (AA(i)==0); 
            
            took(k)=i; 
           
            break; 
        
        end; 
    
    end; 

end


%for i=1:58;figure;  plot(newShape(:,i)); hold; plot([took(i), x(i)],[corte(i) corte(i)]); pause(2); end

for k=1:size(imagesConc,3); AreaHead(k)=sum(sum((imagesConc(:,(1+took(k)):x(k),k))>0)); end
for k=1:size(imagesConc,3); AreaTail(k)=sum(sum((imagesConc(:,(1:took(k)),k))>0));  end
for k=1:size(imagesConc,3); AreaTotal(k)=sum(sum((imagesConc(:,:,k))>0));  end
l=x-(took);

currentFinal(current).areaTail=AreaTail;
currentFinal(current).areaHead=AreaHead;
currentFinal(current).areaTotal=AreaTotal;

for k=1:size(newShape,2); [h1(k)]=shape(k,hp(k)); end

currentFinal(current).height=h1;
currentFinal(current).heightPosition=hp;
currentFinal(current).lenght=l;



for k=1:size(imagesConc,3); concHead(k)=sum(sum(imagesConc(:,(1+took(k)):x(k),k)))./AreaHead(k); end
for k=1:size(imagesConc,3); concTail(k)=sum(sum(imagesConc(:,(1:took(k)),k)))./AreaTail(k);  end
for k=1:size(imagesConc,3); concTotal(k)=sum(sum(imagesConc(:,:,k)))./AreaTotal(k);  end

currentFinal(current).concTail=concTail;
currentFinal(current).concHead=concHead;
currentFinal(current).concTotal=concTotal;



currentFinal(current).E_Head=polyder(polyfit(currentFinal(current).position,currentFinal(current).height,1));

% plot(x(16:end)/28.2,AreaHead(16:end)/28.2^2,'*--');
 %figure;  imshow(imagesConc(:,:,k)>0.05); hold; plot([took(k) took(k)],[1 454]); pause(2);
 %figure; plot(x(16:end)/28.2,AreaTail(16:end)/28.2^2,'*--');

end

% set(gca,'FontSize',14)
% xlabel('$ x \; [cm]$','Interpreter','LaTex','FontSize',20); ylabel('$ Area Head \; [cm^2]$','Interpreter','LaTex','FontSize',20)
% %legend('Exp01','Exp02','Exp03','Exp04','Exp05','Exp06','Location','SouthEast')
% title(['Q = ',num2str(Q),' cm^3/s      B = ',num2str(B),' cm^3/s^3.'])
% legend('\lambda = 0.5','\lambda = 0.6','\lambda = 0.7','\lambda = 0.8', '\lambda = 0.9', ...
%    ... %     '2Exp01','2Exp02','2Exp03','2Exp04','2Exp05','2Exp06','2Exp07', ...
%    ... %      '3Exp01', ...
%    'Location','NorthWest');
% set(gcf, 'position',[0 0 1000 500])
% set(gcf,'PaperPositionMode','auto')
% print(['areaHead_lambda_position',num2str(current)], '-depsc', '-r300');
% %legend('0.5','0.55','0.60','0.65','0.7');
% %clear AreaHeadMedia  h hp shape x images corte m l took
end

clear AA AreaHead AreaHeadMedia AreaTail AreaTotal B corte current h1 hp i images imagesConc k l m newShape
clear Q shape took tstBegining x

save('currentFinal','-v7.3')
% addpath('/home/rr521/Documents/Matlab/functions');

% pause(10)


% %Plot Graphs   
% load cmap
% S=[]; 
% for k=2:4:58;
%  f=figure('visible','off')
% imshow(imagesConc(:,:,k))
% colormap(cmap); caxis([0 0.7])
% hold;
% plot(took(k),454/2,'^','MarkerSize',12,'MarkerEdgeColor','b','MarkerFaceColor',[1,1,1])
% plot(hp(k),454/2,'o','MarkerSize',12,'MarkerEdgeColor','b','MarkerFaceColor',[1,0,0])
% hold;
% hFrame=getframe;
% pause(0.2);
% S=cat(1,S,hFrame.cdata); 
% end
% close(f);


%Plot Tails

