clear; clc;

folders = {'Low_Coverage', 'High_Coverage', 'Medium_Coverage', 'Failed_Coverage'};
threshold = 1.5;  % Adjust threshold as needed

results = cell(length(folders), 2);

for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    folderPath = fullfile('..\..\..', folder);  % Path to each folder
    
    % Get all bag files in the folder
    bagFiles = dir(fullfile(folderPath, '*.bag'));
    
    % Initialize arrays to store results
    meanAccelerations = zeros(length(bagFiles), 3);
    motionStatus = cell(length(bagFiles), 1);
    
    % Process each bag file in the folder
    for fileIdx = 1:length(bagFiles)
        curBag = rosbag(fullfile(folderPath, bagFiles(fileIdx).name));
        curSelAcc = select(curBag, 'Topic', '/device_0/sensor_2/Accel_0/imu/data');
        allImAcc = readMessages(curSelAcc, 'DataFormat', 'struct');
        
        % Extract X, Y, Z-directional accelerations
        accelerations = zeros(length(allImAcc), 3);
        for i = 1:length(allImAcc)
            accelerations(i, 1) = allImAcc{i}.LinearAcceleration.X;
            accelerations(i, 2) = allImAcc{i}.LinearAcceleration.Y;
            accelerations(i, 3) = allImAcc{i}.LinearAcceleration.Z;
        end
        
        % Calculate the mean of X, Y, Z accelerations
        meanAccelerations(fileIdx, :) = mean(accelerations);
        
        % Check if any component exceeds the threshold
        exceedsThreshold = any(abs(meanAccelerations(fileIdx, :)) > threshold);
        if exceedsThreshold
            motionStatus{fileIdx} = 'Moving too fast: Bad photo (Depth image not useful)';
        else
            motionStatus{fileIdx} = 'Motion within threshold: Good photo (Depth image likely useful)';
        end
        
        % Display results for each file
        fprintf("File: %s, Mean Accelerations (X Y Z): %.4f %.4f %.4f\n", bagFiles(fileIdx).name, meanAccelerations(fileIdx, 1), meanAccelerations(fileIdx, 2), meanAccelerations(fileIdx, 3));
    end
    
    % Save results for each folder
    results{folderIdx, 1} = folder;
    results{folderIdx, 2} = {meanAccelerations, motionStatus}; % Store as a cell array
end

% Display average mean accelerations for each folder
fprintf("Average Mean Accelerations (X Y Z):\n");
for folderIdx = 1:length(folders)
    meanAccs = results{folderIdx, 2}{1}; % Accessing meanAccelerations
    meanX = mean(meanAccs(:, 1), 'omitnan');
    meanY = mean(meanAccs(:, 2), 'omitnan');
    meanZ = mean(meanAccs(:, 3), 'omitnan');
    
    fprintf("%s: %.4f %.4f %.4f\n", folders{folderIdx}, meanX, meanY, meanZ);
end

% Compare mean accelerations between folders
% You can perform additional statistical tests or comparisons here
