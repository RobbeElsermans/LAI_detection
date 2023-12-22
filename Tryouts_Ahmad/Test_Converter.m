inputBagFile = '..\..\Low_Coverage\LC_20231130_145915.bag';
outputFolder = 'PLY_test'; % Folder to store the output .ply file
outputFileName = 'LC_20231130_145915.ply'; % Replace with your desired output filename

% Load the bag file
bag = rosbag(inputBagFile);

% Get the topic names for color and depth images

depthTopic = '/device_0/sensor_0/Depth_0/image/data';

% Read messages from the bag

depthMsgs = readMessages(select(bag, 'Topic', depthTopic));

% Initialize empty arrays to store color and depth data

depthData = [];

% Extract color and depth image data
for i = 1:numel(depthMsgs)
    depthImg = readImage(depthMsgs{i});

    % Store color and depth data
    depthData(:, :, :, i) = depthImg;
end

% Convert depth data to point cloud
xyzPoints = depthToPointCloud(depthData);

% Transpose xyzPoints to switch the dimensions from 407040x3x128 to 407040x128x3
xyzPoints = permute(xyzPoints, [1, 3, 2]);

% Specify the full path to the output .ply file
outputFilePath = fullfile(outputFolder, outputFileName);

% Write point cloud data to PLY file in the specified folder
%pcwrite(pointCloud(xyzPoints), outputFilePath);

ptCloud = pointCloud(xyzPoints);
%pcshow(ptCloud);

% function xyzPoints = depthToPointCloud(depthData)
%     % Convert depth data to point cloud
%     fx = 525.0; % Focal length in x direction
%     fy = 525.0; % Focal length in y direction
%     cx = 319.5; % Principal point x coordinate
%     cy = 239.5; % Principal point y coordinate
%     [rows, cols, ~, numFrames] = size(depthData);
%     xyzPoints = zeros(rows*cols, 3, numFrames);
%     for k = 1:numFrames
%         Z = double(depthData(:, :, 1, k));
%         [X, Y] = meshgrid(1:cols, 1:rows);
%         X = (X - cx) .* Z / fx;
%         Y = (Y - cy) .* Z / fy;
%         xyzPoints(:, :, k) = [X(:), Y(:), Z(:)];
%     end
% end

function xyzPoints = depthToPointCloud(depthData)
    % Convert depth data to point cloud in meters
    [rows, cols, ~, numFrames] = size(depthData);
    xyzPoints = zeros(rows*cols, 3, numFrames);
    
    % Define camera intrinsics (if known)
    fx = 525.0; % Focal length in x direction
    fy = 525.0; % Focal length in y direction
    cx = 319.5; % Principal point x coordinate
    cy = 239.5; % Principal point y coordinate
    
    [X, Y] = meshgrid(1:cols, 1:rows);
    
    for k = 1:numFrames
        Z = double(depthData(:, :, 1, k));
        
        % Calculate X, Y, Z in meters
        X_meters = (X - cx) .* Z / fx;
        Y_meters = (Y - cy) .* Z / fy;
        
        % Reshape X, Y, Z to create point cloud
        xyzPoints(:, :, k) = cat(3, X_meters(:), Y_meters(:), Z(:));
    end
end
