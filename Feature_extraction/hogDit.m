function B = hogDit( A)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%B4=extractLBPFeatures(A,'Upright',false,'NumNeighbors',24, 'CellSize',[15,15])';
%B5=extractLBPFeatures(A,'Upright',false,'NumNeighbors',8, 'CellSize',[6,6])';

B1=extractHOGFeatures(A,'CellSize',[6 6],'Blocksize',[3 3])';
B2=extractHOGFeatures(A,'CellSize',[10 10],'Blocksize',[5 5])';

B=[B1;B2];
end

