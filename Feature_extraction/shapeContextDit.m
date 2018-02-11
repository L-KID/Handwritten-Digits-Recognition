function B = im_shapeContext(A)
Bin1=3;
Bin2=6;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%A=im_thin(A);


[I,J]=find(A==1);


distance=(repmat(I,1,length(I))-repmat(I',length(I),1)).^2+(repmat(J,1,length(J))-repmat(J',length(J),1)).^2;
distance=log((distance).^0.5);
maxd=max(max(distance));
distance=distance/maxd;
theta=atan((repmat(J,1,length(J))-repmat(J',length(J),1))./(repmat(I,1,length(I))-repmat(I',length(I),1)));
theta=theta+pi/2;
shape_context_sum=zeros(Bin1,Bin2);

for i=1:length(I)
    for j=i+1:length(I)
        
        x=ceil(distance(i,j)*Bin1);
        if x==0
            x=1;
        end
        
        y=ceil((theta(i,j)+0.001)/pi*Bin2);
 
        shape_context_sum(x,y)=shape_context_sum(x,y)+1;
        
    end

end


shape_context_sum=shape_context_sum/sum(sum(shape_context_sum));
B=reshape(shape_context_sum,Bin1*Bin2,1);
end