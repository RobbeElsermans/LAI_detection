function [slicedPointClouds,currentSliceIndex] = SlicePointCloud(cleancloud,sliceThickness)
% slicing the point cloud

% Assuming 'cleancloud' is your point cloud variable

% Determine the range of z values in the point cloud
zValues = cleancloud.Location(:, 3);
minZ = min(zValues);
maxZ = max(zValues);

% Define the thickness of each slice
%sliceThickness = 0.1;

% Initialize variables to store sliced point clouds
slicedPointClouds = cell(ceil((maxZ - minZ) / sliceThickness), 1);

% Slice the point cloud
currentSliceIndex = 1;
currentZ = minZ;

while currentZ < maxZ
    % Define the bounds of the current slice
    zMin = currentZ;
    zMax = currentZ + sliceThickness;

    % Extract points within the current slice
    indices = find(zValues >= zMin & zValues < zMax);
    slicedPointClouds{currentSliceIndex} = select(cleancloud, indices);

    % Move to the next slice
    currentZ = currentZ + sliceThickness;
    currentSliceIndex = currentSliceIndex + 1;
end
end

