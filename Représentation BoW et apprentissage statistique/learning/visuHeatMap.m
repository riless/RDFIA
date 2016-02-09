function visuHeatMap( I , nc, w, hmap, patchmin , nomim)

K = size(patchmin,3);
bow = zeros(K,1);
for i=1:K
    bow(i) = sum(nc(1,:)==i);
end
bow = bow / size(nc,2);
hadamard = w.*bow;

s= 16;
delta = 8; 
[ r ] = denseSampling( I, s, delta );

[bs,yb] = sort(hadamard);
nb=8;
pbest = zeros(s,s,nb);
ybest = zeros(nb,1);
for i=0:nb-1
    pbest(:,:,i+1) = patchmin(:,:,yb(K-i,1));
    ybest(i+1,1) = yb(K-i,1);
end

J = zeros(size(I,1),size(I,2),3);
for i=1:3
    J(:,:,i) = I(:,:);
end

scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/8 scrsz(2) 3*scrsz(3)/4 scrsz(4)])
%colormap(gray);
subplot(2,2,1);
J = uint8(J);
imagesc(J);
axis off;
title(strcat('Image:',nomim));

subplot(2,2,2);
J = double(J);

cm=hsv(nb);
%cmr = hsv2rgb(cm)*255;
cmr = cm*255;
%cm = jet(nbp);

for i=1:size(r,2)
    [Jj] = find(ybest(:,1)==nc(1,i));
    if(not(isempty(Jj)))
        indi = (Jj-1)+1;
        for k=1:3
            J(r(1,i),r(2,i):r(2,i)+s-1,k) = cmr(indi,k);
            J(r(1,i):r(1,i)+s-1,r(2,i),k) =cmr(indi,k);
            J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,k)=cmr(indi,k);
            J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,k) = cmr(indi,k);
        end
        
    end
    
end
J = uint8(J);
imagesc(J);
axis off;
title('8 most impcating visual words for classifying the image');

subplot(2,2,3);
imagesc(hmap);
colormap(jet);
title('heat map');
colorbar();

subplot(2,2,4);


iim = zeros(4*16,4*16,3);


cpt =1;
for i=1:2
    for j=1:4
        xdeb = 2*(i-1)*s+1;
        ydeb = (j-1)*s+1;
        for k=1:3
            iim(xdeb:xdeb+s-1,ydeb:ydeb+s-1,k) = pbest(:,:,cpt);
        end
        
        xdeb = xdeb+s;
        for k=1:3
            iim(xdeb:xdeb+s-1,ydeb:ydeb+s-1,k) = cmr(cpt,k);
        end
        
        cpt = cpt+1;
    end
end
imagesc(uint8(iim));

%colormap(gray);
%imagesc(uint8(ppatches));
grid on;
axis([1 64 1 64],'square');
set(gca,'XTick',[1:16:64], 'XColor', 'r');
set(gca,'YTick',[1:16:64], 'YColor', 'r');
%a= zeros(8,1);for i=1:8 a(i) = bs(K+1-i);end
title('8 strongest visual words appearence');
%title(strcat('8 strongest visual words appearence',num2str(a(:)')));

end

