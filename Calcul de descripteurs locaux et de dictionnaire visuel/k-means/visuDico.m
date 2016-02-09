function [ patchmin ] = visuDico( nomDico ,  baseDir , baseDirDes)


load(nomDico);
% clusters = the_centers;   

K = size(clusters,1);

s=16;
delta=8;
cate = categories();

mini = zeros(K,1);
mini(:,1) = realmax;

patchmin = zeros(s,s,K);
pas = 10;

for index=1:15
    
    cat = cate{index}
    
    desdir = strcat(baseDirDes,cat,'/');
    desim =  strcat(baseDir,cat,'/');
    
    
    listdes=dir([desdir '*.mat'] );
    ni = length(listdes);
    
        
    
    for k=1:pas:ni
        if(mod(k,100)==0)
            k
        end
        namedes = listdes(k).name;
        namedes2 =strcat(desdir,namedes);
        load(namedes2);
        
        
        %%
        nameim = strcat(namedes(1:length(namedes)-4),'.jpg');
        nameim2 =strcat(desim,nameim);
        I = imread(nameim2);

        [ r ] = denseSampling( I, s, delta );
        
        
        n = size(sifts,2);
        y = double(sifts);
        
        
        N = size(y,2);
        M =  size(clusters,1);
        D= zeros(N,M);
        
        A = zeros(N,1);
        for i=1:N
            A(i,1) = norm(y(:,i)).^2;
        end
        A = repmat(A,1,M);
        
        C = zeros(1,M);
        for i=1:M
            C(1,i) = norm(clusters(i,:)).^2;
        end
        C = repmat(C,N,1);
        B = y' * clusters';
        
        D = A + C - 2*B;
        
        [mm, ymin ] = min(D);
        
        for j=1:K
            if(mm(j)<mini(j,1))
                mini(j,1) = mm(1,j);
                patchmin(:,:,j) = I(r(1,ymin(1,j)):r(1,ymin(1,j))+s-1 , r(2,ymin(1,j)):r(2,ymin(1,j))+s-1  );
            end
        end
    end 
end
drawDico( patchmin);

end

