clear
close all
clc

pointcloud = pcread("..\..\PLY files\LC_20231130_145915.ply");

figure;
pcshow(pointcloud);
title("3D beeld")

% Roep de functie aan om de point cloud als grayscale afbeelding te visualiseren
image = CreateDepthImageFromPointCloud(pointcloud);

figure;
imshow(image);
title("image")