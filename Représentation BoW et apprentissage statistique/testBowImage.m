clc;
close all;
clearvars;

addpath('bow');
addpath('learning');
addpath('../tme1-2/descripteurs');
%%

nomDico = '../tme1-2/clusters.mat';
baseDir = '../tme1-2/Scene/';
baseDirDes = '../tme1-2/sifts/';

patchmin = visuDico( nomDico, baseDir , baseDirDes);


%%
load(nomDico)
% clusters = the_centers;

% [ I, nomim, sifts] = randomImageDes( baseDir, baseDirDes );
I = imread('MITtallbuilding_image_0241.jpg');
nomim = 'Building';
sifts = computeSIFTsImage(I);

%%

K = size(clusters,1);
matNormClusters = zeros(K,1);
for i=1:K
    matNormClusters(i,1)=dot(clusters(i,:),clusters(i,:));
end


[ bow, nc ] = computeBow(sifts, clusters, matNormClusters);
visuBoW( I, patchmin, bow, nc, nomim );

