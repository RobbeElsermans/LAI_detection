clear; clc;

folders = {'Low_Coverage', 'High_Coverage', 'Medium_Coverage', 'Failed_Coverage'};
threshold = 1.5;  % Adjust threshold as needed

results = cell(length(folders), 3);

for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    folderPath = fullfile('..\..\..', folder);  % Path to each folder
    
    % Get all bag files in the folder
    bagFiles = dir(fullfile(folderPath, '*.bag'));
    
    % Initialize cell arrays to store varying lengths of results
    maxXAccelerations = cell(length(bagFiles), 1);
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
        
        % Calculate the maximum of xAccelerations and store in cell array
        maxXAccelerations{fileIdx} = max(xAccelerations);
        
        % Check if the maximum X-directional acceleration exceeds the threshold
        if maxXAccelerations{fileIdx} > threshold
            motionStatus{fileIdx} = 'Moving too fast: Bad photo (Depth image not useful)';
        else
            motionStatus{fileIdx} = 'Motion within threshold: Good photo (Depth image likely useful)';
        end
        
        % Display results for each file
        fprintf("File: %s, Max X-Acceleration: %.4f\n", bagFiles(fileIdx).name, maxXAccelerations{fileIdx});
    end
    
    % Save results for each folder
    results{folderIdx, 1} = folder;
    results{folderIdx, 2} = maxXAccelerations;
    results{folderIdx, 3} = motionStatus;
end

% Display maximum X-Accelerations for each folder
fprintf("Maximum X-Acceleration:\n");
for folderIdx = 1:length(folders)
    maxAccs = results{folderIdx, 2};
    validMaxAccs = cellfun(@(x) x(~isnan(x)), maxAccs, 'UniformOutput', false);
    validMaxAccs = [validMaxAccs{:}];
    averageMaxAcc = mean(validMaxAccs);
    numValidSamples = numel(validMaxAccs);
    
    fprintf("%s: Average Max X-Acceleration = %.4f, Valid Samples = %d/%d\n", folders{folderIdx}, averageMaxAcc, numValidSamples, numel(maxAccs));
end

% Compare maximum X-Accelerations between folders
% You can perform additional statistical tests or comparisons here
