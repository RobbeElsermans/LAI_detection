function ConvertBagToPly(inputBagFile, outputPLYFile)
    % Load the bag file
    bag = rosbag(inputBagFile);

    % Get the topic names for color and depth images
    colorTopic = '/camera/color/image_raw';
    depthTopic = '/camera/depth/image_raw';

    % Read messages from the bag
    colorMsgs = select(bag, 'Topic', colorTopic);
    depthMsgs = select(bag, 'Topic', depthTopic);

    % Initialize empty arrays to store color and depth data
    colorData = [];
    depthData = [];

    % Extract color and depth image data
    for i = 1:height(colorMsgs)
        colorImg = readImage(readMessages(colorMsgs, i));
        depthImg = readImage(readMessages(depthMsgs, i));
        
        % Store color and depth data
        colorData(:, :, :, i) = colorImg;
        depthData(:, :, i) = depthImg;
    end

    % Reshape depth data to match the color image dimensions
    [height, width, ~, numFrames] = size(colorData);
    depthData = reshape(depthData, [height, width, numFrames]);

    % Convert depth data to point cloud
    xyzPoints = depthToPointCloud(depthData);

    % Write point cloud data to PLY file
    pcwrite(pointCloud(xyzPoints), outputPLYFile);
end

function xyzPoints = depthToPointCloud(depthData)
    % Convert depth data to point cloud
    fx = 525.0; % Focal length in x direction
    fy = 525.0; % Focal length in y direction
    cx = 319.5; % Principal point x coordinate
    cy = 239.5; % Principal point y coordinate
    [rows, cols, numFrames] = size(depthData);
    xyzPoints = zeros(rows*cols, 3, numFrames);
    for k = 1:numFrames
        Z = double(depthData(:, :, k));
        [X, Y] = meshgrid(1:cols, 1:rows);
        X = (X - cx) .* Z / fx;
        Y = (Y - cy) .* Z / fy;
        xyzPoints(:, :, k) = [X(:), Y(:), Z(:)];
    end
end
