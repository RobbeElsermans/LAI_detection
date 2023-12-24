function [maxXAccelerations, meanXAccelerations, maxYAccelerations, meanYAccelerations, maxZAccelerations, meanZAccelerations] = processBagAcceleration(folderPath)
    bagFiles = dir(fullfile(folderPath, '*.bag'));

    maxXAccelerations = zeros(length(bagFiles), 1);
    meanXAccelerations = zeros(length(bagFiles), 1);
    maxYAccelerations = zeros(length(bagFiles), 1);
    meanYAccelerations = zeros(length(bagFiles), 1);
    maxZAccelerations = zeros(length(bagFiles), 1);
    meanZAccelerations = zeros(length(bagFiles), 1);

    % Process each bag file in the folder
    for fileIdx = 1:length(bagFiles)
        curBag = rosbag(fullfile(folderPath, bagFiles(fileIdx).name));
        curSelAcc = select(curBag, 'Topic', '/device_0/sensor_2/Accel_0/imu/data');
        allImAcc = readMessages(curSelAcc, 'DataFormat', 'struct');
        
        % Extract accelerations in X, Y, and Z directions
        xAccelerations = zeros(length(allImAcc), 1);
        yAccelerations = zeros(length(allImAcc), 1);
        zAccelerations = zeros(length(allImAcc), 1);
        for i = 1:length(allImAcc)
            xAccelerations(i) = abs(allImAcc{i}.LinearAcceleration.X);
            yAccelerations(i) = abs(allImAcc{i}.LinearAcceleration.Y);
            zAccelerations(i) = abs(allImAcc{i}.LinearAcceleration.Z);
        end
        
        % Calculate max and mean of accelerations in X, Y, and Z directions
        if ~isempty(xAccelerations)
            maxXAccelerations(fileIdx) = max(xAccelerations);
            meanXAccelerations(fileIdx) = mean(xAccelerations, 'omitnan');
        end
        
        if ~isempty(yAccelerations)
            maxYAccelerations(fileIdx) = max(yAccelerations);
            meanYAccelerations(fileIdx) = mean(yAccelerations, 'omitnan');
        end
        
        if ~isempty(zAccelerations)
            maxZAccelerations(fileIdx) = max(zAccelerations);
            meanZAccelerations(fileIdx) = mean(zAccelerations, 'omitnan');
        end
    end
end
