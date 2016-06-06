function fileName=funcFileName(dirName, j)    

if j<10;
        fileName=([dirName,'/grayMod/grayMod_000',num2str(j),'.JPG']);
    else
        fileName=([dirName,'/grayMod/grayMod_00',num2str(j),'.JPG']);
end
end