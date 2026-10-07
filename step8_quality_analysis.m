clc;
clear;
close all;

%% STEP 8 - IMAGE QUALITY ANALYSIS

% Select image
[file, path] = uigetfile( ...
    {'*.jpg;*.jpeg;*.png;*.bmp', 'Image Files'}, ...
    'Select an Image');

if isequal(file, 0)
    disp('No image selected.');
    return;
end

% Read image
I = imread(fullfile(path, file));

% Convert to grayscale
if size(I, 3) == 3
    grayImage = rgb2gray(I);
else
    grayImage = I;
end

%% Add Gaussian noise

noisyImage = imnoise(grayImage, 'gaussian', 0, 0.01);

%% Start timing

tic;

% Apply Gaussian filter
filteredImage = imgaussfilt(noisyImage, 1);

processingTime = toc;

%% Calculate MSE

mseValue = immse(filteredImage, grayImage);

%% Calculate PSNR

psnrValue = psnr(filteredImage, grayImage);

%% Calculate SSIM

ssimValue = ssim(filteredImage, grayImage);

%% Display results

figure;

subplot(1,3,1);
imshow(grayImage);
title('Original');

subplot(1,3,2);
imshow(noisyImage);
title('Noisy');

subplot(1,3,3);
imshow(filteredImage);
title('Filtered');

%% Display numerical results

fprintf('\n====================================\n');
fprintf('IMAGE QUALITY ANALYSIS\n');
fprintf('====================================\n');

fprintf('MSE              : %.4f\n', mseValue);
fprintf('PSNR             : %.2f dB\n', psnrValue);
fprintf('SSIM             : %.4f\n', ssimValue);
fprintf('Processing Time  : %.6f seconds\n', processingTime);

fprintf('====================================\n');