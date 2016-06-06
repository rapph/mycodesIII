%Program Shape, Height, Lenght, Positions, Velocity, etc.

clear all;
addpath('/home/rr521/Documents/Matlab/functions');

thrsRange=[0.85:0.01:0.98];
thrsHold=0.97;
pxSmooth=614;

for k=1:74;
    k
a=1;

for i=thrsHold;
    shape2(k,:)=sum(workSet(:,:,k)<i);
    shape2Smooth(k,:)=smooth(shape2(k,:),pxSmooth);
    MTime(k)=(k-1)/4;
    MThrs(a,k)=i;
    MHeight(a,k)=max(shape2Smooth(k,:)); %Head Height  

    %Position of the Front
    for cont=1:size(workSet,2);  if shape2(k,cont)<25; MPosition(a,k)=cont; break; end; end 

%End of the Head, position between Head and Tail. 
% for j=5469:-1:1; if dataSetGray(300,j,1,k)<i==1; pos1=j-45; break; end;end; clear j 
% for j=pos1:-1:1; if dataSetGray(300,j,1,k)<i==0; pos2=j;  break; end; end; clear j pos1
% endHead(k)=pos2; clear pos2

%[aa,bb]=hist(shape2(1,endHead(k):MPosition(k)),3);

clear aa; clear bb;

%figure; imshow(dataSetGray(:,:,1,k)<i); hold; plot([MPosition(k) endHead(k)],size(dataSetGray,1)-[headHeight(k) headHeight(k)],'r'); pause(2);

a=a+1;
end 
end
clear AA BB;

clear a* A* c*   u* k*  t*  i*

% h=area([1:5736]/30.7,shape2(81,:)/30.7);
% hold; a=1;
% for i=69:12:9;
%     h=area([1:5838]/30.7,shape2(i,:)/30.7);
% end
save('var_shape_everything');
 

%No final, temos: 
%MTime -> vetor que representa variação do tempo em segundos.
%Mthrs -> vetor que representa variação do Threshold.
%MHeightHead -> 

%Track Head
%for k=16:4:81; figure; imshow(dataSetGray(:,:,1,k)<0.95); hold; plot([endHead(k) endHead(k)],[0 422],'r'); pause(2); end