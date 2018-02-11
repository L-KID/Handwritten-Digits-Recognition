%transitions (vertical and horizontal) ? for each column
%(row) colour changes from black to white were
%counted (i.e. how many times a black pixel precedes
%a white one)

function trans_f = transitions(a)
len = size(a,1);
trans_f = zeros(2 * len, 1);
len_num = 1;
for i= 1: len
    count = 0;
    row = a(i, :);
    for j=1:len-1
        if(row(j) ~= row(j+1))
            count = count + 1;
        end
    end
    trans_f(len_num) = count;
    len_num = len_num + 1;
end

for i= 1:len
    count = 0;
    col = a(:, i);
    for j=1:len-1
        if(col(j) ~= col(j+1))
            count = count + 1;
        end
    end
    trans_f(len_num) = count;
    len_num = len_num + 1;
end

end