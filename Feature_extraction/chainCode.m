function V = chainCode(G)
% V contains 4 chain code histogram of input image G
v = sum(G);
h = sum(G, 2);
%B = imrotate(G, 45);
%l = sum(B);
%r = sum(B, 2);

[m,~] = size(G);
V_L = zeros(2*m-1,1);
V_R = zeros(2*m-1,1);
for i = 1:m
    for j = 1:m
        if G(i,j)==1
            V_L(i+j-1, 1) =  V_L(i+j-1, 1) + 1;
            V_R(j-i+m,1) = V_R(j-i+m,1) + 1;
        end
    end  
end



V = [v'; h;V_L;V_R];

end