function [Leaf_area_index] = CalculateLAIfromPointCloud(slicedPointClouds)
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
end

