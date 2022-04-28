clc;clear;close all;
img3 = imread('images\01.jpg');
for i =1:3
   img_med(:,:,i)=medfilt2(img3(:,:,i),[3,3]);
end
img_gray = rgb2gray(img_med);
sobel_vertical = edge(img_gray,'sobel','vertical'); 
Prewitt_vertical = edge(img_gray,'Prewitt',0.1,'vertical'); 
Roberts_vertical = edge(img_gray,'Roberts','vertical'); 
log_vertical = edge(img_gray,'log','vertical'); 
Canny_vertical = edge(img_gray,'Canny'); 

subplot(2,3,1);imshow(sobel_vertical);title('sobel_vertica');
subplot(2,3,2);imshow(Prewitt_vertical);title('Prewitt_vertical');
subplot(2,3,3);imshow(Roberts_vertical);title('Roberts_vertical');
subplot(2,3,4);imshow(log_vertical);title('log_vertical');
subplot(2,3,5);imshow(Canny_vertical);title('Canny_vertical');
