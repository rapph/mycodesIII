%Last Modification:  17/05/2016 ~ Raphael Santos
%Main Program - Read Images
%tic
%######################################################
clear all
%addpath('./../Matlab/functions');
addpath('/home/rr521/Documents/Matlab/functions');
%addpath('C:/Users/r/Desktop/Matlab/functions');
%#############Default Image Properties#################
imageName='DAV_';
imageFormat='.JPG';


%#############Important Variables#####################

%Name to save the results at the end.
saveFileName='var_exp01origin';

%Number of pixels per centimeter.  #######[OBSOLETE] 
%px2cm=28.2; 

%Number of images.
imageLimits=[578 627]; 

%Shot Ratio (Frame per second). #######[OBSOLETE]
%fps=4; 

% Rotation Angle
theta=4.4529; 

% Crop Area ([X Y Width Height])
cropRange=[917 1937 6047-917 2390-1937]; 

%cropRange=[912 1935 6100-912 2382-1929]; %Experimento passado.
%cropRange=[970 1935 6100-912 2391-1935]; 

%Initial Concentration of Dye.
concInitial=0.25; 

%#####################--------------------############################


%Loading, rotating, cropping all experiment images. 
%dataSet is created. - Matrix with all experiment images.
for k=imageLimits(1):imageLimits(2);
    
    j=1+k-imageLimits(1);
    fileName=funcFileName2(imageName,imageFormat,k);
    II=imread(fileName); II2=imrotate(II,theta); II3=imcrop(II2,cropRange);
    dataSet(:,:,:,j)=II3;
end

%Clear no longer needed variables.
clear fileName i II II3 II2 imageFormat imageLimits imageName j S

%Saving the variable dataSet. (Real images, just rotated and cropped)
save(saveFileName);

%Change to gray Scale.
realMatrixImages(:,:,:)=set2gray(dataSet);


%Call the function polynom_usage, to use the polynoms and create the new
%matrix of concentrations.
realMatrixConc=polynom_usage(realMatrixImages);


%Cleaning all auxiliar variables to save only the important ones.
clear p theta cropRange fps concInitial cmap i j IV1 k polyEq px2cm valDiv xEdges yEdges nCalColumn nCalRow workSet
clear  nCol range S thrsVec nCol range S thrsVec
 

% Creating Mask based in 5 % concentration.
%Neglect concentration values less than 0.02 in the images. 
for k=1:size(realMatrixConc,3); mask(:,:,k)=realMatrixConc(:,:,k)>0.03; 
                            maskMatrixConc(:,:,k)=realMatrixConc(:,:,k).*mask(:,:,k); 
                            maskMatrixImages(:,:,k)=realMatrixImages(:,:,k).*mask(:,:,k); 
end

%Because the experiment is conducted on a slope, the boundary of the tank is seen, and so, it needs to be removed. 
maskMatrixImages(1:120,1:500,:)=0; maskMatrixConc(1:120,1:500,:)=0;

%


%clear dataSet realMatrixConc realMatrixImages k mask 

% save([saveFileName,'_conc'],'-v7.3')

clear saveFileName

%Code do write video

% v=VideoWriter('newfile.avi');
% v.FrameRate = 4;
% v.Quality=100;
% open(v);
% for k=1:58
% writeVideo(v ,dataSet(270:end,1:900,:,k))
% end
% close(v)
