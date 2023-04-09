% change the StackNinja1.bmp to StackNinja2.bmp and StackNinja3.bmp


% Read the original image
original_image = imread("StackNinja1.bmp");  
    
% Brighten the image to enhance contrast
brigthen_image = imlocalbrighten(original_image,1);
    
% Convert the image from RGB to HSV color space
hsv = rgb2hsv(brigthen_image);
    
% Extract the hue channel of the HSV image
hue_channel = hsv(:,:,1);
    
% Set the green range of the Hue channel from 0.17 to 0.5
green_hue_range = hue_channel >= 0.17 & hue_channel <= 0.5;
    
% Repeat the mask to match the size of the hsv image
green_mask = repmat(green_hue_range,[1,1,3]);

% Increase the intensity of non-green pixels in the image
hsv(~green_mask) = hsv(~green_mask) * 1.5;  
       
% Apply the green mask to the original image with all none green mask set to 0
masked_image = bsxfun(@times, hsv, cast(green_mask, 'like', hsv));

% Convert the masked image to grayscale
gray_image = rgb2gray(masked_image);

% Apply median filtering to remove noise
filtered_image = medfilt2(gray_image, [3,3]);
    
% Apply adaptive threshold to the grayscale image
thresholded_image = adaptthresh(filtered_image, 0.5);
    
% Binarize the image using the threshold image and the filtered image
binary_image = imbinarize(filtered_image, thresholded_image);  
          
% Perform distance transform on the binary image
distance_transform = bwdist(~binary_image);
distance_transform = -distance_transform;
   
% Apply the watershed algorithm to segment objects
water_shed = watershed(distance_transform);
water_shed(~binary_image) = 0;
water_shedr = label2rgb(water_shed);

% Convert the water_shed image to grayscale
gray_scale = rgb2gray(water_shedr);

% Define a mask for the white background
white_mask = gray_scale > 250;

% Set pixels within the white mask to 0 and pixels outside to 255
gray_scale(white_mask) = 0;
gray_scale(~white_mask) = 255;
    
% Binarize the image again 
binary_imgwtr = imbinarize(gray_scale);
    
% Apply morphological opening to remove small objects
se = strel('disk',1);
open_image = imopen(binary_imgwtr,se);
    
% Label the connected components in the image
connected_components = bwconncomp(open_image);

% Count the number of objects in the image
num_objects = connected_components.NumObjects;
        
% Generate a random color map for the objects
color_map = rand(num_objects, 3);
    
% Define the background color 
background_color = [0, 0, 0];

% Colorize each object in the image using the color map
rgb_img = label2rgb(labelmatrix(connected_components), color_map, background_color);
   
% Display the resulting image
figure;
imshow(rgb_img);title("Final image");
  