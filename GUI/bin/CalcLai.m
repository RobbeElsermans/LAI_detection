function [Leaf_area_index] = CalcLai(countsInSlices, image_size, green_percent, hidden_leave_factor)
    % Generate the Leaf Area Index by the amount of points in the depth
    % image, the total amount of pixels in the image, the green percentage
    % in the image and the hidden leave factor.
    
    
    % Divide each count by the depth x, y size
    result = countsInSlices / image_size; 
    
    Leaf_area_index = ((2/sum(result,"all"))*hidden_leave_factor*green_percent);

end