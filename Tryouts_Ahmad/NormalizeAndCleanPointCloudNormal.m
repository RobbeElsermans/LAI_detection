function [cleancloud] = NormalizeAndCleanPointCloudNormal(pointcloud)
    %pointcloud = pcread(filepaths{i}));
    % clean up the pointcloud by setting the distance to an overestimation of the approximate distance to the wall
    % such that only actual outliers are removed
    [model, inlierIndices, outlierIndices] = pcfitplane(pointcloud,2);
    cleancloud = select(pointcloud, inlierIndices);
    % figure;
    % pcshow(cleancloud);
    % title("cleancloud 1")
    % xlabel("x")
    % ylabel("y")
    % zlabel("z")
    % % normalVector = sum(cleancloud.Normal);
    % % 
    % % tform = normalRotation(model, [0 0 1]);
    % % 
    % % cleancloud = pctransform(cleancloud,tform);
end

