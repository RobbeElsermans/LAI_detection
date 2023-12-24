function leafArea = directEstimation(pointCloud, total_pixels_image)
    % Calculate leaf area directly from the point cloud surface area
    
    % Assuming the point cloud represents the leaves only
    
    % Calculate surface area from the point cloud
    normals = pcnormals(pointCloud);
    
    % Calculate the number of normals (points) from the matrix size
    leafSurfaceArea = size(normals, 1);
    
    % Each point in the point cloud contributes to the surface area,
    % hence considering each point as a unit area
    leafArea = leafSurfaceArea/total_pixels_image;
end
