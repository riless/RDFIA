clc;
close all;
clear all;
clearvars;

addpath('bow');
addpath('learning');
addpath('../tme1-2/descripteurs');

%%
nomDico = '../tme1-2/clusters.mat'; 
load(nomDico)

% calcule de la norm du cluster [fixe]
K = size(clusters,1);
matNormClusters = zeros(K,1);
for i=1:K
    matNormClusters(i,1)=dot(clusters(i,:),clusters(i,:));
end

cate = categories();
pathim = '../tme1-2/sifts/';
pathdes = 'bows/';
tstarttot= tic;

%%
for index=1:15 % 15 catégories
    cat = cate{index};
    pathcat = strcat(pathdes,cat,'/');
    if(exist(pathcat)==0)
        mkdir(pathcat);
    end

    direc = strcat(pathim,cat,'/');
    listima=dir([direc '*.mat'] );
    n=length(listima);

    for num=1:n
        % OUVERTURE  IMAGE
        sifts_cat = strcat(direc,listima(num).name)
        load(sifts_cat);
        
        [ bow, nc ] = computeBow(sifts, clusters, matNormClusters);

        desname = strcat(pathcat,listima(num).name(1:length(listima(num).name)-4),'.mat');
        disp(desname)
        save(desname,'bow');
        
        if(mod(num,100)==0)
            strcat('nb patchs=',num2str(size(sifts,2)))
            tcal = toc(tstarttot);
            strcat('temps de calcul =',num2str(tcal))
        end
    end

    tcaltot = toc(tstarttot);    
    strcat('computation time for category :',cat,' =',num2str(tcaltot))
end















