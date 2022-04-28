function [img_final,result_list,number_list,img_reshaped_list] = segmentation(img_area_new)

img_licence_gray = preprocess(img_area_new);
img_licence_binary = imbinarize(img_licence_gray);
[h,w] = size(img_licence_binary);
projection = sum(img_licence_binary, 1)/h;
sum_all = sum(projection);
if(sum_all/w>0.5)
    img_licence_binary = ones(h,w)-img_licence_binary;
    projection = ones(1,w)-projection;
end

target_area = find(projection>0.11);

index = target_area(1);
index_list = [];
index_list(end+1) = index;
while(index<=w)
    next = index +1;
    if (ismember(next,target_area)==1)
        index = index + 1;
    else
        index_list(end+1)= index;
        index = target_area(find(target_area>index,1));
        index_size = size(index);
        if(index_size(2)~=0)
            index_list(end+1)= index;
        end
    end
end


hold off

num = length(index_list)/2;

img_licence_binary = ones(h,w)-img_licence_binary;
img_final = [];

% img_ref0 = imread(['images\附加题\0.bmp']);
% img_ref1 = imread(['images\附加题\1.bmp']);
% img_ref2 = imread(['images\附加题\2.bmp']);
% img_ref3 = imread(['images\附加题\3.bmp']);
% img_ref4 = imread(['images\附加题\4.bmp']);
% img_ref5 = imread(['images\附加题\5.bmp']);
% img_ref6 = imread(['images\附加题\6.bmp']);
% img_ref7 = imread(['images\附加题\7.bmp']);
% img_ref8 = imread(['images\附加题\8.bmp']);
% img_ref9 = imread(['images\附加题\9.bmp']);

number_list = [];


result_list = zeros(1,num);
img_reshaped_list = [];
for i = 1:num

left = index_list(2*i-1);
right = index_list(2*i);
img_sub = img_licence_binary(:,left:right,:);

img_final = [img_final,img_sub,ones(h,30)];

end
img_reshaped_list = img_reshaped_list*255;

end
