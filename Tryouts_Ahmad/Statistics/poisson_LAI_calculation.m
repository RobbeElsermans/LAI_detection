function [poisson_LAI] = poisson_LAI_calculation(normalized_counts, lambda)
    % Poisson Distribution for LAI
    poisson_LAI = poisspdf(normalized_counts, lambda);
end