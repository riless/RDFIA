function [centres,erreur] = solutionKMeans(points,M)
    
   [N,d] = size(points); 

   %% Initialisation des centres
   K = M;
   centres = randomSeed(points,M);
   movecenters = 1;
   listPts = points;
   %% tant que les centres ne sont pas stables
   while movecenters ~= 0
       nc = assignementKMeans(listPts,centres);
       [ centres , erreur , movecenters ] = updateKMeans(listPts , centres  , nc);       
   end
  

end