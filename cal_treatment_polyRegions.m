%Variable that contains the callibration images.
workSet=II7;

%Concentration values vector related with workSet(:,:,k) ~ conc(k), k=1..n;
conc=[0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.12 0.14 0.16 0.18 0.20 0.24 0.28 0.34 0.4];

%Number of divisions in the vertical axis. 
nCalRow=6;

%Number of divisions in the horizontal axis. (Function of nCalRow, or size(workSet,2)/nCalColumn = size(workSet,1)/nCalRow
nCalColumn=nCalRow*size(workSet,2)/size(workSet,1);

%Defining the position to divide the areas.
valDiv(1)=size(workSet,1)/nCalRow;
valDiv(2)=size(workSet,2)/nCalColumn;

yEdges=1:round(valDiv(1)):size(workSet,1);
xEdges=1:round(valDiv(2)):size(workSet,2);

yEdges=[yEdges size(workSet,1)];
xEdges=[xEdges size(workSet,2)];

%Creating a matrix divided in areas with average values for each area.
for k=1:size(workSet,3);
	
	for i=1:size(yEdges,2)-1;
	
		for j=1:size(xEdges,2)-1;

			matrixAVG(i,j,k)=mean2(workSet(yEdges(i):yEdges(i+1),xEdges(j):xEdges(j+1),k));
	
		end
	
	end

end

clear data polyEq

%It is just because I loaded images with concentrations I do not want to use, as 0.34 and 0.40.
conc(end-1:end)=[];

for i=1:size(matrixAVG,1);
    for j=1:size(matrixAVG,2);
        data(:)=matrixAVG(i,j,1:end-2); % end-2 here just to correct removing 0.34 and 0.4.
        p=polyfit(data,conc,5);
        polyEq(i,j,:)=p;
        residuo(i,j)=mean(abs(conc-polyval(p,data)));
    end
end

%Save the variables with polynoms.
save('cal_poly','polyEq')

%Veryfy polynoms - if want to check plots of the data and the polynom.
%for i=6:6;
%    for j=1:61;
%        avgVal(:)=matrixAVG(i,j,1:18);
%        p(:)=polyEq(i,j,:);
%        y=polyval(p,avgVal);
%        figure
%        plot(avgVal,conc,'o');hold;plot(avgVal,y)
%        pause(1)
%    end
%end
