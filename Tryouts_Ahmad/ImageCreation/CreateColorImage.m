function [imColor] = CreateColorImage(curBag)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%curTopics = curBag.AvailableTopics.Properties.RowNames;
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');
allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
imColor = rosReadImage(allImColor{1});
end

