%% training set
A=0;
for i=1:20
samples=randperm(1000,10);
Datafile = prnist([0:9],samples);


trs=file2dataset(Datafile);


%% train a classifier
n_m=scalem([],'variance');
%f_m = fisherm(trs,9);

%f_m = fisherm([],9);
% fisherm(trs,9)
classifier=n_m*svc;
%w=svc(proxm('r',6));   % p h e r


classifier=trs*classifier;

%% evalution

correct_rate=1-nist_eval('file2dataset',classifier,100);
A=A+correct_rate;
end
A=A/20
%% test2
