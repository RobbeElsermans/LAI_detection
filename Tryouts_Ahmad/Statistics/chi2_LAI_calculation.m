function [chi2_LAI] = chi2_LAI_calculation(LAI, degrees_of_freedom)
    % Chi-Squared Distribution for LAI
    chi2_LAI = chi2pdf(LAI, degrees_of_freedom);
end