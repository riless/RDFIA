clc;
close all;
clearvars;

addpath('bow');
addpath('learning');
addpath('../tme1-2/descripteurs');

%% spliter les données en train, test

T = 10; % nombres de splits
K = 1000; % taille du bow
pathBow = 'bows/';
nTrain = 100; % nombre de données de train
[ imCat,imCatTest ] = NbImCatAllTest( pathBow , nTrain); % calculer le nombre d'images en train et en test
%%

%% load data
[ train , test ] = loadData( nTrain , imCat , pathBow, K);

% train 1500 * 1000
% test 2985 * 1000

%%
idx_train = 1;
idx_test = 1;
predictclassifieurs = zeros(15, size(test, 1));

for i=1:15
    % x_train = train(idx_train:idx_train + nTrain - 1,:);
    % x_test = test(idx_test:idx_test + imCatTest(i) - 1,:);
    ntest = imCatTest(i);
    [ y, ytest ] = labelsTrainTest( nTrain,ntest, imCat , i );
    values = trainTest( train, test, y);
    predictclassifieurs(i, :) = values(:, 1);
end

%%
[ confusionMatrix , nGoodCat ] = multiClassPrediction( predictclassifieurs , imCatTest );


%%
x = 1:size(nGoodCat, 2);
plot(x, nGoodCat);
set(gca, 'XTick',x, 'XTickLabel',{ 'bedro', 'CALsu', 'indus', 'kitch', 'livin', 'MITco', 'MITfo', 'MIThi', 'MITin', 'MITmo', 'MITop', 'MITst', 'MITta', 'PARof', 'store', })
%%
disp(confusionMatrix);
%%
imshow(confusionMatrix/norm(confusionMatrix), 'InitialMagnification',10000) 
colormap(jet)
colorbar