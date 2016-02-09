function [ hmap ] = compute_prediction_heatmap( I , nc , w )
    a = w ; 
    hmap = double(zeros(size(I)));
    r = denseSampling(I,16,8);
    n = size(r,2);
    for i = 1 : size(r,2);
        b = (a(nc(i))/n) + zeros(16 , 16);
        hmap(r(1,i):r(1,i)+15,r(2,i):r(2,i)+15) = ...
        hmap(r(1,i):r(1,i)+15,r(2,i):r(2,i)+15) +b ;
    end
 
 end
