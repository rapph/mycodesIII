%Main Program - Read Images

%*****
clear all
addpath('/home/rr521/Documents/Matlab/functions');

%*****Default Image Properties
imageName='DAV_';
imageFormat='.JPG';
saveFileName='var_exp01origin';

%*****Important Variables
px2cm=28.2; %Number of pixels per centimeter. 
imageLimits=[6088 6179]; %Number of images.
fps=4; %Shot Ratio (Frame per second).
theta=4.1432; % Angle of slope.
cropRange=[533 2000 5540 480]; % Crop Area ([X Y Width Height])
p=[24.6346 -82.5412 103.1615 -57.1778 11.9248]; %Polynom of Calibration
concInitial=0.25; %Initial Concentration of Dye.

for k=imageLimits(1):imageLimits(2);
    
    j=1+k-imageLimits(1);
    fileName=funcFileName2(imageName,imageFormat,k);
    II=imread(fileName); II2=imrotate(II,theta); II3=imcrop(II2,cropRange);
    dataSet(:,:,:,j)=II3;
end

clear fileName i II II3 II2 imageFormat imageLimits imageName j S
save(saveFileName)


exp06(:,:,:)=set2gray(setFilter(dataSet)); 
exp06(1:120,1:500,:)=1;
exp06Conc=polyval(p,exp06);
exp06Conc=polyval(p,exp06)/concInitial;
exp06Conc(exp06Conc>1)=1; exp06Conc(exp06Conc<0)=0;
clear dataSet

save([saveFileName,'_conc'])



