function [sliced_pointClouds,current_sliceIndex, hidden_leave_factor] = SlicePointCloud(cleancloud,slice_thickness)
% slicing the point cloud

% Assuming 'cleancloud' is your point cloud variable

% Determine the range of z values in the point cloud
z_val = cleancloud.Location(:, 3);
% minZ = min(zValues);
% maxZ = max(zValues);
z_range = cleancloud.ZLimits; % range is [min, max]
z_distance = abs(z_range(2) - z_range(1)); % Absolute value
% Define the thickness of each slice
%sliceThickness = 0.1;

% Initialize variables to store sliced point clouds
sliced_pointClouds = cell(ceil(z_distance / slice_thickness), 1);

% Slice the point cloud
current_sliceIndex = 1;  % The index we are slicing
currentZ = z_range(1);       % We start from the minimum

while currentZ < z_range(2)
    % Define the bounds of the current slice
    temp_z_min = currentZ;
    temp_z_max = currentZ + slice_thickness; % We go to a maximum of currentZ + the given slice index

    % Extract points within the current slice
    indices = find(z_val >= temp_z_min & z_val < temp_z_max); % We filter out only the point between the temp_z_min and temp_z_max
    sliced_pointClouds{current_sliceIndex} = select(cleancloud, indices); % the indices represent the points that are in the given z-range.

    % Move to the next slice
    currentZ = currentZ + slice_thickness;
    current_sliceIndex = current_sliceIndex + 1;
end
% Determine the hidden leave value.
% If the total z_distance is higher then 0.15, then we have probably hidden
% leaves

hidden_leave_thresh = 0.10;
hidden_leave_factor = 1; % default, we have no hidden leaves

if z_distance > hidden_leave_thresh
    hidden_leave_factor = ((z_distance/hidden_leave_thresh)/10)+1; % +1 om ervoor te zorgen dat de factor erbij komt i.p.v. er af gaat
end

end

