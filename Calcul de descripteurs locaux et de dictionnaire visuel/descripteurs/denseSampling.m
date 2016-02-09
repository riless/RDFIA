function [ r ] = denseSampling( I, s, delta )


[w,h] = size(I);
nx = (w-s+1)/delta;
ny = (h-s+1)/delta;

r = zeros(2,ceil(nx)*ceil(ny));

cpt =1;
for i=1:delta:w
    depx=i;
    bstopx=0;
    if(i+s-1>w)
        depx = w-s+1;
        bstopx=1;
    end
    
    for j=1:delta:h
        depy=j;
        bstopy=0;
        if(j+s-1>h)
            depy = h-s+1;
            bstopy=1;
        end
        r(:,cpt) = [depx; depy];
        
        cpt = cpt +1;
        
        if(bstopy==1)
            break;
        end
    end
    if(bstopx==1)
        break;
    end
end



end