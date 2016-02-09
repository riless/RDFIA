    function imParCat = nbImCat(pathDes,cate)
        
        
        imParCat = zeros(size(cate,1),1);
        
        for i=1:size(cate,1)
            nameDir = strcat(pathDes,cate{i},'/');
            listima=dir([nameDir '*.mat'] );
            n=length(listima);
            imParCat(i,1) = n;
            
        end
        
        
    end