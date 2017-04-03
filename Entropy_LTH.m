function H=Entropy_LTH(P)
% The Entropy function H(X)
%
[r,c] = size(P);
vector = zeros(1, c);
for i=1:c
      % P row vector: Each position gives binary entropy function
      % P scalar: The binary entropy function of [P; 1-P]
    if r==1
        if P(1,i)==0 || P(1,i)==1
            vector(1,i)=0;
        else
        vector(1,i) = - P(1,i)*log2(P(1,i)) - ((1-P(1,i))*log2(1-P(1,i)));
        end
    else
        % P column vector: the vector is the probability distribution.
        % P matrix: Each column vector is interpreted as a probability distribution
       s=0;
        for j=1:r
           if P(j,i)==0
               
           else
            s = s - P(j,i)*log2(P(j,i));
           end
        end
        vector(1,i) = s;
    end
end

H = vector;