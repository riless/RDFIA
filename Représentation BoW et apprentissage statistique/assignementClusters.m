function  [nc] = assignementClusters( sifts , clusters , matNormClusters)

    M = size(clusters, 1);
    sifts = double(sifts');
    N = size(sifts, 1);
    
    matNormClustersPad = zeros(M, N);
    for i=1:M
        matNormClustersPad(i, 1:N) = ones(1,N) * matNormClusters(i);
    end

    X = zeros(N, M);
    for i=1:N
        X(i, 1:M) = ones(1, M) * (norm(sifts(i,:)).^ 2) ;
    end
    
    XC = X + matNormClustersPad' - 2 * (sifts*clusters');
    [~, nc] = min(XC,[],2);
    nc = nc';
    
    
end