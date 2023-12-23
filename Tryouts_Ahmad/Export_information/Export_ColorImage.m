function Export_ColorImage(imColor, output_folder, output_file)
    % Ensure the output folder exists
    if ~exist(output_folder, 'dir')
        mkdir(output_folder);
    end
    
    % Construct the full output file path
    outputColorfile = fullfile(output_folder, output_file);
    
    % Check if the file extension is provided in the output_file
    [~, ~, fileExt] = fileparts(outputColorfile);
    if isempty(fileExt)
        % If no file extension is provided, assume PNG format
        outputColorfile = [outputColorfile, '.png'];
    end
    
    % Save the color image
    imwrite(imColor, outputColorfile);
end