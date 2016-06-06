function fileName=funcFileName2(imageName,imageFormat,i)

if i<10
    fileName=[imageName,'000',num2str(i),imageFormat];
    elseif 9<i&i<100
            fileName=[imageName,'00',num2str(i),imageFormat];
    elseif 99<i&i<1000
                fileName=[imageName,'0',num2str(i),imageFormat];
    elseif 999<i&i<10000
                fileName=[imageName,num2str(i),imageFormat];
    else 
        i=i-9999;
        if i<10
    fileName=[imageName,'000',num2str(i),imageFormat];
        elseif 9<i&i<100
            fileName=[imageName,'00',num2str(i),imageFormat];
        else 99<i&i<1000
                fileName=[imageName,'0',num2str(i),imageFormat];
        end
      
    end

end
