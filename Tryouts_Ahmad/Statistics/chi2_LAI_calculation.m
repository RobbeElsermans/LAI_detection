function [chi2_LAI] = chi2_LAI_calculation(normalized_counts, degrees_of_freedom)
    % Chi-Squared Distribution for LAI
    chi2_LAI = chi2pdf(normalized_counts, degrees_of_freedom);
end