function [ imCat,imCatTest ] = NbImCatAllTest( pathBow , nTrain)
% Compute the number of image per category for training / testing

cate = categories();
imCat = nbImCat(pathBow,cate);
imCatTest= imCat-nTrain;



end

