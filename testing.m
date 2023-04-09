% use greeness of rgb -> filter the noise ( remove ) -> thresholding (
% colour segmentation ( can see the individual nuclei ) -> change to HSV ->
% binary image -> ROI. ( work a base first )

% %% read image origin, StackNinja1.bmp image
% img = imread("StackNinja3.bmp");
% 
% 
% % Extract the individual red and green color channels.
% redChannel = img(:, :, 1); % Red Channel
% greenChannel = img(:, :, 2); % Green Channel
% blueChannel = img(:, :, 3); % Blue Channel
% 
% 
% % Greeness
% GreenPic = (greenChannel -(redChannel+blueChannel)/2);
% 
% binaryImg = imbinarize(greenChannel);
% 
% binaryImg1 = imbinarize(GreenPic);
% figure(1);
% imshowpair(binaryImg1,binaryImg,'montage');
% 
% green = binaryImg-binaryImg1;
% imshow(green);






% % Load an example image
% img = imread('StackNinja2.bmp');
% 
% % convert RGB to HSV 
% hsvimg = rgb2hsv(img);
% 
% % Extract out the Hue of the image 
% hImage = hsvimg(:,:,1);
% 
% greenRange = [0.2, 0.4];
% lowerBound = [greenRange(1), 0.2, 0.2];
% upperBound = [greenRange(2), 1,1];
% 
% % Threshold image to only keep pixels within green range
% greenMask = (hsvImg(:,:,1) >= lowerBound(1)) & (hsvImg(:,:,1) <= upperBound(1)) & ...
%             (hsvImg(:,:,2) >= lowerBound(2)) & (hsvImg(:,:,2) <= upperBound(2)) & ...
%             (hsvImg(:,:,3) >= lowerBound(3)) & (hsvImg(:,:,3) <= upperBound(3));
% 
% figure(1);
% imshowpair(hImage,greenMask,'montage');
% title('Hue Image', 'FontSize', 15);
% 






















% filter
% %filtered_img = medfilt2(img, [3, 3]);
% 
% 
% 
% %% convert RGB to HSV 
% %hsvimg = rgb2hsv(filtered_img);
% 
% % Extract out the Hue of the image 
% hImage = hsvimg(:,:,1);
% 
% % Apply median filter with 3x3 neighborhood
% % filtered_img = medfilt2(hImage, [3, 3]);
% 
% % filtered_img = imdiffusefilt(hImage,'NumberOfIterations',10);
% 
% 
% % Display the hue image.
% figure;
% imshowpair(hImage,filtered_img,'montage');
% title('Hue Image', 'FontSize', 15);









% 
% % Compute Otsu's threshold value
% threshold = graythresh(hImage);
% 
% % Convert grayscale image to binary using Otsu's threshold value
% binaryImg = imbinarize(hImage, threshold);


% Apply median filter with 3x3 neighborhood
% filtered_img = medfilt2(binaryImg, [3, 3]);

% 
% greenRange = [0.2, 0.4];
% lowerBound = [greenRange(1), 0.2, 0.2];
% upperBound = [greenRange(2), 1,1];
% 
% % Threshold image to only keep pixels within green range
% greenMask = (hsvImg(:,:,1) >= lowerBound(1)) & (hsvImg(:,:,1) <= upperBound(1)) & ...
%             (hsvImg(:,:,2) >= lowerBound(2)) & (hsvImg(:,:,2) <= upperBound(2)) & ...
%             (hsvImg(:,:,3) >= lowerBound(3)) & (hsvImg(:,:,3) <= upperBound(3));



%% Extract the individual red, green, and blue color channels.
% redChannel = img(:, :, 1); % Red Channel
% greenChannel = img(:, :, 2); % Green Channel
% blueChannel = img(:, :, 3); % Blue Channel
% 
% % Greeness
% GreenPic = (greenChannel -(redChannel+blueChannel)/2);
% figure(1);
% imshow(img);
% title('original', 'FontSize', 10);
% imshow(GreenPic);
% title('greenness', 'FontSize', 10);

%% Clear increase brigtheness of the picture 



% % Load the image
% img = imread('StackNinja3.bmp');
% 
% % Convert to HSV
% hsv = rgb2hsv(img);
% 
% % Increase the value channel to make the image brighter
% hsv(:,:,3) = hsv(:,:,3) * 1.5 % Change the factor (1.2) to adjust the brightness
% 
% 
% 
% % Convert back to RGB
% rgb = hsv2rgb(hsv);
% 
% figure(2);
% imshowpair(rgb,img,'montage');
% 
% 
% difference = double(img) - rgb;
% figure(1);
% imshow(difference);
% 
% hsv1 = rgb2hsv(rgb);
% 
% 
% thresholdedimg = hsv1 > 0.2;
% filtered_img = medfilt2(thresholdedimg, [3, 3]);
% binaryImg = imbinarize(double(filtered_img));
% imshow(binaryImg);


% % % Extract out the Hue of the image 
% hImage1 = hsv3(:,:,1);
% hImage2 = hsv2(:,:,1);

% % thresholding the nuclei 
% thresholdimg = 0.2;
% thresholdedimg = hsv > 0.2;
% filtered_img = medfilt2(thresholdedimg, [3, 3]);
% binaryImg = imbinarize(double(filtered_img));
% imshow(binaryImg);


% thresholding the nuclei 
% thresholdimg = 0.2;
% thresholdedimg = hImage > 0.2;
% 
% % % Apply median filter with 3x3 neighborhood
% filtered_img = medfilt2(thresholdedimg, [3, 3]);
% 
% 
% 
% % % bBinarizing 
% binaryImg = imbinarize(double(filtered_img));
% 
% figure(1)
% imshowpair(hImage, binaryImg,"montage");


%% ROI Interest

% % Load the image
% img = imread('StackNinja3.bmp');
% 
% % Convert to HSV
% hsv = rgb2hsv(img);
% 
% % Increase the value channel to make the image brighter
% hsv(:,:,3) = hsv(:,:,3) * 1.5; % Change the factor (1.2) to adjust the brightness
% 
% % Convert back to RGB
% rgb = hsv2rgb(hsv);
% 
% % Display the original and the modified images side by side
% figure;
% imshowpair(img, rgb, 'montage');
% title('Original (left) and modified (right) images');
% 
% % Threshold the image based on the greenness value
% green_threshold = 0.2;
% binary_img = rgb(:, :, 2) > green_threshold;
% 
% % Apply median filter to remove noise
% filtered_img = medfilt2(binary_img, [3, 3]);
% 
% % Label the connected components
% cc = bwconncomp(filtered_img);
% num_objects = cc.NumObjects;
% 
% % Create a color map for the objects
% color_map = rand(num_objects, 3);
% 
% % Color each object in the image
% rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
% 
% % Display the result
% imshow(rgb_img);



%% Automated readig file 

% % Set the folder path
% folder_path = 'C:\Users\liong\Coding\Intro to Image Processing\Coursework-IIP';
% 
% % Get a list of all the JPEG files in the folder
% file_list = dir(fullfile(folder_path, '*.bmp'));
% 
% % Loop over all the files and process each image
% for i = 1:numel(file_list)
% 
%     % Read the image
%     img = imread(fullfile(folder_path, file_list(i).name));
%     
%     % Load the image
%     img = imread('StackNinja3.bmp');
%     
%     % Convert to HSV
%     hsv = rgb2hsv(img);
%     
%     % Increase the value channel to make the image brighter
%     hsv(:,:,3) = hsv(:,:,3) * 1.5; % Change the factor (1.2) to adjust the brightness
%     
%     % Convert back to RGB
%     rgb = hsv2rgb(hsv);
%     
%     % Threshold the image based on the greenness value
%     green_threshold = 0.2;
%     binary_img = rgb(:, :, 2) > green_threshold;
%     
%     % Apply median filter to remove noise
%     filtered_img = medfilt2(binary_img, [3, 3]);
%     
%     % Label the connected components
%     cc = bwconncomp(filtered_img);
%     num_objects = cc.NumObjects;
%     
%     % Create a color map for the objects
%     color_map = rand(num_objects, 3);
%     
%     % Color each object in the image
%     rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
%     
%     
%     % Display the image
%     figure;
%     imshow(rgb_img);
%     title(file_list(i).name);
%     
% end

%% remove noise 
% Load the image
% img = imread('StackNinja3.bmp');
% 
% % Convert to HSV
% hsv = rgb2hsv(img);
% 
% % Increase the value channel to make the image brighter
% hsv(:,:,3) = hsv(:,:,3) * 1.5; % Change the factor (1.2) to adjust the brightness
% 
% % Convert back to RGB
% rgb = hsv2rgb(hsv);
% 
% % Display the original and the modified images side by side
% figure;
% imshowpair(img, rgb, 'montage');
% title('Original (left) and modified (right) images');

%% Sharpen
% Read in the image
% img = imread('StackNinja1.bmp');
% 
% % Apply unsharp masking to sharpen the image
% sharpened_img = imsharpen(img);
% 
% % Display the original and sharpened images side by side
% subplot(1,2,1);
% imshow(img);
% title('Original Image');
% subplot(1,2,2);
% imshow(sharpened_img);
% title('Sharpened Image');

%% Otsu Thresholding 

% clc;    % Clear the command window.
% close all;  % Close all figures (except those of imtool.)
% imtool close all;  % Close all imtool figures.
% clear;  % Erase all existing variables.
% workspace;  % Make sure the workspace panel is showing.
% fontSize = 20;
% 
% % Set the folder path
% folder_path = '..\Coursework-IIP';
% 
% % Get a list of all the BMP files in the folder
% file_list = dir(fullfile(folder_path, '*.bmp'));
% 
% % Loop over all the files and process each image
% for i = 1:numel(file_list)
% 
%     % Read the image
%     img = imread(fullfile(folder_path, file_list(i).name));
%     
%     % Convert to HSV
%     hsv = rgb2hsv(img);
%     
%     % Increase the value channel to make the image brighter
%     hsv(:,:,3) = hsv(:,:,3) * 2; % Change the factor (2) to adjust the brightness
%     
%     % Convert back to RGB
%     rgb = hsv2rgb(hsv);
%     
%     % Threshold the image based on the greenness value
%     green_threshold = 0.2;
%     binary_img = rgb(:, :, 2) > green_threshold;
%     
%     % Apply median filter to remove noise
%     filtered_img = medfilt2(binary_img, [3, 3]);
%     
%     % Define structuring element
%     se = strel('disk', 5); % Change the size (5) to adjust the opening operation
%     
%     % Apply opening operation
%     opened_img = imopen(filtered_img, se);
%     
%     % Label the connected components
%     cc = bwconncomp(opened_img);
%     num_objects = cc.NumObjects;
%     
%     % Create a color map for the objects
%     color_map = rand(num_objects, 3);
%     
%     % Color each object in the image
%     rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
%     
%     % Display the image
%     figure;
%     imshow(rgb_img);
%     title(file_list(i).name);
%     
% end

%% Automated readig file 
% 
% clc;    % Clear the command window.
% close all;  % Close all figures (except those of imtool.)
% imtool close all;  % Close all imtool figures.
% clear;  % Erase all existing variables.
% workspace;  % Make sure the workspace panel is showing.
% fontSize = 20;
% 
% % Set the folder path
% folder_path = '..\Coursework-IIP';
% 
% % Get a list of all the JPEG files in the folder
% file_list = dir(fullfile(folder_path, '*.bmp'));
% 
% % Loop over all the files and process each image
% for i = 1:numel(file_list)
% 
%     % Read the image
%     img = imread(fullfile(folder_path, file_list(i).name));
%     
%     % % Load the image
%     img = imread('StackNinja3.bmp');
%     
%     % Convert to HSV
%     hsv = rgb2hsv(img);
%     
%     % Increase the value channel to make the image brighter
%     hsv(:,:,3) = hsv(:,:,3) * 2; % Change the factor (1.2) to adjust the brightness
%     
%     % Convert back to RGB
%     rgb = hsv2rgb(hsv);
%     
%     % Threshold the image based on the greenness value
%     green_threshold = 0.2;
%     binary_img = rgb(:, :, 2) > green_threshold;
%     
%     % Apply median filter to remove noise
%     filtered_img = medfilt2(binary_img, [3, 3]);
%     
%     % Label the connected components
%     cc = bwconncomp(filtered_img);
%     num_objects = cc.NumObjects;
%     
%     % Create a color map for the objects
%     color_map = rand(num_objects, 3);
%     
%     % Color each object in the image
%     rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
%     
%     
%     % Display the image
%     figure;
%     imshow(binary_img);
%     title(file_list(i).name);
%     
% end




%% Segmentation

%% Automated readig file 
% 
% clc;    % Clear the command window.
% close all;  % Close all figures (except those of imtool.)
% imtool close all;  % Close all imtool figures.
% clear;  % Erase all existing variables.
% workspace;  % Make sure the workspace panel is showing.
% fontSize = 20;
% 
% % Set the folder path
% folder_path = '..\Coursework-IIP';
% 
% % Get a list of all the JPEG files in the folder
% file_list = dir(fullfile(folder_path, '*.bmp'));
% 
% % Loop over all the files and process each image
% for i = 1:numel(file_list)
% 
%     % Read the image
%     img = imread(fullfile(folder_path, file_list(i).name));
%     
%     % % Load the image
%     img = imread('StackNinja3.bmp');
% 
%     % local lap filter     
%     img1 = locallapfilt(img, 0.4, 0.5);
%     
%     % Convert to HSV
%     hsv = rgb2hsv(img1);
% 
%     % Get the Hue channel of the HSV space
%     hue_channel = hsv(:,:,1);
%     
%     % Set the green range of the Hue channel
%     green_hue_range = hue_channel >= 0.2 & hue_channel <= 0.4;
%     hue_channel(~green_hue_range) = 0;    
%    
%     
%     % Convert back to RGB
%     rgb = hsv2rgb(hue_channel);
%     
%     % Convert the green channel to a grayscale image
%     green_channel = rgb2gray(rgb(:, :, 2));
%     
%     % Binarize the image using the Otsu's method
%     binary_img = imbinarize(green_channel);
% 
%     
%     % Apply median filter to remove noise
%     filtered_img = medfilt2(binary_img, [3, 3]);
%     
%     % Label the connected components
%     cc = bwconncomp(filtered_img);
%     num_objects = cc.NumObjects;
%     
%     % Create a color map for the objects
%     color_map = rand(num_objects, 3);
%     
%     % Color each object in the image
%     rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
%     
%     
%     % Display the image
%     figure;
%     imshow(filtered_img); 
%     title(file_list(i).name);
%     
% end


% % Load the image
% img = imread('StackNinja2.bmp');
% 
% % Convert to HSV
% hsv = rgb2hsv(img);
% 
% % Get the Hue channel of the HSV space
% hue_channel = hsv(:,:,1);
% 
% % Set the green range of the Hue channel
% green_hue_range = hue_channel >= 0.2 & hue_channel <= 0.4;
% hue_channel(~green_hue_range) = 0;
% 
% % Create a binary mask for the green range
% green_mask = uint8(green_hue_range);
% 
% % Apply the green mask to the original image
% green_img =  repmat(green_hue_range, [1 1 3]);
% 
% % Increase the intensity by a factor of 1.5
% intensity = green_img * 1.5;
% % 
% % Convert the modified Hue channel to grayscale
% gray_channel = mat2gray(intensity);
%     
% % Binarize the grayscale image using the Otsu's method
% binary_channel = imbinarize(gray_channel, 'adaptive', 'Sensitivity', 0.5);
% 
% % Apply median filter to remove noise
% filtered_img = medfilt2(gray_channel, [3, 3]);
% 
%     
%     % Label the connected components
%     cc = bwconncomp(filtered_img);
%     num_objects = cc.NumObjects;
%     
%     % Create a color map for the objects
%     color_map = rand(num_objects, 3);
%     
%     % Color each object in the image
%     rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);    


% Display the binary image
% figure;
% imshow(intensity);
% title('Binary Image');


%% final

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;

% Set the folder path
folder_path = '..\Coursework-IIP';

% Get a list of all the BMP files in the folder
file_list = dir(fullfile(folder_path, '*.bmp'));

% Loop over all the files and process each image
for i = 1:numel(file_list)
    
    % Read the image
    img = imread(fullfile(folder_path, file_list(i).name));
    
    % Convert to HSV color space
    hsv = rgb2hsv(img);
    
    % Brighten the image locally
    hsv(:,:,3) = imlocalbrighten(hsv(:,:,3));
    
    % Create a mask for green pixels in the hue channel
    green_mask = hsv(:,:,1) >= 0.2 & hsv(:,:,1) <= 0.4;
    
    % Increase the saturation of non-green pixels in the image
    hsv(~green_mask) = min(hsv(~green_mask)*2, 1);
    
    % Convert back to RGB
    green_img = hsv2rgb(hsv);
    
    % Convert to grayscale
    gray_img = rgb2gray(green_img);
    
    % Apply median filter
    filtered_img = medfilt2(gray_img);
    
    % Adaptive thresholding
    thres_img = adaptthresh(filtered_img, 0.5);
    
    
    
    % Morphological opening
    open_img = imopen(binary_img1, strel('disk',2));
    
    % Label connected components
    cc = bwconncomp(open_img);
    num_objects = cc.NumObjects;
    
    % Create a color map for the objects
    color_map = rand(num_objects, 3);
    
    % Color each object in the image
    rgb_img = label2rgb(labelmatrix(cc), color_map, [0, 0, 0]);
    
    % Display the image
    figure;
    imshow(rgb_img); 
    title(file_list(i).name);
    
end
