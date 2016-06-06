function dataSetGray=set2gray(workSet);
%New Data Set in Gray - RGB2Gray
%newSet = RGB2GRAY(workSet);
for i=1:size(workSet,4); dataSetGray(:,:,1,i)=rgb2gray(workSet(:,:,:,i)); end; dataSetGray=double(dataSetGray)/255;
end