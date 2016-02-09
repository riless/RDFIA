function drawRectsImage(I,r,s)

J = zeros(size(I,1),size(I,2),3);
for i=1:3
    J(:,:,i) = I(:,:);
end

val = max(max(I));

for i=1:size(r,2)
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


if(val==1)
    figure();
    imagesc(J);  
else
    figure();
    imagesc(uint8(J));
end

end

