clear; clc;

folders = {'Low_Coverage', 'High_Coverage', 'Medium_Coverage', 'Failed_Coverage'};
threshold = 1.5;  % Adjust threshold as needed
threshold_failed_coverage = 10; % Set the threshold for Failed_Coverage folder

results = cell(length(folders), 7); % To store max, mean for XYZ axes

% Define a cell array to store all tables
allTables = cell(length(folders), 1);

for folderIdx = 1:length(folders)
    folder = folders{folderIdx};
    folderPath = fullfile('..\..\..', folder);  % Path to each folder
    
    [maxXAccelerations, meanXAccelerations, maxYAccelerations, meanYAccelerations, maxZAccelerations, meanZAccelerations] = processBagAcceleration(folderPath);
    
    % Save results for each folder
    results{folderIdx, 1} = folder;
    results{folderIdx, 2} = maxXAccelerations;
    results{folderIdx, 3} = meanXAccelerations;
    results{folderIdx, 4} = maxYAccelerations;
    results{folderIdx, 5} = meanYAccelerations;
    results{folderIdx, 6} = maxZAccelerations;
    results{folderIdx, 7} = meanZAccelerations;

    % Create a table from the results for each folder
    tableData = [maxXAccelerations, meanXAccelerations, maxYAccelerations, meanYAccelerations, maxZAccelerations, meanZAccelerations];
    tableHeaders = {'MaxX', 'MeanX', 'MaxY', 'MeanY', 'MaxZ', 'MeanZ'};
    resultsTable = array2table(tableData, 'VariableNames', tableHeaders);
    
    % Store the table for each folder in the cell array
    allTables{folderIdx} = resultsTable;

    % Display the table for each folder
    disp(resultsTable);
    fprintf("\n");
end

% Write tables to an Excel file
filename = 'acceleration_results2.xlsx'; % Define the filename
for folderIdx = 1:length(folders)
    sheetName = folders{folderIdx}; % Use folder names as sheet names
    writetable(allTables{folderIdx}, filename, 'Sheet', sheetName);
end

fprintf('Tables exported to Excel file: %s\n', filename);
