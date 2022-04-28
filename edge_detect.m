% 边缘检测
%对灰度图像使用不同的梯度算子进行边缘检测，对比不同梯度算子的检测结果。
%由于图像中存在许多细节，Roberts、log和Canny算子容易检测出许多无关边缘，不利于后续的区域选择，
%因此我们选择Sobel算子和Prewitt算子，为了进一步减少被检测的边缘，我们特别选择了垂直方向的检测。
function [img_edge] = edge_detect(img_gray)
%检测方法：Prewitt导数，阈值0.1，垂直方向
img_edge = edge(img_gray,'Prewitt',0.1,'vertical'); 
end
