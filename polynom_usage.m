function workSetConc=polynom_usage(workSet);

addpath('/home/rr521/Documents/Matlab/functions');
load cal_poly;
%Now, my workSet is the experiment images.
%So, the code will divde the new images in 6 rows and 6*x/y columns.

nCalRow=12;
nCalColumn=nCalRow*size(workSet,2)/size(workSet,1);

valDiv(1)=size(workSet,1)/nCalRow;
valDiv(2)=size(workSet,2)/nCalColumn;

yEdges=1:round(valDiv(1)):size(workSet,1);
xEdges=1:round(valDiv(2)):size(workSet,2);

yEdges=[yEdges size(workSet,1)];
xEdges=[xEdges size(workSet,2)];

for k=1:size(workSet,3);
    
for i=1:size(yEdges,2)-1;
 
    for j=1:size(xEdges,2)-1;
        
        p(:)=polyEq(i,j,:);
        workSetConc(yEdges(i):yEdges(i+1),xEdges(j):xEdges(j+1),k)=polyval(p, workSet(yEdges(i):yEdges(i+1),xEdges(j):xEdges(j+1),k));
    end
   
end
end

workSetConc=workSetConc/0.25;

%Leveling the bottom horizontal line.
aMais=sum(workSetConc(:,:,1)>0.2);
aFinal(size(workSetConc,1)+max(aMais),size(workSetConc,2),size(workSetConc,3))=0;
for k=1:size(workSetConc,3); for column=1:size(workSetConc,2); aFinal((1+max(aMais)+aMais(column)):end,column,k)=workSetConc(1:(end-aMais(column)),column,k); end; end
aFinal(1:max(aMais),:,:)=[];
workSetConc=aFinal;

%Corretctions
%workSetConc(workSetConc>1)=1;
workSetConc(workSetConc<0)=0;

end
