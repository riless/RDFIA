function [ train , test ] = loadData( nTrain , imCat , pathBow, K)


cate = categories();
ncat = length(cate);
imTot = sum(imCat)

ntest = imTot-ncat*nTrain;
train = zeros(ncat*nTrain,K);
test = zeros(ntest,K);


'chargement donnees train/test'
cpt=1;
cptTest=1;

for i=1:ncat
    
    
    y = zeros(1,ncat*nTrain);
    ytest = zeros(1,ntest);
    
    ra = randperm(imCat(i,1));
    
    cat = cate{i};
    desdir = strcat(pathBow,cat,'/');
    listdes=dir([desdir '*.mat'] );
    % chargement de l'ensemble des bow en train / test
    
    for k=1:nTrain
        namedes = listdes(ra(k)).name;
        namedes2 =strcat(desdir,namedes);
        load(namedes2);
        
        train(cpt,:) = bow;
        cpt = cpt+1;
        
    end
    for k=nTrain+1:imCat(i,1)
        namedes = listdes(ra(k)).name;
        namedes2 =strcat(desdir,namedes);
        load(namedes2);
        
        test(cptTest,:) = bow;
        
        cptTest = cptTest+1;
    end
    % fin chargement de l'ensemble des bow en train / test
end


end

