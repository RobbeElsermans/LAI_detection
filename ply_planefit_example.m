clear
close all
pointcloud = pcread('High_Coverage/HC_20231130_143832.ply');
%clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
% such that only actual outliers are removed
[model,inlierIndices, outlierIndices] = pcfitplane(pointcloud,0.5);
cleancloud = select(pointcloud, inlierIndices);
pcshow(cleancloud)
title("Cleaned dataset, outliners removed")

% estimatedLayerThickness = 0.01;
% [model,inlierIndices, outlierIndices] = pcfitplane(cleancloud,estimatedLayerThickness);
% firstlayer = select(cleancloud, inlierIndices);
% figure();pcshow(firstlayer)
% title("Leaves first layer")
% 
% secondlayer = select(cleancloud, outlierIndices);
% figure();pcshow(secondlayer)
% title("Leaves second layer")