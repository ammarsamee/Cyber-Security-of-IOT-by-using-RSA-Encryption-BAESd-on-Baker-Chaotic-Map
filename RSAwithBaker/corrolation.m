% Load the original and encrypted images
originalImage = imread('C:\Users\virus\Desktop\images\baboon.png'); % Replace with your image file
encryptedImage = imread('C:\Users\virus\Desktop\images\cipher.png'); % Replace with your image file

% Ensure the images are grayscale for simplicity
if size(originalImage, 3) == 3
    originalImage = rgb2gray(originalImage);
end
if size(encryptedImage, 3) == 3
    encryptedImage = rgb2gray(encryptedImage);
end

% Calculate correlations for original image
corrHorOriginal = calculate_correlation(originalImage, 'horizontal');
corrVerOriginal = calculate_correlation(originalImage, 'vertical');

% Calculate correlations for encrypted image
corrHorEncrypted = calculate_correlation(encryptedImage, 'horizontal');
corrVerEncrypted = calculate_correlation(encryptedImage, 'vertical');

% Display results
fprintf('Correlation between adjacent pixels in the original image:\n');
fprintf('Horizontal: %.4f\n', corrHorOriginal);
fprintf('Vertical: %.4f\n', corrVerOriginal);

fprintf('Correlation between adjacent pixels in the encrypted image:\n');
fprintf('Horizontal: %.4f\n', corrHorEncrypted);
fprintf('Vertical: %.4f\n', corrVerEncrypted);

% Function to calculate correlation between adjacent pixels
function corrValue = calculate_correlation(image, direction)
    [rows, cols] = size(image);
    if strcmp(direction, 'horizontal')
        x = image(:, 1:cols-1);
        y = image(:, 2:cols);
    elseif strcmp(direction, 'vertical')
        x = image(1:rows-1, :);
        y = image(2:rows, :);
    else
        error('Invalid direction. Use "horizontal" or "vertical".');
    end
    
    x = double(x(:));
    y = double(y(:));
    
    % Calculate correlation coefficient
    corrValue = corr(x, y);
end
