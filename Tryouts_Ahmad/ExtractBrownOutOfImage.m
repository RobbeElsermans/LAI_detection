%% Load an image frame:

curbag = rosbag('..\..\Low_Coverage\LC_20231130_145915.bag');

curTopics = curbag.AvailableTopics.Properties.RowNames;
curSelColor = select(curbag,'Topic','/device_0/sensor_1/Color_0/image/data');
allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
imColor = rosReadImage(allImColor{1});


%imColorHSV = rgb2hsv( double( imColor ) );
%% stel ipv imColorHSV, code van Thomas
imColorLAB = rgb2lab(imColor);
figure;
imshow(imColorLAB)
% bepaal de aparte onderdelen van LAB

% L* De intensiteit
% a* de verhouding van rood-groen
% b* de verhouding van blauw-geel
L = imColorLAB(:,:,1);
a = imColorLAB(:,:,2);
b = imColorLAB(:,:,3);

figure;
subplot(1,3,1)
imshow(int8((L+127/255.0)))
subplot(1,3,2)
imshow(a)
subplot(1,3,3)
imshow(b)
%%

%tresh a
% a gaat van -127 (groen) <-> 128 (rood)
% bruin ligt hier tussen. Dus we moeten een tresh rond de 0 nemen
new_a = zeros(size(a));
new_a(:,:) = (a(:,:) < 5);
imshow(a);