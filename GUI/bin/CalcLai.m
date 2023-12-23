function [Leaf_area_index] = CalculateLAIfromPointCloud(countsInSlices, image_size, green_percent, hidden_leave_factor)
% Assuming 'slicedPointClouds' contains the sliced point clouds

% % Initialize an array to store the counts in each slice
% countsInSlices = zeros(numel(slicedPointClouds), 1);
% 
% % Calculate the count in each slice
% for i = 1:numel(slicedPointClouds)
%     % Count the number of points in the slice
%     close all
%     %pcshow(slicedPointClouds{i})
%     %pause
%     countsInSlices(i) = numel(slicedPointClouds{i}.Location);
% end

% wall area in pixels;
% image_size = 1280*720;

% Divide each count by the depth x, y size
result = countsInSlices / image_size; 

Leaf_area_index = ((2/sum(result,"all"))*hidden_leave_factor*green_percent);

end