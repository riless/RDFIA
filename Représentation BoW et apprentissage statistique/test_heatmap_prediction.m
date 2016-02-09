clc;
close all;
clearvars;

addpath('bow');
addpath('learning');
addpath('../tme1-2/descripteurs');

% spliter les données en train, test

T = 10; % nombres de splits
K = 1000; % taille du bow
pathBow = 'bows/';
nTrain = 100; % nombre de données de train
[ imCat,imCatTest ] = NbImCatAllTest( pathBow , nTrain); % calculer le nombre d'images en train et en test

[ train , test , ras ] = loadData2( nTrain , imCat , pathBow, K);

% calculer l'assignement nc au mot visuel le plus proche
nomDico = '../tme1-2/clusters.mat'; 
load(nomDico)
% calcule de la norm du cluster [fixe]
K = size(clusters,1);
matNormClusters = zeros(K,1);
for i=1:K
    matNormClusters(i,1)=dot(clusters(i,:),clusters(i,:));
end


nomDico = '../tme1-2/clusters.mat';
baseDir = '../tme1-2/Scene/';
baseDirDes = '../tme1-2/sifts/';

patchmin = visuDico( nomDico, baseDir , baseDirDes);


%%
% choisir une image de test
addpath('learning/libsvm/matlab/');



% cat_i = 5;
% cat = 'livingroom/';
% nomim = 'image_0029';

cat_i = 10;
cat = 'MITmountain/';
nomim = 'image_0267';

direc = strcat('../tme1-2/sifts/');
I = imread(strcat( '../tme1-2/Scene/',cat,nomim, '.jpg') );

sifts_cat = strcat(direc,cat,nomim, '.mat');
load(sifts_cat);
[ bow, nc ] = computeBow(sifts, clusters, matNormClusters);

% apprendre sur train et y


ntest = imCatTest(cat_i);
[ y, ytest ] = labelsTrainTest( nTrain,ntest, imCat , cat_i );

model = svmtrain(y, train, '-c 1000 -t linear');
[w,b] = getPrimalSVMParameters(model);

% charger le classifieur de la catégorie MITforest (7)

[ hmap ] = compute_prediction_heatmap( I , nc , w );

visuHeatMap( I , nc, w, hmap, patchmin , nomim)
