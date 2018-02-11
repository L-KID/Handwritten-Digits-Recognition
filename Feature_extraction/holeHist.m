function B = holeHist(A)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
C=zeros(size(A));
C(1,:)=1;
C(end,:)=1;
C(:,1)=1;
C(:,end)=1;
for i=2:size(A,1)-1
    for j=2:size(A,2)-1
        
        if A(i,j)==0 && C(i+1,j)+C(i-1,j)+C(i,j+1)+C(i,j-1)>0
         C(i,j)=1;
        end
    end
       
    
end

B=[sum(A+C)';sum(A+C,2)];

end