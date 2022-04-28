%预处理函数 
%对三个通道分别进行中值滤波，转换为灰度图像
%于输入图像三个通道分别进行中值滤波，避免图像中的突刺噪声
%再进行灰度化。如果先进行灰度化再进行中值滤波，噪声可能会因灰度化时平均操作被保留
function img_gray = preprocess(img)
%建立循环依次中值滤波
for i =1:3
    %(:,:,i)第一个第二个分量全取，第三个依次取，RGB分开处理
    % medfilt2二维中位数滤波，3×3
   img_med(:,:,i)=medfilt2(img(:,:,i),[3,3]);
end
img_gray = rgb2gray(img_med);
end

