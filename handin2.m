fid = fopen('LifeOnMars.txt');
Txt = fscanf(fid,'%c');
fclose(fid);
cast(Txt,'uint8')

%construction of structure to save information regarding how many times
%every symbol appears
occurance = zeros(2, 29);
for i=97:122
    occurance(1,i-96) = i;
end
% '
occurance(1,27) = 39;
% space
occurance(1,28) = 32;
% newline
occurance(1,29) = 10;

%increment every symbol found and save to structure
for j=1:1251
    a = Txt(1,j);
    for r=1:29
        if(cast(a, 'uint8') == occurance(1,r))
            occurance(2,r) = occurance(2,r) + 1;
        end
    end
end

%construction of structure to save how many bits every symbol needs for bit
%coding
bitcode = zeros(2,29);
for i=1:29
    bitcode(1,i) = occurance(2,i);
end
%nbr of symbols for bit coding
bitcode(2,1) = 4;
bitcode(2,2) = 6;
bitcode(2,3) = 6;
bitcode(2,4) = 6;
bitcode(2,5) = 3;
bitcode(2,6) = 6;
bitcode(2,7) = 6;
bitcode(2,8) = 4;
bitcode(2,9) = 4;
bitcode(2,11) = 6;
bitcode(2,12) = 5;
bitcode(2,13) = 5;
bitcode(2,14) = 4;
bitcode(2,15) = 4;
bitcode(2,16) = 8;
bitcode(2,18) = 4;
bitcode(2,19) = 4;
bitcode(2,20) = 4;
bitcode(2,21) = 6;
bitcode(2,22) = 7;
bitcode(2,23) = 6;
bitcode(2,25) = 7;
bitcode(2,26) = 8;
bitcode(2,27) = 7;
bitcode(2,28) = 5;
bitcode(2,29) = 3;
total = 0;
%total bit code
for a=1:29
    temp = bitcode(1,a)*bitcode(2,a);
    total = total + temp;
end
%average bit code
average = total/1251;
%entropy calculation
input = occurance(2,:) * 1/1251;
[row,column] = size(input);
sum=0;
for i=1:column
    if (input(1,i)==0)
    else
         sum = sum - input(1,i)*log2(input(1,i));
    end
end

%The total number of ones that are sent
bitOnes = transpose([3,2,3,4,0,3,4,2,2,0,3,2,3,1,3,3,0,1,1,2,5,3,4,0,3,2,4,3,3]);
nbrOfOnes = occurance(2,:) * bitOnes;

% ones to zeros ratio
onesration = nbrOfOnes/total;

%compression ration
compression = (1251*8)/total;