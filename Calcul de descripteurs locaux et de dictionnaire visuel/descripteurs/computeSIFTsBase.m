clear all;
close all;


cate = categories();

% A REMPLACER AVEC LE DOSSIER CONTENANT LES IMAGES 
pathim = 'Scene/';

% A REMPLACER AVEC LE DOSSIER CONTENANT LES DESCRIPTEURS SIFT 
pathdes = 'descripteurs/';

s= 16;
delta = 8;

catinit = 1;
catend =15;

for index=catinit:catend
    cat = cate{index};
    % CREATION DU DOSSIER DESCRIPTEURS POUR LA CLASSE SI INEXISTANT
    pathcat = strcat(pathdes,cat,'/');
    if(exist(pathcat)==0)
        mkdir(pathcat);
    end
    
    tstarttot= tic;

    direc = strcat(pathim,cat,'/');
    listima=dir([direc '*.jpg'] );
    n=length(listima);
    
    
    % CALCUL DES DESCRIPTEURS POUR LA CLASSE INDEX 
    for num=1:n
        % OUVERTURE  IMAGE
        I = imread(strcat(direc,listima(num).name));
        
        % CALCUL DES SIFTs (VOTRE FONCTION)
        [ sifts ] = computeSIFTsImage(I);
     
        % STOCKAGE DES SIFTs en unit8
        sifts=uint8(sifts*255);

        desname = strcat(pathcat,listima(num).name(1:length(listima(num).name)-4),'.mat');
        
        save(desname,'sifts');
        
        if(mod(num,100)==0)
            strcat('nb patchs=',num2str(size(sifts,2)))
            tcal = toc(tstarttot);
            strcat('temps de calcul =',num2str(tcal))
        end
    end
    
      
    
    tcaltot = toc(tstarttot);
    
    
    strcat('computation time for category :',cat,' =',num2str(tcaltot))
    
    
end
















