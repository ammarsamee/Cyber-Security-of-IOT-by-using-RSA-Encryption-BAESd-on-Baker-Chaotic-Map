% Load the original and encrypted Lena images
original_lena = imread('C:\Users\virus\Desktop\images\lena.png'); % Make sure lena.png is in your current directory
encrypted_lena = imread('C:\Users\virus\Desktop\images\cipher.png'); % Replace with your encrypted Lena image file

% Convert images to grayscale if they are not already
if size(original_lena, 3) == 3
    original_lena = rgb2gray(original_lena);
end
if size(encrypted_lena, 3) == 3
    encrypted_lena = rgb2gray(encrypted_lena);
end

% Compute the histogram of each image
original_hist = imhist(original_lena);
encrypted_hist = imhist(encrypted_lena);

% Normalize the histograms to get probability distributions
original_hist = original_hist / numel(original_lena);
encrypted_hist = encrypted_hist / numel(encrypted_lena);

% Expected uniform distribution
expected_prob = ones(256, 1) / 256;

% Compute Chi-Square statistic for original Lena
chi_square_original = sum((original_hist - expected_prob).^2 ./ expected_prob);

% Compute Chi-Square statistic for encrypted Lena
chi_square_encrypted = sum((encrypted_hist - expected_prob).^2 ./ expected_prob);

% Display the results
fprintf('Chi-Square Statistic for Original Lena: %f\n', chi_square_original);
fprintf('Chi-Square Statistic for Encrypted Lena: %f\n', chi_square_encrypted);

% Plot the histograms for visual comparison
figure;
subplot(2, 1, 1);
bar(original_hist);
title('Histogram of Original Lena');
xlabel('Intensity Value');
ylabel('Probability');

subplot(2, 1, 2);
bar(encrypted_hist);
title('Histogram of Encrypted Lena');
xlabel('Intensity Value');
ylabel('Probability');

