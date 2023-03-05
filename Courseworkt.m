
%% read image origin, StackNinja1.bmp image
img = imread("StackNinja1.bmp");

% Extract the individual red, green, and blue color channels.
redChannel = img(:, :, 1); % Red Channel
greenChannel = img(:, :, 2); % Green Channel
blueChannel = img(:, :, 3); % Blue Channel

% Greeness
GreenPic = (greenChannel -(redChannel+blueChannel)/2);
figure(1);
subplot(2,1,1);
imshow(img);
title('original', 'FontSize', 10);
subplot(2,1,2);
imshow(GreenPic);
title('greenness', 'FontSize', 10);
