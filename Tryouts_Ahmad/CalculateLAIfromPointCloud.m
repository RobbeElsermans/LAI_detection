function [Leaf_area_index] = CalculateLAIfromPointCloud(slicedPointClouds, wall_area) 
%
% DO NOT USE THIS FUNCTION, USE THE FOLDER "Statistics"
%

% Assuming 'slicedPointClouds' contains the sliced point clouds

% Initialize an array to store the counts in each slice
countsInSlices = zeros(numel(slicedPointClouds), 1);

% Calculate the count in each slice
for i = 1:numel(slicedPointClouds)
    % Count the number of points in the slice
    close all
    %pcshow(slicedPointClouds{i})
    %pause
    countsInSlices(i) = numel(slicedPointClouds{i}.Location);
end

% wall area in pixels;
% wall_area = 1280*720;

% Divide each count by the wall area -> normalize
result = countsInSlices / wall_area; 

% Display the result
%disp(result);

Leaf_area_index = 2/sum(result,"all");
end

