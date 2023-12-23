clear;clc;clf;
% Example usage:
inputImage = imread('baboon.jpg'); % Replace with your image path
numRows = 5; % Replace with the number of rows for subimages
numCols = 5; % Replace with the number of columns for subimages

resultingSubImages = DivideImage(inputImage, numRows, numCols);


for i=1:numCols*numRows
    subplot(numRows,numCols,i)
    imshow(resultingSubImages{i})
end

