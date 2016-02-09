function [ nc ] = assignementKMeans( listPts , centers , squarenormExamples)

    [N,d] = size(listPts);
    [M,d] = size(centers);
   
    X = zeros(N, M);
    C = zeros(N, M);

    for i=1:N
        X(i, 1:M) = ones(1, M) * (norm(listPts(i,:)).^ 2) ;
    end


  
    for i=1:M
        C(1:N, i) = ones(N, 1) * (norm(centers(i,:)).^ 2) ;
    end

    XC = X + C - 2 * (listPts*centers');
    [~, nc] = min(XC,[],2);
    nc = nc';
end

