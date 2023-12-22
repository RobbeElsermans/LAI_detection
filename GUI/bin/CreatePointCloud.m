function pointCloud = createPointCloud(depthImage, fx, fy, cx, cy)
% Input:
% depthImage: The depth image
% fx, fy: Focal length of the camera in x and y directions
% cx, cy: Principal point coordinates in the image

% Create grid of pixel coordinates
[rows, cols] = size(depthImage);
[u, v] = meshgrid(1:cols, 1:rows);

% Calculate x, y, z coordinates in camera coordinate frame
z = double(depthImage(:))';
x = (u(:) - cx) .* z / fx;
y = (v(:) - cy) .* z / fy;

% Convert to homogeneous coordinates
pointCloud = [x; y; z; ones(1, numel(depthImage))];
pointCloud = pointCloud(:, z > 0); % Remove points with invalid depth

end

% Usage
% depthImage = imread('depth_image.png'); % Load your depth image
% fx = 500; % Focal length in x direction
% fy = 500; % Focal length in y direction
% cx = size(depthImage, 2) / 2; % Principal point in x direction
% cy = size(depthImage, 1) / 2; % Principal point in y direction
% 
% pointCloud = createPointCloud(depthImage, fx, fy, cx, cy);