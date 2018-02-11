function B = lengthDit(A)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(A);
length=0;
for i=2:r-1
    for j=2:c-1
      if A(i,j)==1; %0 ground
        credict= A(i-1,j)+A(i+1,j)+A(i,j-1)+A(i,j+1);
        switch credict
            
            case 1
               length=length+3;
            case 2
                length=length+2;
            case 3
                length=length+1;
                
        end
      end
            
    end
end
B=length;
end

