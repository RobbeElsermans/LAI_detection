clear; clc;

folders = {'Low_Coverage', 'High_Coverage', 'Medium_Coverage', 'Failed_Coverage'};
threshold = 1.5;  % Adjust threshold as needed

results = cell(length(folders), 3);

for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    folderPath = fullfile('..\..\..', folder);  % Path to each folder
    
    % Get all bag files in the folder
    bagFiles = dir(fullfile(folderPath, '*.bag'));
    
    % Initialize arrays to store results
    meanXAccelerations = zeros(length(bagFiles), 1);
    motionStatus = cell(length(bagFiles), 1);
    
    % Process each bag file in the folder
    for fileIdx = 1:length(bagFiles)
        curBag = rosbag(fullfile(folderPath, bagFiles(fileIdx).name));
        curSelAcc = select(curBag, 'Topic', '/device_0/sensor_2/Accel_0/imu/data');
        allImAcc = readMessages(curSelAcc, 'DataFormat', 'struct');
        
        % Extract X-directional accelerations
        xAccelerations = zeros(length(allImAcc), 1);
        for i = 1:length(allImAcc)
            xAccelerations(i) = allImAcc{i}.LinearAcceleration.X;
        end
        
        % Check if X-directional acceleration exceeds the threshold
        if any(xAccelerations > threshold)
            motionStatus{fileIdx} = 'Moving too fast: Bad photo (Depth image not useful)';
        else
            motionStatus{fileIdx} = 'Motion within threshold: Good photo (Depth image likely useful)';
        end
        
        % Calculate the mean of xAccelerations, excluding NaN values
        meanXAccelerations(fileIdx) = mean(xAccelerations, 'omitnan');
        
        % Display results for each file
        fprintf("File: %s, Mean X-Acceleration: %.4f\n", bagFiles(fileIdx).name, meanXAccelerations(fileIdx));
    end
    
    % Save results for each folder
    results{folderIdx, 1} = folder;
    results{folderIdx, 2} = meanXAccelerations;
    results{folderIdx, 3} = motionStatus;
end

% Display average mean X-Accelerations for each folder
fprintf("Average Mean X-Acceleration:\n");
for folderIdx = 1:length(folders)
    meanXAccs = results{folderIdx, 2};
    validMeanXAccs = meanXAccs(~isnan(meanXAccs));
    averageMeanXAcc = mean(validMeanXAccs);
    numValidSamples = numel(validMeanXAccs);
    
    fprintf("%s: Average = %.4f, Valid Samples = %d/%d\n", folders{folderIdx}, averageMeanXAcc, numValidSamples, numel(meanXAccs));
end

% Compare mean X-Accelerations between folders
% You can perform additional statistical tests or comparisons here
