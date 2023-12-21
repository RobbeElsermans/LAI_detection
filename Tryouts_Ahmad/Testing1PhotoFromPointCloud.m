pointcloud = pcread("..\..\PLY files\LC_20231130_145915.ply");
% pointcloud = pcread("..\Low_Coverage\LC_20231130_145915.ply");

cleancloud = NormalizeAndCleanPointCloudNormal(pointcloud);

pcshow(cleancloud)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Point Cloud');

% Set the view to look down on the XY plane
view(0, 90); % Azimuth angle of 0 degrees, elevation angle of 90 degrees

% Capture the figure as an image
frame = getframe(gcf);
im = frame.cdata;

% Display the resulting image
figure;
imshow(im);
title('Image from Point Cloud (Top View)');