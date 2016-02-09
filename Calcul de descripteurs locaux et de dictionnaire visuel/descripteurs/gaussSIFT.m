function [ Mg ] = gaussSIFT(  s )
sigma = 0.5 * s;
N2 = ceil(s/2);

Mg = zeros(s,s);
for i=1:s
    for j=1:s
        Mg(i,j) = 1/(2*pi*sigma*sigma) * exp (-( (i-N2) * (i-N2) + (j-N2) * (j-N2))/(2*sigma*sigma)  );
    end
end


end

