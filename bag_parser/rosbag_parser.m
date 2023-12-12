curBag = rosbag('MC_20231130_150501.bag')
curTopics = curBag.AvailableTopics.Properties.RowNames;
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');
allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
imColor = rosReadImage(allImColor{1});
imshow(imColor)

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepth = double(rosReadImage(allImDepth{1}));
imDepthNormalised = imDepth / max(max(imDepth));

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
depthVal 
imDepthReal = imDepth .* depthVal{1}.Data; 
figure();imshow(imDepthReal)

