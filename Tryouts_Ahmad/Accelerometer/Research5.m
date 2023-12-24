clear; clc;
% Load necessary libraries for Gaussian fitting
if verLessThan('matlab', '9.8')
    error('MATLAB version R2020a or later is required for this example.')
end

folders = {'Low_Coverage', 'High_Coverage', 'Medium_Coverage', 'Failed_Coverage'};
threshold = 1.5;  % Adjust threshold as needed

results = cell(length(folders), 6); % To store max, mean, median, Gaussian fit parameters

for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    folderPath = fullfile('..\..\..', folder);  % Path to each folder
    
    % Get all bag files in the folder
    bagFiles = dir(fullfile(folderPath, '*.bag'));
    
    % Initialize cell arrays to store varying lengths of results
    maxXAccelerations = cell(length(bagFiles), 1);
    motionStatus = cell(length(bagFiles), 1);
    meanXAccelerations = zeros(length(bagFiles), 1);
    medianXAccelerations = zeros(length(bagFiles), 1);
    gaussMean = zeros(length(bagFiles), 1);
    gaussVar = zeros(length(bagFiles), 1);
    
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
        
        % Calculate max, mean, and median of xAccelerations
        maxXAccelerations{fileIdx} = max(xAccelerations);
        meanXAccelerations(fileIdx) = mean(xAccelerations, 'omitnan');
        medianXAccelerations(fileIdx) = median(xAccelerations, 'omitnan');
        
        % Fit Gaussian model if enough data is available
        if numel(xAccelerations) >= 2 % Check if there is enough data for fitting
            pd = fitdist(xAccelerations, 'Normal');
            gaussMean(fileIdx) = pd.mu;
            gaussVar(fileIdx) = pd.sigma^2;
        else
            gaussMean(fileIdx) = NaN; % No enough data for fitting
            gaussVar(fileIdx) = NaN;
        end
        
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
    results{folderIdx, 3} = meanXAccelerations;
    results{folderIdx, 4} = medianXAccelerations;
    results{folderIdx, 5} = gaussMean;
    results{folderIdx, 6} = gaussVar;
end

% Display results
fprintf("Statistics for X-Accelerations:\n");
for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    fprintf("Folder: %s\n", folder);
    fprintf("Max: Mean: Median: GaussianMean: GaussianVariance\n");
    
    for fileIdx = 1:numel(results{folderIdx, 2})
        fprintf("%.4f\t%.4f\t%.4f\t%.4f\t%.4f\n", results{folderIdx, 2}{fileIdx}, results{folderIdx, 3}(fileIdx), ...
                results{folderIdx, 4}(fileIdx), results{folderIdx, 5}(fileIdx), results{folderIdx, 6}(fileIdx));
    end
    
    fprintf("\n");
end
