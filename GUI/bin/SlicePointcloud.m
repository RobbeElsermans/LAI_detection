function [sliced_pointClouds,current_sliceIndex, z_distance] = SlicePointcloud(cleancloud,slice_thickness)
% slicing the point cloud

    % Determine the range of z values in the point cloud
    z_val = cleancloud.Location(:, 3);

    z_range = cleancloud.ZLimits; % range is [min, max]
    z_distance = abs(z_range(2) - z_range(1)); % Absolute value

    % Initialize variables to store sliced point clouds
    sliced_pointClouds = cell(ceil(z_distance / slice_thickness), 1);
    
    % Slice the point cloud
    current_sliceIndex = 0;  % The index we are slicing
    currentZ = z_range(1);       % We start from the minimum
    
    while currentZ < z_range(2)
        current_sliceIndex = current_sliceIndex + 1;
    
        % Define the bounds of the current slice
        temp_z_min = currentZ;
        temp_z_max = currentZ + slice_thickness; % We go to a maximum of currentZ + the given slice index
    
        % Extract points within the current slice
        indices = find(z_val >= temp_z_min & z_val < temp_z_max); % We filter out only the point between the temp_z_min and temp_z_max
        sliced_pointClouds{current_sliceIndex} = select(cleancloud, indices); % the indices represent the points that are in the given z-range.
    
        % Move to the next slice
        currentZ = currentZ + slice_thickness;
    end
end
