    function [ sift ] = computeSIFT(s,Ig,Ior,Mg)
  sift = zeros(128,1);
  
  % s = taille du patch 16x16
  % Ig 16x16 taille des gradients
  % Ior 16x16 orientation des gradients
  % Mg Masque Gaussien 16 x 16
  
  bloc = 1;
  for k=1:4:s % Parcours des blocs
      for l=1:4:s
          h = zeros(8,1);
          for i=k:k+3 % pour chaque ligne du bloc
              for j=l:l+3 % pour chaque colonne du bloc
                  if Ior(i,j) ~= 0
                    h(Ior(i, j)) =  h(Ior(i, j)) + Ig(i, j) * Mg(i, j);
                  end
              end
          end
          sift(bloc:bloc+7)=h;
          bloc = bloc + 8;
      end
  end

    % normalisation l2
    norme = norm(sift, 2);
    seuil = 0.5;
    if ( norme <= seuil )
        sift = zeros(size(sift));
    else
        sift = sift/norme;
        
    %seuillage
    sift = min(sift, ones( size(sift) ) .* 0.2);
    
    %renormalisation
    sift = sift/norm(sift, 2);
end