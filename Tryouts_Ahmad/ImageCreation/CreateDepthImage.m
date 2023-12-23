function [depth_img] = CreateDepthImage(curBag)
%CREATEDEPTHIMAGE Summary of this function goes here
%   Detailed explanation goes here

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepth = double(rosReadImage(allImDepth{1}));
imDepthNormalised = imDepth / max(max(imDepth));

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
depth_img = imDepth .* depthVal{1}.Data; 

end

