function [trimmed_mean_LAI] = trimmed_mean_LAI_calculation(LAI, percentage_outliers)
    % Robust Estimation with Trimmed Mean (e.g., Trimmed Mean of 10% outliers)
    trimmed_mean_LAI = trimmean(LAI, percentage_outliers);
end