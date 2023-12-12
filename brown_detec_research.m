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
subplot(2, 3, 1); imshow(im); title('RGB');

% I tried to use RGB values (Brown = R:150, G:75, B:0), but due to
% differences in light (lower layers have more shadows) the image had
% different RGB values for the brown parts that overlapped with the RGB
% values of the green (leaves).

% Using GIMP "Color Picking Tool" I stumbled upon the LCh-values which better
% depicted de differences between brown and green.
% Then we found that LAB values have an even better result.

% https://www.researchgate.net/figure/The-CIELAB-color-space-diagram-The-CIELAB-or-CIE-L-a-b-color-system-represents_fig1_338303610
im_13 = im; % The original RGB values where to high for LCh conversion
labpict = rgb2lab(im_13);
subplot(2, 3, 2); imshow(labpict); title('LAB / 13');

c = makecform('lab2lch');
lchpict = applycform(labpict,c);
subplot(2, 3, 3); imshow(lchpict); title('LCh / 13');

l = labpict(:,:,1); subplot(2, 3, 4); imshow(l); title('L');
a = labpict(:,:,2); subplot(2, 3, 5); imshow(a); title('A');
b = labpict(:,:,3); subplot(2, 3, 6); imshow(b); title('B');

%% Get masks
% These images show that high C-values are connected to brown values, while
% low L-values show shadows (black values).

max_a = max(max(a)); mean_a = mean(mean(a));
max_b = max(max(b)); mean_b = mean(mean(b));

mask = imbinarize(a);

subplot(2, 2, 1); imshow(im); title('RGB');
subplot(2, 2, 2); imshow(labpict); title('LAB');
%subplot(2, 2, 3); imshow(mask_a); title('A');
%subplot(2, 2, 4); imshow(mask_b); title('B');
subplot(2, 2, 3); imshow(mask); title('brown mask');

%% Filter brown
%mask = mask_c;
mask = logical(mod(mask,2));
mask_rgb = mask; mask_rgb(:,:,2) = mask; mask_rgb(:,:,3) = mask;
brown_filter = im;
brown_filter(mask_rgb) = 0;

subplot(2, 2, 4); imshow(brown_filter); title('filterd');