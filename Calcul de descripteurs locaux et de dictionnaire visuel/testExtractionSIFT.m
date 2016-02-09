clc
close all
addpath('k-means')
addpath('descripteurs')

%% 3. Chargement d'une image test
% I=imread('Scene/bedroom/image_0001.jpg');

%% Image marche
I = marche();
% x = 125;
% y = 100;
% 
% x = 97;
% y = 121;

x = 121;
y = 121;

%% tools.gif
I = imread('tools.gif');
% x = 80;
% y = 200;
% 
x = 173;
y = 250;

%% Image aléatoire
delta = 8; 
s=16;
dir = 'Scene/';
I = randomImage(dir);
samples = denseSampling(I, s, delta);
r = randi(size(samples, 2));
x = samples(1, r);
y = samples(2, r);

%% SIFT

[Ix,Iy] = compute_gradient(I);

% Module des gradients
Ig = sqrt(Ix.^2 + Iy.^2);

% Calcul de l'orientation du gradient
Ior = orientation(Ix,Iy,Ig);

% Calcul du masque Gaussien
Mg = gaussSIFT(s);

% Calculer le descripteur SIFT
sift = computeSIFT(s, Ig(x:x+s-1, y:y+s-1), Ior(x:x+s-1, y:y+s-1), Mg);
patch = [x;y];

% Visualisation du calcul du descripteur
visuSIFT(I, Ig, Ior, patch, 'marche', s, sift);

%%
% delta=8;
% r=denseSampling(I, s, delta);
% drawRectsImage(I,r,s)