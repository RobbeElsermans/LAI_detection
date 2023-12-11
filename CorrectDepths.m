try
    curBag = rosbag('Medium_Coverage/MC_20231130_15050.bag');

curTopics = curBag.AvailableTopics.Properties.RowNames;

% Sensor 1 heeft de RGB data ter beschikking
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');

allImColor = readMessages(curSelColor, 'DataFormat', 'struct');

imColor = rosReadImage(allImColor{1});

imshow(imColor)

% Sensor 0 heeft de diepte ter beschikking
curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepth = double(rosReadImage(allImDepth{1}));
imDepthNormalised = imDepth / max(max(imDepth));

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepthReal = imDepth .* depthVal{1}.Data; 
figure();imshow(imDepthReal)

catch
    disp("not found")
end

%%
[file,path] = uigetfile('*.m');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end
