% 形态学操作
function [img_morphology] = morphology(img_edge,remove_threshold)

%创建一个大小为[1,25]的矩形结构元素
se1=strel('rectangle',[1,25]);

%对图像执行形态学闭运算-填补空洞
bw_close=imclose(img_edge,se1); 
% 从二值图像中删除小对象少于remove_threshold（1000）个像素的所有连通分量（对象）
bw_remvoe = bwareaopen(bw_close,remove_threshold);  
%对图像执行形态学开运算消除突刺
bw_open=imopen(bw_remvoe,se1);

%创建一个大小为[10,5]的矩形结构元素
se3 = strel('rectangle',[10,5]);
%膨胀
img_morphology = imdilate(bw_open,se3);
end

