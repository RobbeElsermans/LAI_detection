function [poisson_LAI] = poisson_LAI_calculation(LAI, lambda)
    % Poisson Distribution for LAI
    poisson_LAI = poisspdf(LAI, lambda);
end