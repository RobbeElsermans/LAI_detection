clear
close all
clc

addpath GUI\bin\

%pointcloud = pcread("..\..\PLY files\LC_20231130_145915.ply");
pointcloud = pcread("Low_Coverage\LC_20231130_145915.ply");

figure;
pcshow(pointcloud);
title("3D beeld")

% Roep de functie aan om de point cloud als grayscale afbeelding te visualiseren
image = CreateDepthImageFromPointCloud(pointcloud);

figure;
imshow(image);
title("image")

image(image == 0) = NaN;    % remove 0
image = image+abs(min(min(image))); % bring to 0
inputImage = image/max(max(image)); % normalize to 1

numRows = 5; % Replace with the number of rows for subimages
numCols = 5; % Replace with the number of columns for subimages

figure;
imshow(inputImage);
title("image")
figure;

resultingSubImages = DivideImage(inputImage, numRows, numCols);

for i=1:numCols*numRows
    subplot(numRows,numCols,i)
    imshow(resultingSubImages{i})
end
