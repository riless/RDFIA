function [ ] = visuSIFT( I, Ig,Ior, patch, nomim,s,sift )

K = drawRectsImage2(I,patch,s,1);
[ Iori] = orientationsColor( );

scrsz = get(0,'ScreenSize');
figure('Position',[0 scrsz(2) 4*scrsz(3)/4 scrsz(4)])
%whitebg('white');
subplot(2,3,1);
%colormap(gray);
imagesc(K);
title(nomim);
%axis off;
subplot(2,3,2);
II = zeros(s,s,3);
II(:,:,1)=I(patch(1,1):patch(1,1)+s-1,patch(2,1):patch(2,1)+s-1);
II(:,:,2)=II(:,:,1);
II(:,:,3)=II(:,:,1);
imagesc(uint8(II));
title('patch on image');
grid on;
axis([1 16 1 16],'square');
set(gca,'XTick',[1:4:16], 'XColor', 'r');
set(gca,'YTick',[1:4:16], 'YColor', 'r');
subplot(2,3,3);
colormap('jet');
imagesc(Ig(patch(1,1):patch(1,1)+s-1,patch(2,1):patch(2,1)+s-1));
colorbar;
title('module of gradient');
grid on;
axis([1 16 1 16],'square');
set(gca,'XTick',[1:4:16], 'XColor', 'w');
set(gca,'YTick',[1:4:16], 'YColor', 'w');
%axis off;
subplot(2,3,4);
imagesc(Iori);
colorbar;
caxis([0 8]);
title('orientation color code');
axis off;
subplot(2,3,5);
imagesc(Ior(patch(1,1):patch(1,1)+s-1,patch(2,1):patch(2,1)+s-1));
colorbar;
caxis([0 8]);
title('orientation of gradient');
grid on;
axis([1 16 1 16],'square');
set(gca,'XTick',[1:4:16], 'XColor', 'w');
set(gca,'YTick',[1:4:16], 'YColor', 'w');
%axis off;
subplot(2,3,6);
plot(sift);
title('SIFT descriptor');
axis on;
v=max(sift);
if(v==0)
    v=0.5;
end
axis([1 128 0 v]);
set(gca,'XTick',[1:8:129],'FontSize',8);

    function J = drawRectsImage2(I,r,s,ind)
        
        J = zeros(size(I,1),size(I,2),3);
        for i=1:3
            J(:,:,i) = I(:,:);
        end
        
        val = max(max(I));
        
        i = ind;
        J(r(1,i),r(2,i):r(2,i)+s-1,1) = val;
        J(r(1,i),r(2,i):r(2,i)+s-1,2) = 0;
        J(r(1,i),r(2,i):r(2,i)+s-1,3) = 0;
        
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,1) = val;
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,2) = 0;
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,3) = 0;
        
        J(r(1,i):r(1,i)+s-1,r(2,i),1) = val;
        J(r(1,i):r(1,i)+s-1,r(2,i),2) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i),3) = 0;
        
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,1) = val;
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,2) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,3) = 0;
        
        if(val==1)
            
        else
            J=uint8(J);
        end
    end



    function [ Iori] = orientationsColor( )
        
        n=100;
        m=100;
        
        
        taille =8;
        ori = zeros(taille,2);
        for i=1:taille
            ori(i,1) =  cos(2*pi*(i-1)/taille);
            ori(i,2) =  sin(2*pi*(i-1)/taille);
        end
        
        
        Iori = zeros(n,m);
        
        cpt = zeros(taille,1);
        
        for i=1:n
            for j=1:m
                
                v = [ j - m/2 ; - i + n/2  ];
                
                prod = ori * v;
                
                [maxi,Imax] = max(prod);
                
                Iori(i,j)=Imax;
                
            end
        end
        
    end

end

