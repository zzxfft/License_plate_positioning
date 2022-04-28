% ÇãÐ±Ð£Õý
function img_correction = correction(img_area)
I2 = rgb2gray(img_area);
I3 = edge(I2,'Sobel','horizontal');
%ÐÂ½¨ÅòÕÍÍ¼Ïñ¾ØÕó
se = [1 1 1;1 1 1;1 1 1];
%ÅòÕÍÍ¼Ïñ
I4 = imdilate(I3,se);
%Hough ±ä»»
[H,T,R] = hough(I4,'Theta',-89:89);
ccc = max(H);
[value, rot_theta] = max(ccc);

if rot_theta > 90
    rot_theta = rot_theta - 180;
end
img_correction = imrotate(img_area , rot_theta,'bilinear', 'loose');
end

