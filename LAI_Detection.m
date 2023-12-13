path = '/home/thomas/Documents/school/semester_3/5_Digital_Image_Processing/lab/LAI_detection';
path = strcat(path, '/bag_parser/bag_files/HC_20231130_143920.bag');

addpath(genpath("./bag_parser/"));
[im, depth] = bag_parser(path);
subplot(2, 2, 1); imshow(im); title('RGB');

[a, b] = brown_detect(im, 4);
subplot(2, 2, 3); imshow(a); title('Mask A');
subplot(2, 2, 4); imshow(b); title('Mask B');

mask = logical(mod(a,2)); mask_rgb = mask;
for i = 1:3 mask_rgb(:,:,i) = mask; end
im(mask_rgb) = 0;
subplot(2, 2, 2); imshow(im); title('Output');