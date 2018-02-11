function b_final = im_resize( a )
s=size(a);

b=zeros(max(s),max(s));


if max(s)==s(1)

b( :,floor((s(1)-s(2))/2)+1:floor((s(1)-s(2))/2)+s(2))=a;

else
    
b( floor((s(2)-s(1))/2)+1:floor((s(2)-s(1))/2)+s(1),: )=a;   
end

b_resize=imresize(b,[30,30]);

b_resize=im2bw(b_resize);

b_resize(1,:)=0;
b_resize(end,:)=0;
b_resize(:,1)=0;
b_resize(:,end)=0;

b_final=b_resize;



end

