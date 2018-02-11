function  B  = Features( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%  B1=celledPro(A,3);
%  B1=mapminmax(B1);
%  B2=zoning_dens(A,15,0);
% %B2=mapminmax(B2);
% B3=lengthDit(A);
% B3=mapminmax(B3);
% B4=aveDis(A);
% B4=mapminmax(B4);
% B5=hogDit(A);
% B5=fea_minmax(B5);
% B6=transitions(A);
% B6=fea_minmax(B6);
% B7=chainCode(A);
% B7=fea_minmax(B7);
% B8=offset_distance(A);
% %B8=fea_minmax(B8);
% B9=VcelledPro(A,3);
% B9=mapminmax(B9);
% B10=celledHisto(A,5,1);
% B10=fea_minmax(B10);
%  
% B11=VcelledHisto(A,5,1);
% B11=fea_minmax(B11);
% B12=rightHisto(A);
% B12=fea_minmax(B12);
% B13=leftHisto(A);
% B13=fea_minmax(B13);
% B16=hole_area(A);
% B16=fea_minmax(B16);
% B17=im_shapeContext(A);
% B17=fea_minmax(B17);

%B=[B1',B2',B3,B4,B5',B6',B7',B8',B9',B10',B11',B12',B16',B17'];
%B=[B2',B8',B10',B11',B14',B15',B17'];
%B=[B2',B5',B6',B8',B10',B11',B12',B13',B16',B17'];
%B=[B2',B5',B6',B8',B10',B11',B16',B17'];


B1=celledHist(A,5,1);
%B1=mapminmax(B1);

B2=zoningDens(A,5,1);
%B2=mapminmax(B2);

B3=hogDit(A);
%B3=fea_minmax(B3);

B4=transitions(A);
%B4=fea_minmax(B4);

B5=chainCode(A);
%B5=fea_minmax(B5);

B6=offsetDistance(A);
%B6=fea_minmax(B6);

B7=holeHist(A);
%B7=fea_minmax(B7);

B8=shapeContextDit(A);
%B8=fea_minmax(B8);

B9=lengthDit(A);

B=[B1',B2',B3',B4',B5',B6',B7',B8',B9'];

end




function Y=fea_minmax(X)
Min=min(X);
Max=max(X);
diff=Max-Min;
if diff ~=0
Y=(2*X-diff)./diff;
else
    Y=X;
end
end
