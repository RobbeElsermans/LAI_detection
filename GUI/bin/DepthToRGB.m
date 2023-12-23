function [depth_rgb_im] = DepthToRGB(depth_image)

    % Remove values that doesn't matter
    % All values > 1 are mismeasures
    mismeasure = depth_image > 1;
    % Reduce the mismeasure values
    depth_image(mismeasure) = 0;

    % Determine the min and max value
    % Convert depth range to rgb value
    min_val = min(min(depth_image)); 
    max_val = max(max(depth_image));

    % Convert depth image to hue values 0 - 1
    % Hue = 0 --> red & hue = 1 --> red
    % Range hue between 0 - 0.83 to get the color spectrum
    hue = interp1([min_val,max_val],[0,0.67],depth_image);

    % Set saturation and value range to max
    saturation = 1; value = 1;

    % Get rows and columns of image
    [rows, columns] = size(hue);

    % Loop through image
    depth_rgb_im = zeros(rows, columns, 3);
    for i = 1:1:rows
        for j = 1:1:columns
            % Convert each pixel value to rgb value
            rgb_values = hsv2rgb([hue(i,j), saturation, value]);
            depth_rgb_im(i,j,1) = rgb_values(1);
            depth_rgb_im(i,j,2) = rgb_values(2);
            depth_rgb_im(i,j,3) = rgb_values(3);
        end
    end
end