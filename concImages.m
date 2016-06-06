function S=concImages(workSet,initial,step,final);
% Concantanation of Images
%workSet=dataSetGray; 
if (initial==0|step==0|final==0); step=1; initial=1;   final=size(workSet,4); end;
imCount=(initial+step):step:final;
S=workSet(:,:,:,initial); for i=imCount; S=cat(1,S, workSet(:,:,:,i)); end;
end