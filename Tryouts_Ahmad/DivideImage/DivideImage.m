function subImages = DivideImage(image, num_rows, num_cols)
% DivideImage: Divides the input image into subimages arranged row by row.
% This can be a depth image or a color image
% This can be used to calculate the LAI for each subimage apart

    % Get image dimensions
    [rows, cols, ~] = size(image);

    % Calculate size of each subimage
    subimage_height = floor(rows / num_rows);
    subimage_width = floor(cols / num_cols);

    % Initialize cell array to store subimages
    subImages = cell(num_rows, num_cols);

    % Divide the image into subimages row by row
    idx = 1;
    for i = 1:num_rows
        for j = 1:num_cols
            % Calculate subimage boundaries
            start_row = (i - 1) * subimage_height + 1;
            end_row = min(i * subimage_height, rows);
            start_col = (j - 1) * subimage_width + 1;
            end_col = min(j * subimage_width, cols);

            % Extract subimage and assign to the sequence position
            subImages{idx} = image(start_row:end_row, start_col:end_col, :);
            idx = idx + 1;
        end
    end
end
