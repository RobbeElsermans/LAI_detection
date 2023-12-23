function Export_LAImatrixToCSV(matrix_data, output_folder, output_file)
% Het idee is dat de LAI van de gehele image kan berekend worden, of van
% delen van de image. Je exporteert het dan in zijn geheel naar csv
% Voorbeeld: image is gesneden in 4
% |     |     |
% |  1  |  2  |
%   - - - - - |
% |     |     |
% |  3  |  4  |

% matrix_data is dan een matrix met LAI's: het is dan [calculate_LAI(1) calculate_LAI(2) ;
%                                                      calculate_LAI(3) calculate_LAI(4)]
% In excel staat het dan in een tabel 2x2

    % Ensure the output folder exists
    if ~exist(output_folder, 'dir')
        mkdir(output_folder);
    end
    
    % Construct the full output file path
    outputCSVfile = fullfile(output_folder, output_file);
    
    % Check if the file extension is provided in the output_file
    [~, ~, fileExt] = fileparts(outputCSVfile);
    if ~strcmpi(fileExt, '.csv')
        % If no .csv extension is provided, assume .csv format
        outputCSVfile = [outputCSVfile, '.csv'];
    end
    
    % Write the matrix data to a CSV file
    %csvwrite(outputCSVfile, matrix_data);
    writematrix(matrix_data, outputCSVfile, 'Delimiter','semi');
end
