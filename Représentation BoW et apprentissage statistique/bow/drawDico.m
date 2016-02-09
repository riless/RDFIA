function drawDico( patches)

Nt = size(patches,3);
s = size(patches,1);

nx = ceil(sqrt(Nt));
ny= ceil(sqrt(Nt));
ppatches = zeros(s*nx,s*ny);
cpt = 1;
for i=1:nx
    for j=1:ny
        xdeb = (i-1)*s+1;
        xfin = (i)*s;
        ydeb = (j-1)*s+1;
        yfin = (j)*s;
        if(cpt <= size(patches,3))
            ppatches(xdeb:xfin,ydeb:yfin) = patches(:,:,cpt);
        end
        cpt = cpt+1;
    end
end



figure();
colormap(gray);
imagesc(ppatches);


end