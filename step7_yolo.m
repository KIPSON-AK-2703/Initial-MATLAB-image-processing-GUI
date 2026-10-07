clc;
clear;
close all;

%% STEP 7 - YOLO OBJECT RECOGNITION

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

%% Load pretrained YOLO v4 detector

detector = yolov4ObjectDetector("tiny-yolov4-coco");

%% Detect objects

[bboxes, scores, labels] = detect(detector, I);

%% Display detections

figure;

imshow(I);
title('YOLO Object Detection');

if ~isempty(bboxes)

    annotations = strings(size(labels));

    for i = 1:length(labels)

        annotations(i) = sprintf( ...
            '%s: %.2f', ...
            string(labels(i)), ...
            scores(i));

    end

    detectedImage = insertObjectAnnotation( ...
        I, ...
        'rectangle', ...
        bboxes, ...
        cellstr(annotations));

    imshow(detectedImage);
    title('YOLO Object Recognition');

else

    disp('No objects detected.');
end

%% Display results in Command Window

fprintf('\n====================================\n');
fprintf('YOLO OBJECT RECOGNITION\n');
fprintf('====================================\n');

fprintf('Number of detected objects: %d\n', length(labels));

for i = 1:length(labels)

    fprintf( ...
        'Object %d: %s | Confidence: %.2f\n', ...
        i, ...
        string(labels(i)), ...
        scores(i));

end