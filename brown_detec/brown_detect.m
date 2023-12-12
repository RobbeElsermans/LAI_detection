function [mask_a,mask_b] = brown_detect(im,dev)
    % Get image
    im_dev = im / dev;          % Lower values to have a lower effect in later computations
    labpict = rgb2lab(im_dev);  % Turn RGB to LAB values

    % Extract different values
    l = labpict(:,:,1); % Lightintensity (Black = 0 & White = 100)
    a = labpict(:,:,2); % Colorspread A (+max = red & -max = green)
    b = labpict(:,:,3); % Colorspread B (+max = yellow & -max = blue)

    % Default values
    max_a = max(max(a)); mean_a = mean(mean(a));
    max_b = max(max(b)); mean_b = mean(mean(b));

    % Masks
    mask_a = imbinarize(a);
    mask_b = imbinarize(b);
end