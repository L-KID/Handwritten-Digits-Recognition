%segment individual digits from a paper of handwritten digits


    
rawImg = imread('hand.jpg');
%show(rawImg);
%rawImg = rgb2gray(rawImg);
rawImg = imresize(rawImg,0.5);
wbImg = imbinarize(rawImg);
wbImg = double(wbImg);
wbImg(wbImg == 0) = 0.5;
wbImg(wbImg == 1) = 0;
wbImg(wbImg == 0.5) = 1;
show(wbImg);

%[row, col] = find(wbImg == 1);
row_sum = sum(wbImg,2);
%col_sum = sum(wbImg,1);
row_len = length(row_sum);
row_bound = zeros(row_len,1);
for i=1:row_len-1
    if((row_sum(i) == 0 && row_sum(i+1) ~= 0) ||(row_sum(i) ~= 0 && row_sum(i+1) == 0) )
        row_bound(i) = i;
    end
        
end
row_bound(row_bound == 0) = [];
row_num = length(row_bound);
%show(wbImg(row_bound(1):row_bound(2),:));
cut_by_row = cell(1,row_num/2);
cell_count = 1;
for k = 1:2:row_num-1
    cut_by_row{1,cell_count} = wbImg(row_bound(k):row_bound(k+1),:); 
    cell_count = cell_count + 1;
end
uniLen = size(wbImg,2);
col_num = 0;
bound_cell = cell(1,row_num/2);
for n = 1: row_num/2
    mat = cut_by_row{1,n};
    col_mat = sum(mat,1);
    col_bound = zeros(uniLen,1);
    for i=1:uniLen-1
        if((col_mat(i) == 0 && col_mat(i+1) ~= 0) ||(col_mat(i) ~= 0 && col_mat(i+1) == 0) )
            col_bound(i) = i;
        end
    end
    col_bound(col_bound == 0) = [];
    bound_cell{1,n} = col_bound;
    temp = length(col_bound);
    col_num = col_num + temp;
        
end
    
outputDigits = cell(1,col_num/2);
count = 1;
for i = 1: row_num/2
    mat = cut_by_row{1,i};
    col_bound = bound_cell{1,i};
    col_num = length(col_bound);
    for j = 1:2:col_num-1
        outputDigits{1,count} = mat(:,col_bound(j):col_bound(j+1));
        count = count + 1;
    end

end

%in case some position does not have a number,for example
%1  [] 3
%[] 2  6
%7  9  0
%outputDigits{1,9} = [];
cell_num = size(outputDigits,2);
for i = 1 : cell_num
    if(isempty(find(outputDigits{1,i} == 1)))
        outputDigits{1,i} = [];
    end
end
outputDigits = outputDigits(~cellfun('isempty',outputDigits));
%show(outputDigits{1,16});

live_label = [3 1 4 1 5 9 2 6 5 3 ...
    5 8 9 7 9 3 2 3 8 4 ...
    6 2 6 4 3 3 8 3 2 7 ...
    9 5 0 2 8 8 4 1 9 7 ...
    4 9 4 4 5 9 2 3 0 7 ...
    8 1 6 4 0 6 2 8 6 8 ...
    2 8 9 9 8 6 2 8 ...
    0 3 4 8 2 5 3 4 ...
    1 4 7 0 8 9 2 8 0 0 9 5 ...
    5 5 3 3 2 2 1 9 9 4 4 7 ...
    7 8 8 2 6 9 3 0 0 8 4 7];
for k = 1: cell_num
    outputDigits{1, k} = im_boundBox(outputDigits{1, k});
    outputDigits{1, k} = im_resize(outputDigits{1, k});
end

for k = 1 : cell_num
    outputDigits{1, k} = im_thin(outputDigits{1, k});
  
end
show(outputDigits{1, 26})
temp  = Features(outputDigits{1, 1});
newInput = zeros(cell_num, length(temp));
for k = 1 : cell_num
    
    newInput(k,:) = Features(outputDigits{1, k});    
end


A = prdataset(newInput,live_label');

%%  Train the classifier
samples=randperm(1000,1000);
Datafile = prnist([0:9],samples);
trs=file2dataset(Datafile);

labell=str2num(trs.labels(:,7));
trs=prdataset(trs.data,labell);

n_m=scalem([],'variance');


classifier=n_m*p_m*svc; 

%% Test and plot the false result
t=A*(trs*classifier);
y = t*labeld;
Correct_rate = 1-t*testc

False_samples = find(y ~= live_label');
y(False_samples)
%show(outputDigits{1, 26})
% for i=1:size(False_samples,1)
%     subplot(1,8,i)
%     
%     imshow( outputDigits{1,False_samples(i)});
%     
% end

