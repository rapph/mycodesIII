function dataSetFilter=setFilter(workSet);
%Filter DataSet
% newSet= 255 - workSet(time=1) + workSet; 
dataSetFilter=workSet;
for i=1:size(workSet,4); dataSetFilter(:,:,:,i)=(255-workSet(:,:,:,1))+workSet(:,:,:,i); end
end
