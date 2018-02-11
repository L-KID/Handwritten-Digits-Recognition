function [B ] =im_thin( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
B= bwmorph(A,'thin',Inf);
B = bwmorph(B,'spur' ,2);

%B=im2bw(B);
end

