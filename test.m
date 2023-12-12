path = '/home/thomas/Documents/school/semester_3/5_Digital_Image_Processing/lab/LAI_detection';
path = strcat(path, '/bag_files/MC_20231130_150501.bag');

im = brown_filter(path, 225, 125);
imshow(im);