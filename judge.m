% 根据处理好的图像判断一开始是否需对原始图像直方图均衡化
function img_morphology = judge(img_morphology,img)
%度量形态学处理后每个 8 连通分量（对象）的属性集的测量值
stats = regionprops(img_morphology,'BoundingBox','Centroid');
%最大数组维度的长度
L = length(stats);
% 判断是否需要直方图均衡化
if L~=0
    return
else
%再预处理一下
img_gray = preprocess(img);
%使用直方图均衡增强对比度
img_gray = histeq(img_gray);
img_edge = edge_detect(img_gray);
[img_morphology] = morphology(img_edge,1000);
end

end
