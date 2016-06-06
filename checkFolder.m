function checkFolder(workFolder)

if exist(workFolder)
rmdir(workFolder,'s');
end
display(workFolder)
mkdir(workFolder);
