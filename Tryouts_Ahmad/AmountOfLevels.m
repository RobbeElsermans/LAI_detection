clear
close all
clc

directory = '..\..\PLY files';  % Replace '..\..\PLY files' with your directory path
files = dir(fullfile(directory, '*.ply'));

filepaths = cell(numel(files), 1);

% Display and store the names of all PLY files in the directory
for i = 1:numel(files)
    filepaths{i} = fullfile(directory, files(i).name);
    %disp(filepaths{i});
end

%filepaths = ["..\..\PLY files\HC_20231130_143832.ply", "..\..\PLY files\MC_20231130_150501.ply", "..\..\PLY files\LC_20231130_145915.ply"];

for path=1:length(filepaths)
    pointcloud = pcread(filepaths{path});
    % clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
    % such that only actual outliers are removed
    [model, inlierIndices, outlierIndices] = pcfitplane(pointcloud,3);
    cleancloud = select(pointcloud, inlierIndices);
    % figure;
    % pcshow(cleancloud);
    % title("cleancloud 1")
    % xlabel("x")
    % ylabel("y")
    % zlabel("z")
    normalVector = sum(cleancloud.Normal);
    
    tform = normalRotation(model, [0 0 1]);
        
    cleancloud = pctransform(cleancloud,tform);
    % figure;
    % pcshow(cleancloud)
    % title("cleancloud 2")
    % xlabel("x")
    % ylabel("y")
    % zlabel("z")
    
    % slicing the point cloud
    
    % Assuming 'cleancloud' is your point cloud variable
    
    % Determine the range of z values in the point cloud
    zValues = cleancloud.Location(:, 3);
    minZ = min(zValues);
    maxZ = max(zValues);
    
    % Define the thickness of each slice
    sliceThickness = 0.01;
    
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
    
    % % Visualize some slices (for example, the first five slices)
    % numSlicesToVisualize = numel(slicedPointClouds);
    % for i = 1:numSlicesToVisualize
    %     figure;
    %     pcshow(slicedPointClouds{i});
    %     title(['Slice ' num2str(i)]);
    %     xlabel('x');
    %     ylabel('y');
    %     zlabel('z');
    % end
    
    % Assuming 'slicedPointClouds' contains the sliced point clouds
    
    % Initialize an array to store the counts in each slice
    countsInSlices = zeros(numel(slicedPointClouds), 1);
    
    % Calculate the count in each slice
    for i = 1:numel(slicedPointClouds)
        % Count the number of points in the slice
        countsInSlices(i) = numel(slicedPointClouds{i}.Location);
    end
    
    % wall area in pixels;
    
    wall_area = 1280*720;
    
    % Divide each count by 23
    result = countsInSlices / wall_area; 
    
    % Display the result
    %disp(result);
    
    Leaf_area_index = 2/sum(result,"all");
    fprintf("file %s has an LAI of %f \n", filepaths{path}, Leaf_area_index)
end
