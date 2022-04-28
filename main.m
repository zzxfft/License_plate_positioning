clc;clear;close all;
%读取图片
img1 = imread('images\01.jpg');
img2 = imread('images\02.jpg');
img3 = imread('images\03.jpg');
img4 = imread('images\04.jpg');
img5 = imread('images\05.jpg');
img6 = imread('images\06.jpg');
img7 = imread('images\07.jpg');
img8 = imread('images\08.jpg');
img9 = imread('images\09.jpg');
img10 = imread('images\10.jpg');
img11 = imread('images\11.jpg');
img12 = imread('images\12.jpg');
img13 = imread('images\13.jpg');
img14 = imread('images\14.jpg');
img15 = imread('images\15.jpg');
img16 = imread('images\16.jpg');

% 蓝色背景1，黄色背景2，其他3
color_list = [2,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1];

for img_num =1:16
%循环内图片与文件命名
eval(['img=img',num2str(img_num),';']);
color = color_list(img_num);

%展示原图
figure(1);
subplot(4,4,img_num);imshow(img);

%预处理：先中值滤波再转换灰度
img_gray = preprocess(img);

%边缘检测:多次实验后选择Prewitt算子，垂直方向的检测
[img_edge] = edge_detect(img_gray);

%形态学操作
[img_morphology] = morphology(img_edge,1000);

%判断是否要在一开始对图像进行直方图均衡化
img_morphology = judge(img_morphology,img);

%区域选择
img_area = area_select(img_morphology,img,color);

%倾斜校正
img_correction = correction(img_area);

%精确选择
img_area_new = accurate_select(img_correction,color);
figure(2);
subplot(4,4,img_num);imshow(img_area_new);
end
