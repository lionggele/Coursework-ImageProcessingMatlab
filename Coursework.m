% read image origin, StackNinja1.bmp image
img = imread("StackNinja1.bmp");


% % convert RGB to HSV 
% hsvimg = rgb2hsv(img);
% 
% % Extract out the Hue of the image 
% hImage = hsvimg(:,:,1);
% 
% % bBinarizing 
% binaryImg = imbinarize(hImage);

level = multithresh(I);
seg_I = imquantize(I,level);
figure
imshow(seg_I,[])
figure;
imshow(BWs);

