
curBag = rosbag('Medium_Coverage/MC_20231130_150501.bag');

curTopics = curBag.AvailableTopics.Properties.RowNames;

% Sensor 1 heeft de RGB data ter beschikking
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');

allImColor = readMessages(curSelColor, 'DataFormat', 'struct');

imColor = rosReadImage(allImColor{1});

%imshow(imColor)

% Sensor 0 heeft de diepte ter beschikking
curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepth = double(rosReadImage(allImDepth{1}));
imDepthNormalised = imDepth / max(max(imDepth));

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepthReal = imDepth .* depthVal{1}.Data; 
%figure();imshow(imDepthReal)

imDepthReal(imDepthReal == 0) = NaN;
close all;
%imshow(imDepthReal)
I2 = imcrop(imDepthReal,[85 0 columns rows]);

% Haal de outliners er van af. We nemen 3x de mediaan
medianImage = 3*median(I2,'all', 'omitmissing');
% omitmissing zal ervoor zorgen dat we NaN negeren
I2(medianImage <= abs(I2)) = NaN;

surf(I2, "EdgeColor","none")
%scatfig.Children(2).Parent = parent

%% resize RGB
[rows columns] = size(imDepthReal);
I2 = imcrop(imDepthReal,[90 0 columns rows]);
[rows, columns, numberOfColorChannels] = size(I2);
resizedRGB = imresize(imColor, [rows columns]);
close all;
gray = rgb2gray(resizedRGB);
gray = double(gray)/255.0;
%imshow((rgb2gray(resizedRGB) .* imDepthReal))
gray = imadjust(gray);
bin = imbinarize(gray);
imshow(gray);% .* imDepthReal)

subplot(2,2,1);
imshow(imColor);% .* imDepthReal)
subplot(2,2,2);
imshow(I2);% .* imDepthReal)

subplot(2,2,3);
imshow(bin);% .* imDepthReal)

subplot(2,2,4);
imshow(bin - I2);
%imshowpair(gray, I2, "falsecolor")

min(imDepthReal,[], "all")
max(imDepthReal,[], "all")

%% resize Depth
data = size(imDepthReal);
I2 = imcrop(imDepthReal,[85 0 columns rows]);
%rows = rows - 100
%resizedRGB = imresize(imDepthReal, [rows columns]);
close all;


imshow(I2)

