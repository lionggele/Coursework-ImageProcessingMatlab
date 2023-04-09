% Load the image
img = imread('StackNinja2.bmp');

brigthenimg = imlocalbrighten(img);
imshow(brigthenimg);

% Convert to HSV
hsv = rgb2hsv(brigthenimg);

% Get the Hue channel of the HSV space
hue_channel = hsv(:,:,1);

% Set the green range of the Hue channel
green_hue_range = hue_channel >= 0.2 & hue_channel <= 0.4;

% Repeat the mask to match the size of the original image
green_mask = repmat(green_hue_range,[1,1,3]);

hsv(~green_mask)= 0;

rgb = rgb2hsv(hsv);

gray_channel = rgb2gray(rgb);
    
% Binarize the grayscale image using the Otsu's method
binary_channel = imbinarize(gray_channel);

figure
imshow(binary_channel);


