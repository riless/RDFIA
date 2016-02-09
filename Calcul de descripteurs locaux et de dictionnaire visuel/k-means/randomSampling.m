function [ des  , normes] = randomSampling( pathDes )

nbPts = 50000;
cate = categories();
imParCat = nbImCat(pathDes,cate);

nim = sum(imParCat);

nParIm = floor(nbPts/nim);

ntot = nParIm*nim;

des = zeros(128,ntot);

cpt=1;

normes = zeros(ntot,1);

for i=1:size(cate,1)
    desdir = strcat(pathDes,cate{i},'/');
    listdes=dir([desdir '*.mat'] );
    
    ni = length(listdes);
    
    for k=1:ni
        namedes = listdes(k).name;
        namedes2 =strcat(pathDes,cate{i},'/',namedes);
        load(namedes2);
        nbdes = size(sifts,2);
        ra = randperm(nbdes);
        
        
        sifts = double(sifts);

        cptD = 0;
        
        for l=1:nbdes
            siftc =  sifts(:,ra(1,l));
            nn = norm(siftc);
            if(nn>10)
                des(:,cpt) = siftc;
                normes(cpt,1)=nn;
                cptD = cptD+1;
                cpt = cpt+1;
                
                if(mod(cpt,10000)==0)
                    strcat(num2str(cpt),'-SIFTs loaded')
                end
                
            end
            if(cptD==nParIm)
                break;
            end
        end


    end
    
end
des = des';
cpt


    function imParCat = nbImCat(pathDes,cate)
        
        
        imParCat = zeros(size(cate,1),1);
        
        for i=1:size(cate,1)
            nameDir = strcat(pathDes,cate{i},'/');
            listima=dir([nameDir '*.mat'] );
            n=length(listima);
            imParCat(i,1) = n;
            
        end
        
        
    end


end

