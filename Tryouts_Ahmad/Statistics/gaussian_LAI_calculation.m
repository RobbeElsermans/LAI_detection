function [gaussian_LAI] = gaussian_LAI_calculation(normalized_counts)
    % Gaussian Distribution Fitting for LAI
    pd = fitdist(normalized_counts, 'Normal');
    mu = pd.mu;
    sigma = pd.sigma;
    gaussian_LAI = normpdf(mu, sigma);
end