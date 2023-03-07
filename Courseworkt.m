% Load an example image
rgbImage = imread('StackNinja1.bmp');

% Convert the image to CIE Lab color space
labImage = rgb2lab(rgbImage);

% Extract the a* and b* channels
aChannel = labImage(:, :, 2);
bChannel = labImage(:, :, 3);

% Display the original image and the green-highlighted image side by side
figure;
subplot(1,2,1); imshow(rgbImage); title('Original image');
subplot(1,2,2); imshow(Channel); title('Green pixels');
