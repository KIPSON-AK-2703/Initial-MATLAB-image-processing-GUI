clc;
clear;
close all;

%% STEP 6 - OBJECT DETECTION

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

%% 1. Improve image

enhancedImage = imadjust(grayImage);

%% 2. Create binary image

binaryImage = imbinarize(enhancedImage);

%% 3. Remove small unwanted regions

binaryImage = bwareaopen(binaryImage, 100);

%% 4. Find connected components

connectedObjects = bwconncomp(binaryImage);

%% 5. Measure objects

objectProperties = regionprops( ...
    connectedObjects, ...
    'BoundingBox', ...
    'Area', ...
    'Centroid');

%% 6. Display original image

figure;

imshow(I);
title('Object Detection');

hold on;

objectCount = 0;

%% 7. Draw bounding boxes

for k = 1:length(objectProperties)

    area = objectProperties(k).Area;

    % Ignore very small regions
    if area > 500

        rectangle( ...
            'Position', objectProperties(k).BoundingBox, ...
            'EdgeColor', 'r', ...
            'LineWidth', 2);

        % Get centroid
        centroid = objectProperties(k).Centroid;

        objectCount = objectCount + 1;

        text( ...
            centroid(1), ...
            centroid(2), ...
            sprintf('Object %d', objectCount), ...
            'Color', 'y', ...
            'FontSize', 10, ...
            'FontWeight', 'bold');

    end
end

hold off;

%% Display object count

fprintf('\n====================================\n');
fprintf('OBJECT DETECTION ANALYSIS\n');
fprintf('====================================\n');

fprintf('Detected objects/regions: %d\n', objectCount);

%% Save result

if ~exist('results', 'dir')
    mkdir('results');
end

frame = getframe(gca);

outputImage = frame2im(frame);

imwrite(outputImage, ...
    'results/object_detection.png');

fprintf('Object detection result saved.\n');