%zoning feature extraction
%a: the input image(grayscale) matrix
%n: the zoning size nxn


function density = zoning_dens(a, n,flag)

rows = size(a,1) / n;

if flag==1  %% individual blocks
density=[];
for i=1:2*n-1
    
    for j=1:2*n-1
        
        dense=sum(sum(a(  1+(i-1)*rows/2:(i-1)*rows/2+rows , 1+(j-1)*rows/2:(j-1)*rows/2+rows   ) ));
        
        density=[density;dense];
    end
end
    
    
    
else  %% overlapping blocks
    
    
    density=[];
for i=1:n
    
    for j=1:n
        
        dense=sum(sum(a(  1+(i-1)*rows:(i-1)*rows+rows , 1+(j-1)*rows:(j-1)*rows+rows   ) ));
        
        density=[density;dense];
    end
end

    
    
    
end
end