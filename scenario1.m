%% test1
samples=randperm(1000,1000);
Datafile = prnist([0:9],samples);
trs=file2dataset(Datafile);

n_m=scalem([],'variance');

%
p_m = pcam([],500);

%p_m=fisherm([],9)
classifier=n_m*p_m*fisherc;  

%% p-1: 
classifier=trs*classifier;

correct_rate=1-nist_eval('file2dataset',classifier,100)



%% test2
