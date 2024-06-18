clc;
clear; % Clear all variables to avoid conflicts

% Read image
img = imread('C:\Users\virus\Desktop\images\RSAwithBaker\lena.png');

% Get the size of the image
img_size = size(img);

% Display the size of the image
disp(['Size of the image: ', num2str(img_size(1)), ' x ', num2str(img_size(2)), ' x ', num2str(img_size(3))]);
% Display image
figure;
imshow(img);
title('Original Image');

% Calculate histogram for each channel
histogramR = imhist(img(:, :, 1));
histogramG = imhist(img(:, :, 2));
histogramB = imhist(img(:, :, 3));

% Display histogram for each channel
figure;
bar(histogramR, 'r');
title('Histogram of Red Channel for Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

figure;
bar(histogramG, 'g');
title('Histogram of Green Channel for Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

figure;
bar(histogramB, 'b');
title('Histogram of Blue Channel for Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

%%#########################################################################
% Scramble pixels of each channel using chaotic baker map
scrambledR = bakerMap(img(:, :, 1));
scrambledG = bakerMap(img(:, :, 2));
scrambledB = bakerMap(img(:, :, 3));

% Display histogram for each channel
figure;
imshow(scrambledR);
title('Scrambled of Red Channel');

figure;
imshow(scrambledG);
title('Scrambled of Green Channel');

figure;
imshow(scrambledB);
title('Scrambled of Blue Channel');

% 
% % Combine scrambled channels into one image
scrambled = cat(3, scrambledR, scrambledG, scrambledB);
figure;
imshow(scrambled);
title('Scrambled of Image');


% 
% % Display scrambled image size
scrambled_size = size(scrambled);
disp(['Scrambled Size of the image: ', num2str(scrambled_size(1)), ' x ', num2str(scrambled_size(2)), ' x ', num2str(scrambled_size(3))]);
%%########################################################################
% RSA parameters
p = 13;
q = 31;
% Calculate n
n = p * q;
% Calculate Phi
phi = (p - 1) * (q - 1);
% Calculate the value of e
e = find_e(phi);

% Calculate the value of d using the Extended Euclidean Algorithm
d = modInverse(e, phi);
% 
% Display RSA parameters
disp(['The value of (n) is:    ' num2str(n)]);
disp(['The public key (e) is:  ' num2str(e)]);
disp(['The value of Phi(N) is: ' num2str(phi)]);
disp(['The private key (d) is: ' num2str(d)]);

% Convert scrambled channels to double
inputR = double(scrambledR);
inputG = double(scrambledG);
inputB = double(scrambledB);
%%############################################
cipherR = arrayfun(@(x) exponentmod(x, e, n), inputR);
cipherG = arrayfun(@(x) exponentmod(x, e, n), inputG);
cipherB = arrayfun(@(x) exponentmod(x, e, n), inputB);

% %%histogram for encrypted color channel 
cipherR = uint8(mod(cipherR, 256));
cipherG = uint8(mod(cipherG, 256));
cipherB = uint8(mod(cipherB, 256));

histogramR1 = imhist(cipherR);
histogramG1 = imhist(cipherG);
histogramB1 = imhist(cipherB);
% Display histogram for each channel
figure;
bar(histogramR1, 'r');
title('Histogram of Red Channel for Encrypted Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

figure;
bar(histogramG1, 'g');
title('Histogram of Green Channel for Encrypted Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

figure;
bar(histogramB1, 'b');
title('Histogram of Blue Channel for encrypted Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

%############################################


cipher = cat(3, cipherR, cipherG, cipherB);

% % Display the encrypted image
figure;
imshow(uint8(cipher));
title('Encrypted Image');

%% Display encrypted Image Size
chrip_size = size(cipher);
disp([' Size of the Encrypted image: ', num2str(chrip_size(1)), ' x ', num2str(chrip_size(2)), ' x ', num2str(chrip_size(3))]);

%################# save encrypted image
imwrite(cipher, 'C:\Users\virus\Desktop\images\RSAwithBaker\cipher.png');
