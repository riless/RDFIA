function J = drawPatches(I,r,s,sifts)

J = zeros(size(I,1),size(I,2),3);
for i=1:3
    J(:,:,i) = I(:,:);
end

val = max(max(I));

for i=1:size(r,2)
    if(norm(sifts(:,i))==0)
        J(r(1,i),r(2,i):r(2,i)+s-1,1) = 0;
        J(r(1,i),r(2,i):r(2,i)+s-1,2) = 0;
        J(r(1,i),r(2,i):r(2,i)+s-1,3) = val;
        
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,1) = 0;
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,2) = 0;
        J(r(1,i)+s-1,r(2,i):r(2,i)+s-1,3) = val;
        
        J(r(1,i):r(1,i)+s-1,r(2,i),1) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i),2) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i),3) = val;
        
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,1) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,2) = 0;
        J(r(1,i):r(1,i)+s-1,r(2,i)+s-1,3) = val;
    else
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
    end
    
end


if(val==1)
    figure();
    imagesc(J);  
else
    J = uint8(J);
    figure();
    imagesc(J);
end

end

