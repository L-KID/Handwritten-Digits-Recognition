%% Dissimilarity
clear all
warning('off','all');
EER = 0;
for ii=1:5
N=800;
samples=randperm(N);
%% load the dataset
Datafile = prnist([0:9],samples);
%figure(1)
%show(A)
Datafile_pre = Datafile*filtm('im_boundBox');
Datafile_pre = Datafile*filtm('im_resize');
Datafile_pre = Datafile_pre*filtm('im_thin');
Datafile_pre = Datafile_pre*filtm('Features');

%figure(2)
%show (Datafile_pre)

%% convert datafile to dataset
Dataset=prdataset(Datafile_pre);
%[w_dataset,f] = pcam(Dataset,300);
%Dataset=Dataset*w_dataset;
%[trs,tes,~,~] = gendat(Dataset,700*ones(1,10),10*rand);

% w = distm(trs); % compute a square Euclidean distance matrix

% compute performance for four classifiers
% d = Dataset*proxm(Dataset, 'm', 1); % L1
 % Euclidean distance
% w = d*pe_em;
% x = d*w;
% [trs, tes] = gendat(x, 350*ones(1,10),10*rand);
% w = trs*pe_knnc;
%w = trs*{pe_nmc, pe_knnc, pe_parzenc, pe_libsvc};
[trs, tes] = gendat(Dataset, 9*N/10*ones(1,10),10*rand);
trs_d= distm(trs,trs);
tes_d=distm(tes,trs);
%w = knndc(trs);
w = scalem([],'variance');
c = w* fisherc;
%w = fnnc(trs);
e = tes_d*(trs_d*c)*testc;

EER = EER + e;
end
EER/5


