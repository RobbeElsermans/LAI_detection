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

    cleancloud = NormalizeAndCleanPointCloudNormal(pointcloud);

    [slicedPointClouds, amountOfSlices] = SlicePointCloud(cleancloud,0.1);

    Leaf_area_index = CalculateLAIfromPointCloud(slicedPointClouds);
    
    fprintf("file %s has an LAI of %f \n", filepaths{path}, Leaf_area_index)
end