
%% Load an image frame:
    curBag = rosbag('HC_20231130_143832.bag')
    curTopics = curBag.AvailableTopics.Properties.RowNames;
    curSelColor = select(curBag,'Topic','/device_0/sensor_1/Color_0/image/data');
    allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
    imColor = rosReadImage(allImColor{1});
    
    
    imColorHSV = rgb2hsv( double( imColor ) );


%% Ask the user to select the color area
    figure
        imshow(imColor)
        %imhist(imColorHSV(:,:,1))
        roi = imrect; % User draws a rectangle on the image
        positionInImage = wait(roi); % Wait for the user to double-click inside the rectangle

    
    selectedRegion = imcrop( imColorHSV, positionInImage);
    dataH = selectedRegion( :, :, 1 );
    dataS = selectedRegion( :, :, 2 );
    dataHS = [dataH(:) dataS(:) ];


%% Fit a Gaussian Mixture Model and show that model
    numComponents = 5;
    gmm = fitgmdist(dataHS,numComponents); % Fitting GMM to data
    
    
    figure; plot( dataHS(:,1), dataHS(:,2 ),'.' )
    % Plotting GMM component means
    
    hold on
    scatter( gmm.mu(:, 1), gmm.mu(:, 2), 100, 'r', 'filled');
    
    % Plotting GMM contours
    h = ezcontour(@(x, y)pdf(gmm, [x, y]), [min(dataHS(:, 1)), max(dataHS(:, 1)), min(dataHS(:, 2)), max(dataHS(:, 2))]);
    h.LevelList = linspace(0, max(h.LevelList), 20);
    colormap(jet(20));
    colorbar;
    title('Gaussian Mixture Model');
    xlabel('X-axis');
    ylabel('Y-axis');
    hold off;

%% Now infer an image to see whether it is leaf or no leaf.

    dataFullImageH = squeeze(imColorHSV( :,:,1 ));
    dataFullImageS = squeeze(imColorHSV( :,:,2 ));
    dataFullImageHS = [dataFullImageH(:), dataFullImageS(:)];
    likelihood = pdf(gmm,dataFullImageHS );
    
    figure; 
        imagesc( reshape( likelihood, size( imColorHSV, [1 2] ) ) )
    figure; 
        imagesc( reshape( likelihood, size( imColorHSV, [1 2] ) ) > 5)
        
