clear
close all
pointcloud = pcread('..\..\PLY files\LC_20231130_145915.ply');
% clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
% such that only actual outliers are removed
[model, inlierIndices, outlierIndices] = pcfitplane(pointcloud,0.1);
cleancloud = select(pointcloud, inlierIndices);
pcshow(cleancloud);

normalVector = mean(cleancloud.Normal);

%% Rotate the plane
tform = normalRotation(model, normalVector./[inf inf normalVector(3)]);
    
cleancloud = pctransform(cleancloud,tform);

pcshow(cleancloud)
xlabel("x")
ylabel("y")
zlabel("z")

%%
% Assuming 'cleancloud' contains the cleaned point cloud (only actual outliers removed)

% Define the threshold based on the Z-range of your data
Threshold = mean(cleancloud.Location(:, 3)); % Adjust as needed

% Step 1: Segmentation - separating ground and leaves (example segmentation)
leafIndices = find(cleancloud.Location(:, 3) > Threshold); % Adjust 'someThreshold' as needed
groundIndices = find(cleancloud.Location(:, 3) <= Threshold); % Adjust 'someThreshold' as needed

% Create point clouds for leaves and ground
leafCloud = select(cleancloud, leafIndices);
groundCloud = select(cleancloud, groundIndices);
%pcshow(leafCloud)
%%
% Step 2: Estimate Leaf Area
leafArea = numel(leafIndices) * leafCloud.Count * leafCloud.XLimits.*leafCloud.YLimits; % Assuming regular grid, estimating leaf area as the count of leaf points * grid cell area

% Step 3: Calculate Ground Area
groundArea = numel(groundIndices) * groundCloud.Count * groundCloud.XLimits.*groundCloud.YLimits; % Similar estimation for ground area

% Step 4: Calculate Leaf Area Index (LAI)
LAI = leafArea / groundArea;

% Displaying the results
disp(['Leaf Area: ', num2str(leafArea)]);
disp(['Ground Area: ', num2str(groundArea)]);
disp(['Leaf Area Index (LAI): ', num2str(LAI*5)]);
%%
% Assuming 'cleancloud' contains the cleaned point cloud (only actual outliers removed)
% Assuming 'leafCloud' and 'groundCloud' are obtained through segmentation

% Calculate leaf area using voxel dimensions
leafVoxelSize = mean(diff(unique(leafCloud.Location(:, 1:2), 'rows'))); % Calculate the average voxel size in X and Y directions
leafArea = numel(leafIndices) * leafVoxelSize(1) * leafVoxelSize(2); % Estimate leaf area

% Calculate ground area using voxel dimensions
groundVoxelSize = mean(diff(unique(groundCloud.Location(:, 1:2), 'rows'))); % Calculate the average voxel size in X and Y directions
groundArea = numel(groundIndices) * groundVoxelSize(1) * groundVoxelSize(2); % Estimate ground area

% Calculate Leaf Area Index (LAI)
LAI = leafArea / groundArea;

% Display the results
disp(['Leaf Area: ', num2str(leafArea)]);
disp(['Ground Area: ', num2str(groundArea)]);
disp(['Leaf Area Index (LAI): ', num2str(LAI)]);

