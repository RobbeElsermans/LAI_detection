clc;
clear;


InitialDepth = 0.2;
pointcloud = pcread('..\High_Coverage\HC_20231130_143832.ply');
%clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
% such that only actual outliers are removed
[model,inlierIndices, outlierIndices] = pcfitplane(pointcloud,InitialDepth);
cleancloud = select(pointcloud, inlierIndices); % Select the indices that are in the 1m region

referenceVector = [0 0 1];  % x=0, y=0, z=1
tform = normalRotation(model,referenceVector);
leveledPc = pctransform(cleancloud,tform);

% Get the point cloud z limits.
minZ = leveledPc.ZLimits(1);
maxZ = leveledPc.ZLimits(2);
% Define the thickness of each slice.
thickness = 0.05;
% Use pcplayer to visualize the point cloud slices.
player = pcplayer(leveledPc.XLimits, leveledPc.YLimits, leveledPc.ZLimits);
% Use a for loop to select each point cloud slice.
for i = minZ:thickness:maxZ
    % Get the logical indices of the points in each slice.
    selectedIdx = leveledPc.Location(:, 3) >= i & leveledPc.Location(:, 3) < (i + thickness);
    % Select the point cloud slice using the indices.
    ptCloudSlice = select(leveledPc, selectedIdx);
    % Visualize the slice.
    view(player, ptCloudSlice)
    pause
end