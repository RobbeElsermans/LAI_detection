function [gaussian_LAI] = gaussian_LAI_calculation(LAI)
    % Gaussian Distribution Fitting for LAI
    pd = fitdist(LAI, 'Normal');
    mu = pd.mu;
    sigma = pd.sigma;
    gaussian_LAI = normpdf(mu, sigma);
end