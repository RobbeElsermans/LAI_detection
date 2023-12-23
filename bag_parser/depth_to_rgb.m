function [rgb_im] = depth_to_rgb(depth_image, min_val, max_val)
    % Convert depth image to hue values 0 - 1
    % Hue = 0 --> red & hue = 1 --> red
    % Range hue between 0 - 0.83 to get the color spectrum
    hue = interp1([min_val,max_val],[0,0.67],depth_image);

    % Set saturation and value range to max
    saturation = 1; value = 1;

    % Get rows and columns of image
    [rows, columns] = size(hue);

    % Loop through image
    rgb_im = zeros(rows, columns, 3);
    for i = 1:1:rows
        for j = 1:1:columns
            % Convert each pixel value to rgb value
            rgb_values = hsv2rgb([hue(i,j), saturation, value]);
            rgb_im(i,j,1) = rgb_values(1);
            rgb_im(i,j,2) = rgb_values(2);
            rgb_im(i,j,3) = rgb_values(3);
        end
    end
end