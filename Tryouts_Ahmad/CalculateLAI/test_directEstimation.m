clear
clc

addpath("..\..\Tryouts_Ahmad\")
addpath("..\ImageCreation\")
addpath("..\Statistics\")

directory = "..\..\..\Low_Coverage";  % Replace '..\..\PLY files' with your directory path
files = dir(fullfile(directory, '*.bag'));

filepaths = cell(numel(files), 1);

% Display and store the names of all PLY files in the directory
for i = 1:numel(files)
    filepaths{i} = fullfile(directory, files(i).name);
    disp(filepaths{i});
end

for path=1:length(filepaths)

    pointcloud = ConvertBagToPointCloud(filepaths{path});
    
    [model,inlierIndices, outlierIndices] = pcfitplane(pointcloud,0.7);
    pointcloud = select(pointcloud, inlierIndices); % Select the indices that are in the 1m region

    %pointcloud = {pointcloud};
    
    %normalizedCounts = CalculateNormalizedCounts(pointcloud, 1280*780);
    Leaf_area_index = sum(pointcloud.Location(:,1))/(1270*780);
    
    fprintf("file %s has an LAI of %f \n", filepaths{path}, Leaf_area_index)
end

