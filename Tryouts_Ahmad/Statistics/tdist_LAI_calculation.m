function [tdist_LAI] = tdist_LAI_calculation(normalized_counts, degrees_of_freedom)
    % Student's t-Distribution for LAI
    tdist_LAI = tpdf(normalized_counts, degrees_of_freedom); % Use degrees of freedom as needed: e.g. 10
end