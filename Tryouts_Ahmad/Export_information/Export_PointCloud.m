function Export_PointCloud(point_cloud, output_folder, output_file)
    % Ensure the output folder exists
    if ~exist(output_folder, 'dir')
        mkdir(output_folder);
    end
    
    % Construct the full output file path
    outputPLYfile = fullfile(output_folder, output_file);
    
    % Check if the file extension is provided in the output_file
    [~, ~, fileExt] = fileparts(outputPLYfile);
    if ~strcmpi(fileExt, '.ply')
        % If no .ply extension is provided, assume .ply format
        outputPLYfile = [outputPLYfile, '.ply'];
    end
    
    % Save the point cloud as a .ply file
    pcwrite(point_cloud, outputPLYfile);
end
