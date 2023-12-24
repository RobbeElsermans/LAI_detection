function [intensity_image] = CreateDepthImageFromPointCloud(pointCloud)
    % Extract the numeric point cloud data
    xyzPoints = pointCloud.Location;
    
    % Bereken de grootte van de point cloud in x-, y- en z-richting
    x_range = range(xyzPoints(:, 1));
    y_range = range(xyzPoints(:, 2));
    
    % Bepaal de resolutie van de afbeelding (kan worden aangepast naar behoefte)
    resolution = 500;
    
    % Maak een lege afbeelding met de gewenste resolutie
    intensity_image = zeros(resolution, resolution);
    
    % Schaal de x- en y-coördinaten naar de resolutie van de afbeelding
    x_scaled = round((xyzPoints(:, 1) - min(xyzPoints(:, 1))) / x_range * (resolution - 1)) + 1;
    y_scaled = round((xyzPoints(:, 2) - min(xyzPoints(:, 2))) / y_range * (resolution - 1)) + 1;
    
    % Stel de intensiteit van elk pixel in op basis van de z-waarde van de punten
    for i = 1:size(xyzPoints, 1)
        intensity_image(y_scaled(i), x_scaled(i)) = xyzPoints(i, 3);
    end
end
