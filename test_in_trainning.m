
warning('off','all');

clear all

%% load the dataset
samples=randperm(200);

Datafile = prnist([0:9],samples);
%figure(1)
%show(A)
Dataset=file2dataset(Datafile);



m=scalem([],'variance');

%m=scalem([],'variance')*pcam([],300);

classifier1=m*fisherc;%neurc
classifier2=m*knnc;%neurc
classifier3=m*rnnc;

classifier=[classifier1,classifier2,classifier3]*votec;


[ERR,CERR,NLAB_OUT] = prcrossval(Dataset,classifier,10,1);
1-ERR
