function [Iori] = orientation( Ix, Iy , Ig)

[n,m] = size(Ix);


taille = 8;
ori = zeros(taille,2);
for i=1:taille
    ori(i,1) =  cos(2*pi*(i-1)/taille);
    ori(i,2) =  sin(2*pi*(i-1)/taille);
end


Iori = zeros(n,m);

    for i=1:n
        for j=1:m
            if(Ig(i,j)>0)
                v = [ Ix(i,j) ; - Iy(i,j)] ;               
                v = v/ norm(v);
                prod = ori * v;
                [Y,I] = max(prod);
                Iori(i,j) = I; 
            end
        end
    end

    
end

