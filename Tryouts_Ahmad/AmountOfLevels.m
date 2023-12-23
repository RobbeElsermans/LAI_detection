clear
close all
clc

addpath("Statistics\")

directory = '..\High_Coverage';  % Replace '..\..\PLY files' with your directory path
files = dir(fullfile(directory, '*.ply'));

filepaths = cell(numel(files), 1);

% Display and store the names of all PLY files in the directory
for i = 1:numel(files)
    filepaths{i} = fullfile(directory, files(i).name);
    disp(filepaths{i});
end

filepaths = ["..\..\PLY files\HC_20231130_143832.ply", "..\..\PLY files\MC_20231130_150501.ply", "..\..\PLY files\LC_20231130_145915.ply"];

for path=1:length(filepaths)
    %pointcloud = pcread(filepaths{path});
    pointcloud = pcread(filepaths(path));
    % Wordt al gedaan in de App onder ApplyLayerDefButtonPushed
    cleancloud = NormalizeAndCleanPointCloudNormal(pointcloud, 0.19);
    

    %figure
    %pcshow(cleancloud)


    [slicedPointClouds, amountOfSlices] = SlicePointCloud(cleancloud,0.05);
    
    normalized_counts = CalculateNormalizedCounts(slicedPointClouds, 1280*720);

    % Leaf_area_index = mean_LAI_calculation(normalized_counts);
    %Leaf_area_index = trimmed_mean_LAI_calculation(normalized_counts, 60);
    Leaf_area_index = gaussian_LAI_calculation(normalized_counts);
    
    fprintf("file %s has an LAI of %f \n", filepaths(path), Leaf_area_index)
end
