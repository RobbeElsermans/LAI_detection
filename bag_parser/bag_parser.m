function [imColor,imDepthReal] = bag_parser(path)
    curBag = rosbag(path);
    curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');
    allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
    imColor = rosReadImage(allImColor{1});

    curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
    allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
    imDepth = double(rosReadImage(allImDepth{1}));
    %imDepthNormalised = imDepth / max(max(imDepth));

    curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
    depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
    imDepthReal = imDepth .* depthVal{1}.Data;
end

