addpath('k-means')
addpath('descripteurs')

delta = 8; 
s=16;

dir = 'Scene/';
I = randomImage(dir);
samples = denseSampling(I, s, delta);

sifts = computeSIFTsImage(I);
drawPatches(I,samples,s,sifts);