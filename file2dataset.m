function b = file2dataset(a)

Datafile=a;
Datafile_pre = Datafile*filtm('im_boundBox');
Datafile_pre = Datafile*filtm('im_resize');
%Datafile_pre = Datafile_pre*filtm('im_denoise');
Datafile_pre = Datafile_pre*filtm('im_thin');
Datafile_pre = Datafile_pre*filtm('Features');
Dataset=prdataset(Datafile_pre);
b=Dataset;

end

