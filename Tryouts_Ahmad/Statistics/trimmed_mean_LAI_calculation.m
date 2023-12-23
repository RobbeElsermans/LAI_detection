function [trimmed_mean_LAI] = trimmed_mean_LAI_calculation(normalized_counts, percentage_outliers)
    % Robust Estimation with Trimmed Mean (e.g., Trimmed Mean of 10% outliers)
    trimmed_mean_LAI = trimmean(normalized_counts, percentage_outliers);
end