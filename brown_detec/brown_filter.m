function [brown_filter] = brown_filter(path, l_div, c_mul)
    [im, depth] = bag_parser(path);

    lchpict = applycform(rgb2lab(im/13),makecform('lab2lch'));
    l = lchpict(:,:,1); c = lchpict(:,:,2);

    mask_l = l(:,:) > mean(mean(l))/(l_div/100);
    mask_c = c(:,:) < mean(mean(l))*(c_mul/100);

    mask = logical(mod(mask_l .* mask_c,2));
    mask_rgb = mask; mask_rgb(:,:,2) = mask; mask_rgb(:,:,3) = mask;
    brown_filter = im; brown_filter(mask) = 0;
end