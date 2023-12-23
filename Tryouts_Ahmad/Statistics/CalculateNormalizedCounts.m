function [normalized_counts] = CalculateNormalizedCounts(slicedPointClouds, wall_area)
% Initialize an array to store the counts in each slice
countsInSlices = zeros(numel(slicedPointClouds), 1);

% Calculate the count in each slice
for i = 1:numel(slicedPointClouds)
    % Count the number of points in the slice
    countsInSlices(i) = numel(slicedPointClouds{i}.Location);
end

% Normalize counts by wall area
normalized_counts = countsInSlices / wall_area;
end
