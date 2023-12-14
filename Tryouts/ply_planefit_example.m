clear
clc
close all

InitialDepth = 0.2;


% windows
pointcloud = pcread('..\High_Coverage\HC_20231130_152757.ply');
%clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
% such that only actual outliers are removed
[model,inlierIndices, outlierIndices] = pcfitplane(pointcloud,InitialDepth);
cleancloud = select(pointcloud, inlierIndices); % Select the indices that are in the 1m region
%cleancloud = rmoutliers(cleancloud);
%cleancloud = pcdenoise(cleancloud);
pcshow(cleancloud)
title("Cleaned dataset, outliners removed")

figure

% https://www.mathworks.com/help/vision/ref/planemodel.normalrotation.html

% the ground plane
referenceVector = [0 0 1];  % x=0, y=0, z=1

%Rotate the plane
%groundPlane = pcfitplane(cleancloud,maxDistance,referenceVector);
tform = normalRotation(model,referenceVector);

tform = normalRotation(model,referenceVector);
leveledPc = pctransform( cleancloud,tform);
pcshow(leveledPc)
% planeParams = model.Parameters * tform.T;
% transformedPlane = planeModel(planeParams);
% figure;
% pcshowpair(leveledPc,cleancloud);
% hold on;
% plot(model, 'Color', 'magenta');
% plot(transformedPlane, 'Color', 'green');

% Find min value

% estimatedLayerThickness = 0.01;
% [model,inlierIndices, outlierIndices] = pcfitplane(cleancloud,estimatedLayerThickness);
% firstlayer = select(cleancloud, inlierIndices);
% figure();pcshow(firstlayer)
% title("Leaves first layer")
% 
% secondlayer = select(cleancloud, outlierIndices);
% figure();pcshow(secondlayer)
% title("Leaves second layer")