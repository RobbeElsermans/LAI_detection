function [tdist_LAI] = tdist_LAI_calculation(LAI, degrees_of_freedom)
    % Student's t-Distribution for LAI
    tdist_LAI = tpdf(LAI, degrees_of_freedom); % Use degrees of freedom as needed: e.g. 10
end