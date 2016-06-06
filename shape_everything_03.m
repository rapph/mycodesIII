%Last Modification: 17/05/2016 ~ Raphael Santos

%Code do extract relevant information about the gravity current flow. 
%***Shape of the current.
%***Heigh of the head.
%***Lenght of the head.
%***Positions of the nose, 
%***Velocity of the head
%***Shape and Concentration profile.

%clear all;

addpath('/home/rr521/Documents/Matlab/functions');
%addpath('C:/Users/r/Desktop/Matlab/functions');

%Load data from the variables createad with dataSet code.
%load var_exp01origin_conc.mat

%#############Important Variables#####################

%Load the variables as workSet. (matrix to work).
workSet=maskMatrixImages; 
workSetConc=maskMatrixConc;

%Converstion factor from number of pixels to centimeter.
px2cm=28.2;

%Number of frames per second was used. It means each image has a time
%difference of 1/fps s.
fps=2;

%OBSOLETE
thrsHold=0.93;

%Number of pixels to be used to smooth data. (moving average)
pxSmooth=300;

%#############Important Variables#####################
%Input Information

% Volume Flow Rate in [cm3/s]
current.volumeFlowRate=208;

% Initial Mass Salt Concentration [g/g]
current.initial.massSaltConc=0.0205;

%Initial Dye Concentration [g/Lw]
current.initial.dyeConc=0.25;

%Initial Density of the Saline Solution [g/cm3]
current.initial.density=conc2dens(current.initial.massSaltConc);

%Frames per second
current.fps=fps;

%thrsRange=[0.85:0.01:0.98]; obsolete.


for k=1:size(workSet,3);
    
    shape2(k,:)=1+sum(workSet(:,:,k)>0); %+1 to keep non-zeros values.
    
    MTime(k)=(k-1)/fps;
    
    %Position of the Front
    for cont=1:size(workSet,2);  
        if shape2(k,cont)<25; MPosition(k)=cont; 
            break; 
        else; 
            MPosition(k)=size(workSet,2); 
        end; 
    end 
end

clear AA BB;
clear a* A*    u* k*    i*

current.time=MTime;
current.position=MPosition;
current.images=workSet;
current.imagesConc=workSetConc;
current.shape=shape2;
current.px2cm=px2cm;
current.threshold=thrsHold;

%Initial Conditions Estimation
current.initial.VolSaltConc=current.initial.massSaltConc*current.initial.density;
current.initial.redGravity=981*(current.initial.density-0.9982)/0.9982;
current.initial.B=current.initial.redGravity*current.volumeFlowRate/10.5;

%
current.Uf=polyder(polyfit(current.time,current.position,1))/current.px2cm;


current.TotalAreaEst=current.time*(current.volumeFlowRate/10.5);

%Agora com position, podemos escrever que: 
%for k=1:size(workSet,3); workSet(:,MPosition(k):end,k)=0; workSetConc(:,MPosition(k):end,k)=0 ;end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Determinar Area e Concentração Current
geralBoolean=workSet>0;
geralBooleanConc=workSetConc>0;

%Area
%Area(:)=sum(sum(geralBoolean));
%current.Area=Area;

%current.E_Volume=(current.Area/(current.px2cm^2)-current.TotalAreaEst)./current.TotalAreaEst;

%Salt Mass 
%densityMatrix here is C(i).*rho(i) matrix.
densityMatrix=conc2dens(workSetConc.*current.initial.massSaltConc).*workSetConc;
Vp=10.5*(1./28.2^2);
%newDensityMatrix=densityMatrix.*current.initial.massSaltConc.*Vp;
Ws(:)=sum(sum(densityMatrix)).*current.initial.massSaltConc*Vp;
current.totalSaltMass=Ws;

current.totalSaltMassEst=current.time*current.volumeFlowRate*current.initial.massSaltConc*(current.initial.density);


%Conc Shape

shapeAvgConc(:,:)=sum(workSetConc)./(sum(geralBoolean)+1);
current.shapeAvgConc=shapeAvgConc;


clear Area areaHead areaTail ans B cmap cont densityMatrix  geralBoolean geralBooleanConc MheadTail k 
clear M* px2cm pxSmooth shap2 shape2Smooth shapeAvgConc thrsHold workSet Vp workSetConc Ws shape2
clear maskMatrixConc maskMatrixImages saveFileName fps 
save('current01','current','-v7.3');
 
