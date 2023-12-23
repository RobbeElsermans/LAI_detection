curBag = rosbag('..\..\Medium_Coverage\MC_20231130_150501.bag');

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/Depth_0/image/data');
allImDepth = readMessages(curSelDepth, 'DataFormat', 'struct');
imDepth = double(rosReadImage(allImDepth{1}));
imDepthNormalised = imDepth / max(max(imDepth));

curSelDepth = select(curBag,'Topic','/device_0/sensor_0/option/Depth_Units/value');
depthVal = readMessages(curSelDepth, 'DataFormat', 'struct');
depth_img = imDepth .* depthVal{1}.Data; 
figure();imshow(depth_img)

curTopics = curBag.AvailableTopics.Properties.RowNames;
curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');
allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
imColor = rosReadImage(allImColor{1});
imshow(imColor)


% Intrinsic parameters (replace these with your camera's intrinsic parameters)
fx = 525.0; % focal length x
fy = 525.0; % focal length y
cx = 319.5; % optical center x
cy = 239.5; % optical center y

% Define the depth scale factor (depth is in meters now)
depth_scale = 1.0; % Depth is directly in meters

% Create grid of pixel coordinates
[rows, cols] = size(depth_img);
[u, v] = meshgrid(1:cols, 1:rows);

% Convert depth image to 3D point cloud
Z = double(depth_img) * depth_scale;
X = (u - cx) .* Z / fx;
Y = (v - cy) .* Z / fy;

% Rearrange points into a point cloud without colors
point_cloud = pointCloud(cat(3, X, Y, Z));

% Ensure the color image matches the size of the depth image
imColor_resized = imresize(imColor, [size(depth_img, 1), size(depth_img, 2)]);

% Get RGB values from the resized color image
R = double(imColor_resized(:, :, 1)) / 255.0;
G = double(imColor_resized(:, :, 2)) / 255.0;
B = double(imColor_resized(:, :, 3)) / 255.0;

% Create color point cloud
point_cloud.Color = uint8(255 * cat(3, R, G, B));

% Save color point cloud to a .ply file
pcwrite(point_cloud, '.\PLY_test\colored_point_cloud.ply');