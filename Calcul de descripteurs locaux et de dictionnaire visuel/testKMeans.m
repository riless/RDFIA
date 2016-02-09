addpath('k-means')
addpath('descripteurs')

%% load sifts

dir  = 'sifts/';
[points,norms] = randomSampling(dir); % choisir 50 000 points au hasard

%% calculate centers
M = 1000;
nb_test = 1; % nombre de test aléatoire de KMeans
errors = zeros(nb_test);
the_centers = zeros( M, 128 );

for i=1:nb_test
    disp( strcat( 'CALCULE CLUSTER ', num2str(i) ) );
    
    [centres,error] = solutionKMeans(points,M);
    errors(i) = error;
    if ( i == 1)
        the_centers = centres;
    elseif ( i > 1 & errors(i-1)>errors(i))
        the_centers = centres;
    end
end

%% the_center contient le centre optimale
% Ajouter le vecteur null
size( the_centers )
%%
sift_nulle = zeros(1, size(the_centers, 2));
%%
the_centers = vertcat(the_centers, sift_nulle );
save('dictVisuel.mat','the_centers');


