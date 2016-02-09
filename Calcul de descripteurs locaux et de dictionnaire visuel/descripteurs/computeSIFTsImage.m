function [ sifts ] = computeSIFTsImage(I) 

    delta = 8; 
    s=16;
    
    [Ix,Iy] = compute_gradient(I);

    % Module des gradients
    Ig = sqrt(Ix.^2 + Iy.^2);

    % Calcul de l'orientation du gradient
    Ior = orientation(Ix,Iy,Ig);

    % Calcul du masque Gaussien
    Mg = gaussSIFT(s);

    % Calculer les SIFTs
    samples = denseSampling(I, s, delta);
    sifts = zeros(128,size(samples,2));
    for i = 1:size(samples,2)
        x = samples(1, i);
        y = samples(2, i);
        sifts(:,i) = computeSIFT(s, Ig(x:x+s-1, y:y+s-1), Ior(x:x+s-1, y:y+s-1), Mg);
    end
   
end

