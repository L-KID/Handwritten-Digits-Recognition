function V = celledHist(G, k,flag)
[m, n] = size(G);

if flag==0
    V=[];
for i=1:k
    
    
    P=sum(G(:,1+(i-1)*m/k:(i-1)*m/k+m/k),2);
   V=[V;P];
    
    
end



for i=1:k
    
    
    P=sum(G(1+(i-1)*m/k:(i-1)*m/k+m/k,:),1);
   V=[V;P'];
    
end
else
    
      V=[];
for i=1:(2*k-1)
    
    
    P=sum(G(:,1+(i-1)*m/k/2:(i-1)*m/k/2+m/k),2);
   V=[V;P];
    
    
end

for i=1:(2*k-1)
    
    
    P=sum(G(1+(i-1)*m/k/2:(i-1)*m/k/2+m/k,:),1);
   V=[V;P'];
    
    
end  
end




