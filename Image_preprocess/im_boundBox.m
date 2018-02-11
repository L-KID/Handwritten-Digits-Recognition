function B = im_boundBox(A)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
A1 = sum(A);
A2 = sum(A,2);

B=A( [find(A2>0,1):find(A2>0,1,'last')],[find(A1>0,1):find(A1>0,1,'last')]);


end

