clc, clear, close all;

%curBag = rosbag('..\Medium_Coverage\MC_20231130_150501.bag');
curBag = rosbag('..\Low_Coverage\LC_20231130_145915.bag');

curTopics = curBag.AvailableTopics.Properties.RowNames;

% Sensor 1 heeft de RGB data ter beschikking
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');

allImColor = readMessages(curSelColor, 'DataFormat', 'struct');

imColor = rosReadImage(allImColor{1});

imshow(imColor)

lab_img = rgb2lab(imColor);
figure;
imshow(lab_img)

% bepaal de aparte onderdelen van LAB

% L* De intensiteit
% a* de verhouding van rood-groen
% b* de verhouding van blauw-geel
L = lab_img(:,:,1);
a = lab_img(:,:,2);
b = lab_img(:,:,3);

figure;
subplot(1,3,1)
imshow(int8((L+127/255.0)))
subplot(1,3,2)
imshow(a)
subplot(1,3,3)
imshow(b)


%tresh a
% a gaat van -127 (groen) <-> 128 (rood)
% bruin ligt hier tussen. Dus we moeten een tresh rond de 0 nemen
new_a = zeros(size(a));
new_a(:,:) = (a(:,:) < 5);
imshow(a);
maskedRgbImage = bsxfun(@times, imColor, cast(new_a, 'like', imColor)); 
close all;
figure;
%imshow(maskedRgbImage);
montage({imColor, maskedRgbImage})
%% 
% probeersel
%L(:) = 75;
%lab_img(:,:,1) = lab_img(:,:,1) + 20;
lab1 = rgb2lab(imColor);
lab1(:,:,1) = lab1(:,:,1) + 20;
lab1(:,:,1) = (lab1(:,:,1) <=1).*(lab1(:,:,1) + 10);
test = lab2rgb(lab1);

figure;
imshow(lab1);
% determine the freen leaves
recon = imreconstruct(double(imColor),b, 18 );
%%
% Probeersel 2 (Ahmad)
% We are going to threshold transform the image so we can label it:
T = graythresh(maskedRgbImage);
im = im2bw(maskedRgbImage, T);
figure;
imshow(im)
[L, n] = bwlabel(im);

% now we are going to calculate the total area covered by leaves as
% determined by Thomas. This will give us an amount of pixels
D_area = regionprops(L,'Area');
matrix_area = [D_area.Area];
total_area_covered_by_leaves = sum(matrix_area, 'all');

% Now we are going to divide this number by the total amount of pixels:
pixels = size(maskedRgbImage);
x_pixels = pixels(1);
y_pixels = pixels(2);
total_area_image = x_pixels*y_pixels;

percentage_covered_by_leaves = total_area_covered_by_leaves/total_area_image; % 0.4428