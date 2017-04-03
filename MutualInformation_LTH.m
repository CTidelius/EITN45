function I=MutualInformation_LTH(P)
% The mutual information I(X;Y)
%
% P=P(X,Y) is the joint probability of X and Y.

[r,c] = size(P);
rowvector = zeros(1,r);
columnvector = zeros(1,c);
for i=1:r
    rowsum = 0;
    for j=1:c
        rowsum = rowsum + P(i,j);
    end
    rowvector(1,i) = rowsum;
end
for i=1:c
      columnsum = 0;
    for j=1:r
        columnsum = columnsum + P(j,i);
    end
    columnvector(1,i) = columnsum;
end
hx=0;
for k=1:r
    hx = hx -(rowvector(1,k)*log2(rowvector(1,k)));
end
hy = 0;
for l=1:c
    hy = hy -(columnvector(1,l)*log2(columnvector(1,l)));
end
hxy=0;
for i=1:r
    for j=1:c
        if P(i,j) == 0
            
        else 
            
        hxy = hxy -(P(i,j)*log2(P(i,j)));
        end
    end
end
sum = hx + hy - hxy;
I=sum;