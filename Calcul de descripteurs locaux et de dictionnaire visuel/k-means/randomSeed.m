function [ centers ] = randomSeed( listPts, K )

centers = zeros(K,size(listPts,2));
size(centers)
size(listPts)

nd = size(listPts,1);
ran = randperm(nd);
centers = listPts(ran(1,1:K),:);

end

