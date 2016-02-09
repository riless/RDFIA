function [ I , nomim , sifts] = randomImageDes( baseDir , baseDirDes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


cate = categories();
index = randi(15);


cat = cate{index};

path = strcat(baseDir,cat,'/');
listima=dir([path '*.jpg'] );
n=length(listima);
num = randi(n);

if(num<10)
    nom = strcat('/image_000',num2str(num));
elseif(num<100)
    nom = strcat('/image_00',num2str(num));
else
    nom = strcat('/image_0',num2str(num));
end

nomim = strcat(baseDir,cat,nom,'.jpg');
I = imread(nomim);

nomim = strcat(cat,'-',num2str(num));

nomdes = strcat(baseDirDes,cat,nom,'.mat');
load(nomdes);


end

