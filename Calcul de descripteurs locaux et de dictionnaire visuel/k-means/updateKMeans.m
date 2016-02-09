function [ newcenters , errorq , movecenters ] = updateKMeans( listPts , centers  , nc)
    errorq=0;
    movecenters=0;
    newcenters  = zeros(size(centers));

    [N,~] = size(listPts);
    [M,~] = size(centers);

    clusterSize = zeros(M, 1);
    
    for i=1:N
        newcenters(nc(i),:) = newcenters(nc(i),:)+listPts(i,:);
        clusterSize(nc(i)) = clusterSize(nc(i)) + 1;         
    end
    
    newcenters = bsxfun(@rdivide, newcenters, clusterSize);

    for i=1:N
        errorq = errorq + norm(listPts(i,:) - newcenters(nc(i),:) ).^2;
    end
    
    for i = 1:M
        movecenters = movecenters + norm(centers(i,:) - newcenters(i,:)).^2;
    end
end