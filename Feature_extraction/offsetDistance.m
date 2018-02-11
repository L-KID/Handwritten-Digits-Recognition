%offsets (from left, right, top and bottom) ? for each
%row the distance between image?s border and the first
%black pixel in that row (counting from left, right, top
%or bottom respectively) was computed.

function offsets_f = offset_distance(a)
len = size(a,1);
offsets_f = zeros(5 * len, 1);
len_count = 1;
for i=1:len
    index = find(a(i, :) == 1, 1);
    if (isempty(index))
        index = 0;
    end
    right = len - index;
    offsets_f(len_count) = i;
    offsets_f(len_count+1) = index;
    offsets_f(len_count+2) = right;
    
    invert = fliplr(a(i, :));
    index_invert = find(invert == 1, 1);
    if (isempty(index_invert))
        index_invert = 0;
    end
    left = len - index_invert;
    offsets_f(len_count+3) = left;
    offsets_f(len_count+4) = index_invert;
    len_count = len_count + 5;
end

end