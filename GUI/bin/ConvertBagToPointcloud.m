function point_cloud_data = ConvertBagToPointcloud(img_color,img_depth, intrinsic_parameters)
%CONVERTBAGTOPOINTCLOUD Summary of this function goes here 

    % Intrinsic parameters (replace these with your camera's intrinsic parameters)
    % replace by intrinsic_parameters
    fx = 525.0; % focal length x
    fy = 525.0; % focal length y
    cx = 319.5; % optical center x
    cy = 239.5; % optical center y
    
    % Define the depth scale factor (depth is in meters now)
    depth_scale = 1.0; % Depth is directly in meters
    
    % Create grid of pixel coordinates
    [rows, cols] = size(img_depth);
    [u, v] = meshgrid(1:cols, 1:rows);
    
    % Convert depth image to 3D point cloud
    Z = double(img_depth) * depth_scale;
    X = (u - cx) .* Z / fx;
    Y = (v - cy) .* Z / fy;
    
    % Rearrange points into a point cloud without colors
    point_cloud_data = pointCloud(cat(3, X, Y, Z));
    
    % Ensure the color image matches the size of the depth image
    imColor_resized = imresize(img_color, [size(img_depth, 1), size(img_depth, 2)]);
    
    % Get RGB values from the resized color image
    R = double(imColor_resized(:, :, 1)) / 255.0;
    G = double(imColor_resized(:, :, 2)) / 255.0;
    B = double(imColor_resized(:, :, 3)) / 255.0;
    
    % Create color point cloud
    point_cloud_data.Color = uint8(255 * cat(3, R, G, B));
    
    % Save color point cloud to a .ply file
    %pcwrite(point_cloud, '.\PLY_test\colored_point_cloud.ply');

end

