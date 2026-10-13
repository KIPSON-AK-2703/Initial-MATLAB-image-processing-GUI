# 🖼️ Image Processing & Analysis System

### A MATLAB-Based Image Processing, Enhancement and Object Recognition Application

![MATLAB](https://img.shields.io/badge/MATLAB-R2024b%20or%20compatible-orange)
![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Domain](https://img.shields.io/badge/Domain-Image%20Processing-purple)
![GUI](https://img.shields.io/badge/Interface-App%20Designer-green)
![Status](https://img.shields.io/badge/Project-In%20Development-yellow)

## 📌 1. Project Overview

The **Image Processing & Analysis System** is a MATLAB-based application developed using MATLAB App Designer. It provides a graphical user interface for loading images, processing them with different image-processing algorithms, detecting image edges, identifying segmented regions, and experimenting with AI-based object recognition.

The application combines traditional digital image processing techniques with a pretrained YOLO object detection model. It is intended for students, beginners, and researchers interested in image processing, computer vision, and MATLAB application development.

The system allows users to select an image and apply different operations through GUI buttons instead of entering commands manually.

## 🎯 2. Project Objectives

The main objectives are:

- To develop a user-friendly image-processing application using MATLAB App Designer.
- To load and display digital images.
- To convert color images into grayscale images.
- To improve image contrast and perform histogram equalization.
- To demonstrate image noise addition and noise removal.
- To detect image edges using Sobel, Prewitt, and Canny algorithms.
- To demonstrate basic image segmentation and connected-region detection.
- To integrate pretrained YOLO-based object recognition.
- To calculate image comparison metrics such as MSE, PSNR, and SSIM.
- To measure the execution time of selected processing operations.
- To organize the application and its source files for future development and GitHub collaboration.

## ✨ 3. Features

### 3.1 Image Loading

Allows users to select images from their computer using MATLAB's file-selection dialog.

Supported formats in the current loading callback:

- JPG / JPEG
- PNG
- BMP

### 3.2 Grayscale Conversion

Converts an RGB image into a grayscale image using `rgb2gray`.

Grayscale images simplify many image-processing operations by removing color information.

### 3.3 Image Enhancement

Improves image contrast using MATLAB's `imadjust` function.

This operation can make intensity differences easier to observe, depending on the original image.

### 3.4 Histogram Equalization

Uses `histeq` to redistribute image intensity values and potentially improve contrast.

Histogram equalization can be particularly useful for images with a narrow intensity distribution.

### 3.5 Noise Removal

Demonstrates the following operations:

- Adding salt-and-pepper noise with `imnoise`.
- Removing salt-and-pepper noise using `medfilt2`.
- Exploring Gaussian noise and Gaussian filtering as additional processing options.

Noise-removal performance depends on the noise type, filter parameters, and image characteristics.

### 3.6 Edge Detection

The application demonstrates three traditional edge-detection algorithms.

| Algorithm | MATLAB function | Purpose |
|---|---|---|
| Sobel | `edge(I,'Sobel')` | Detects intensity changes and object boundaries |
| Prewitt | `edge(I,'Prewitt')` | Detects edges using gradient-based operators |
| Canny | `edge(I,'Canny')` | Detects edges using smoothing, gradients, and edge-thresholding techniques |

The algorithms produce different results depending on the image and its contrast.

### 3.7 Basic Object / Region Detection

Uses image segmentation and connected-component analysis to identify foreground regions.

MATLAB functions used include:

- `imbinarize`
- `bwareaopen`
- `bwconncomp`
- `regionprops`
- `rectangle`

Bounding boxes can be drawn around detected regions.

**Important:** This method detects segmented regions, not semantic object categories. It does not reliably recognize objects such as cars, people, or animals by itself.

### 3.8 AI-Based Object Recognition Using YOLO

The project includes an implementation attempt using a pretrained YOLO v4 COCO detector.

The intended functionality is to:

- Detect supported object categories.
- Generate bounding boxes around detected objects.
- Display predicted class labels.
- Display confidence scores.

The implementation uses MATLAB functions such as `yolov4ObjectDetector` and `detect`.

The detector requires compatible MATLAB toolboxes and support packages. Model initialization and detection must be verified in the target MATLAB installation.

### 3.9 Image Quality Analysis

The project includes a quality-analysis callback intended to calculate image comparison metrics.

**Current development status:** The Quality Analysis button and callback are still being debugged and must be tested before this feature is considered complete.

The intended metrics are:

- **MSE — Mean Squared Error:** Measures the average squared pixel difference between two images.
- **PSNR — Peak Signal-to-Noise Ratio:** Measures image error on a logarithmic scale.
- **SSIM — Structural Similarity Index:** Estimates structural similarity between two images.
- **Processing Time:** Measures the execution time of a selected operation.

Meaningful evaluation requires comparing the original image with a corresponding processed image. A higher PSNR or SSIM is not automatically proof of better results for every image-processing task.

## 🛠️ 4. Technologies Used

| Technology | Purpose |
|---|---|
| MATLAB | Image processing and computation |
| MATLAB App Designer | Graphical user interface |
| Image Processing Toolbox | Image enhancement, filtering, segmentation and edge detection |
| Computer Vision Toolbox / compatible support packages | YOLO object detection, depending on the MATLAB release |
| Git | Version control |
| GitHub | Source-code hosting and project documentation |

Toolbox requirements may vary by MATLAB release and by the features enabled in the application.

## 💻 5. System Requirements

### Software requirements

- MATLAB with App Designer support.
- Image Processing Toolbox.
- Compatible computer-vision and deep-learning dependencies for the YOLO feature.
- Git for version control and GitHub uploads.
- Windows, or another MATLAB-supported operating system.

### Hardware requirements

- A computer capable of running the selected MATLAB release.
- Sufficient RAM for MATLAB, image processing, and the selected detection model.
- Available disk space for MATLAB toolboxes, source files, test images, and results.

A dedicated GPU is not necessarily required for the traditional image-processing operations. YOLO execution speed depends on the installed environment and available hardware.

## 📂 6. Project Folder Structure

The proposed repository structure is:

```text
Image-Processing-Analysis-System/
│
├── ImageProcessingAnalysisSystem.mlapp
├── main.m
├── README.md
├── LICENSE
├── .gitignore
│
├── images/
│   ├── input/
│   └── sample/
│
├── algorithms/
│   ├── grayscale.m
│   ├── enhancement.m
│   ├── histogram_equalization.m
│   ├── denoising.m
│   ├── edge_detection.m
│   ├── object_detection.m
│   └── quality_analysis.m
│
├── results/
│   ├── enhanced/
│   ├── denoised/
│   └── edge_detection/
│
└── documentation/
    ├── screenshots/
    └── project_notes.md
```

**Note:** This is a suggested structure. Only include files and folders that actually exist in your repository. The individual `.m` files are optional future refactoring targets if the corresponding algorithms currently live inside the `.mlapp` file.

## ⚙️ 7. Installation and Setup

### Step 1: Clone the repository

Open PowerShell or a terminal and run:

```bash
git clone https://github.com/KIPSON-AK-2703/Initial-MATLAB-image-processing-GUI.git
```

### Step 2: Open the project folder

```bash
cd Initial-MATLAB-image-processing-GUI
```

### Step 3: Open MATLAB

Start MATLAB and navigate to the cloned project directory.

Alternatively, open the `.mlapp` file directly from MATLAB's file browser.

### Step 4: Open the application

Open:

```text
ImageProcessingAnalysisSystem.mlapp
```

### Step 5: Check dependencies

Before using the application, verify that the required MATLAB toolboxes are installed.

To check the Image Processing Toolbox, run:

```matlab
ver
```

To test the availability of the YOLO detector, run:

```matlab
which yolov4ObjectDetector
```

If the detector is unavailable, check the MATLAB release, compatible support packages, and toolbox installation.

## ▶️ 8. How to Run the Application

1. Open `ImageProcessingAnalysisSystem.mlapp` in MATLAB App Designer.
2. Click **Run**.
3. Click **Load Image** and select an image.
4. Confirm that the original image appears in the left axes.
5. Select a processing operation using the corresponding button.
6. Observe the processed result in the right axes.
7. Repeat with other operations to compare their visual effects.

The current interface uses two image axes:

- `OriginalAxes` — displays the input image.
- `ProcessedAxes` — displays the result of the selected operation.

The exact button labels and behavior may change as the GUI is finalized.

## 🧠 9. Algorithms and Technical Background

### 9.1 Grayscale Conversion

A common approximation for converting RGB to grayscale is:

\[
Y = 0.299R + 0.587G + 0.114B
\]

Here, \(R\), \(G\), and \(B\) represent red, green, and blue intensity values.

MATLAB's `rgb2gray` performs the conversion using its supported implementation.

### 9.2 Contrast Enhancement

The `imadjust` function adjusts the intensity range of an image.

It can improve the visibility of features when the original image does not use the available intensity range effectively.

### 9.3 Histogram Equalization

Histogram equalization uses the distribution of pixel intensities to redistribute image values.

The `histeq` function implements histogram equalization for grayscale images.

### 9.4 Median Filtering

A median filter replaces each pixel with the median of the values in a neighborhood.

For a 3 × 3 neighborhood, the filter considers nearby pixels and is often effective against salt-and-pepper noise.

MATLAB function:

```matlab
filteredImage = medfilt2(noisyImage, [3 3]);
```

### 9.5 Edge Detection

Edge detectors estimate locations where image intensity changes significantly.

Sobel and Prewitt use gradient-based operators. Canny includes smoothing and additional edge-selection stages.

Example:

```matlab
edges = edge(grayImage, 'Canny');
```

### 9.6 Connected-Component Analysis

A binary image can contain multiple connected foreground regions.

The `bwconncomp` function identifies connected components, while `regionprops` measures properties such as area and bounding-box coordinates.

This technique works best when the foreground and background can be separated effectively.

### 9.7 YOLO Object Detection

YOLO is a family of object-detection models that predicts object locations and class labels.

In this project, the intended implementation uses a pretrained YOLO v4 COCO detector through MATLAB's supported API.

Detection accuracy depends on the pretrained model, supported categories, image quality, and model configuration.

### 9.8 Image Quality Metrics

For images \(I\) and \(K\), the mean squared error is:

\[
MSE = \frac{1}{MN}
\sum_{i=1}^{M}\sum_{j=1}^{N}
\left(I_{ij}-K_{ij}\right)^2
\]

PSNR is defined as:

\[
PSNR = 10\log_{10}
\left(\frac{MAX_I^2}{MSE}\right)
\]

Here, \(MAX_I\) is the maximum possible pixel value under the selected image representation.

SSIM compares luminance, contrast, and structural information.

For meaningful metric comparisons, the reference and processed images must be appropriately aligned and have compatible dimensions and data representations.

## 📊 10. Expected Results

The application is designed to demonstrate the following outcomes:

| Operation | Expected output |
|---|---|
| Image loading | Original image displayed |
| Grayscale conversion | Grayscale image |
| Contrast enhancement | Image with adjusted contrast |
| Histogram equalization | Image with redistributed intensity values |
| Noise removal | Filtered image |
| Sobel | Sobel edge map |
| Prewitt | Prewitt edge map |
| Canny | Canny edge map |
| Basic object detection | Bounding boxes around segmented regions |
| YOLO recognition | Predicted object labels and bounding boxes, when the detector works |
| Quality analysis | Numerical image-comparison metrics, once the callback is fixed |

Actual results depend on the input image and processing parameters.

## 🧪 11. Testing Plan

Test the application using several types of images.

| Test | Procedure | Expected behavior |
|---|---|---|
| Image loading | Select a supported image | Image appears in OriginalAxes |
| Empty input | Run an operation before loading an image | User receives an appropriate warning |
| Grayscale | Click Grayscale | Grayscale image appears |
| Enhancement | Click Image Enhancement | Adjusted image appears |
| Histogram | Click Histogram Equalization | Equalized image appears |
| Denoising | Click Noise Removal | Filtered image appears |
| Edge detection | Test Sobel, Prewitt and Canny | Corresponding edge map appears |
| Region detection | Test images with contrasting foreground regions | Some segmented regions may be outlined |
| YOLO | Test an image with supported object categories | Detection results appear if dependencies are available |
| Quality analysis | Compare original and processed images | Valid metrics are reported after callback repair |

Do not consider a feature fully tested until it has been run successfully in the target MATLAB environment.

## ⚠️ 12. Limitations

- Image enhancement does not improve every image equally.
- Histogram equalization may over-enhance some images.
- Median filtering can remove fine details along with noise.
- Edge detection is sensitive to image contrast and noise.
- Basic connected-component detection depends on thresholding and segmentation quality.
- Basic segmentation is not equivalent to semantic object recognition.
- YOLO requires compatible dependencies and supports only categories represented by its trained model.
- Quality metrics must be calculated using suitable reference images.
- The Quality Analysis callback remains under development and requires verification.
- Processing time varies with image dimensions, algorithms, MATLAB configuration, and hardware.

## 🚀 13. Future Enhancements

Planned improvements include:

- Fix and verify the Quality Analysis callback.
- Add a Reset/Clear button.
- Improve GUI layout, button labels, and status messages.
- Add an option to select different enhancement and denoising methods.
- Compare multiple edge-detection algorithms in the interface.
- Display histograms before and after enhancement.
- Add a side-by-side original and processed image comparison.
- Export processed images and quality metrics.
- Save analysis results to CSV or Excel.
- Refactor algorithms into reusable MATLAB functions.
- Add automated tests for image-processing operations.
- Improve YOLO error handling and dependency checks.
- Add screenshots and a demonstration video to the repository.

## 📸 14. Screenshots

Add screenshots of your working application to:

```text
documentation/screenshots/
```

Then embed them in this README using relative paths, for example:

```markdown
![Main GUI](documentation/screenshots/main-gui.png)

![Edge Detection](documentation/screenshots/edge-detection.png)

![YOLO Detection](documentation/screenshots/yolo-detection.png)
```

Use your own screenshots from MATLAB. Do not add screenshots for features that have not been verified.

## 🔧 15. Troubleshooting

### Error: Image Processing function is unavailable

Check whether the required toolbox is installed:

```matlab
ver
```

### Error: YOLO detector is unavailable

Check:

```matlab
which yolov4ObjectDetector
```

Install the compatible toolbox and support package if required and available for your MATLAB release.

### Error: No image is loaded

Click **Load Image** before selecting a processing operation.

### Error: App callback is not working

In App Designer, select the relevant button and inspect its `ButtonPushedFcn` property. Confirm that it points to the intended callback function.

### Error: Quality Analysis is not working

Inspect `QualityButtonPushed` and the callback assigned to `QualityButton`. Ensure that the function is connected to the button, its code is inside the correct callback, and its variables are defined within the function.

### Error: Image dimensions do not match

Before calculating image-comparison metrics, make sure both images have compatible dimensions and data representations.

## 📚 16. References

1. MathWorks — MATLAB Documentation: https://www.mathworks.com/help/matlab/
2. MathWorks — Image Processing Toolbox: https://www.mathworks.com/help/images/
3. MathWorks — App Designer: https://www.mathworks.com/help/matlab/app-designer.html
4. MathWorks — Computer Vision Toolbox: https://www.mathworks.com/help/vision/
5. MathWorks — `rgb2gray`: https://www.mathworks.com/help/matlab/ref/rgb2gray.html
6. MathWorks — `imadjust`: https://www.mathworks.com/help/images/ref/imadjust.html
7. MathWorks — `histeq`: https://www.mathworks.com/help/images/ref/histeq.html
8. MathWorks — `edge`: https://www.mathworks.com/help/images/ref/edge.html
9. MathWorks — `medfilt2`: https://www.mathworks.com/help/images/ref/medfilt2.html
10. MathWorks — `ssim`: https://www.mathworks.com/help/images/ref/ssim.html
11. MathWorks — `psnr`: https://www.mathworks.com/help/images/ref/psnr.html

## 👨‍💻 17. Author

**Kipson A. K.**

Electronics and Communication Engineering (ECE)

GitHub: [KIPSON-AK-2703](https://github.com/KIPSON-AK-2703)

Project Repository: [Initial MATLAB Image Processing GUI](https://github.com/KIPSON-AK-2703/Initial-MATLAB-image-processing-GUI)

## 📄 18. License

This project may be distributed under the MIT License if you choose that license. Before using it, add a `LICENSE` file containing the complete MIT License text and your chosen copyright details.

Third-party toolboxes, pretrained models, and support packages remain subject to their own licenses and terms.

## 🏁 Conclusion

The Image Processing & Analysis System demonstrates how MATLAB App Designer can bring traditional image-processing techniques and pretrained object detection into a single graphical application.

The project provides a foundation for further work in digital image processing, computer vision, and GUI-based engineering applications. Its next development priorities are verifying the Quality Analysis callback, improving the user interface, testing each feature, and completing the repository documentation.
