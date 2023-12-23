% Get file path
path = '/home/thomas/Documents/school/semester_3/5_Digital_Image_Processing/lab/LAI_detection';
path = strcat(path, '/bag_parser/bag_files/HC_20231130_143920.bag');
% LC_20231130_152650
% MC_20231130_150501
% HC_20231130_143920


%% Setup reseach
% Load image and depth
addpath(genpath("./bag_parser/"));
[im, depth] = bag_parser(path);
subplot(2, 1, 1); imshow(depth); title('depth');

% All values > 1 are mismeasures
mismeasure = depth > 1;
% Reduce the mismeasure values
depth(mismeasure) = 0;

% Convert depth range to rgb value
minimum = min(min(depth)); maximum = max(max(depth));
[rgb_im] = depth_to_rgb(depth, minimum, maximum);
subplot(2, 1, 2); imshow(rgb_im); title('RGB');