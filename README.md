## Batch-enhance-CBZ
# Overview
This project provides a batch script for processing comic book archive (CBZ) files using the Enhanced Super Resolution Generative Adversarial Network (ESRGAN). The script extracts images from CBZ files, enhances them using a specified ESRGAN model, and then re-packages the enhanced images back into new CBZ files.

# Features
   - Batch processing of multiple CBZ files.
   - Utilizes ESRGAN for image enhancement.
   - Automatically manages input, output, and result directories.
   - Compatible with 7-Zip for file extraction and compression.
# Requirements
 - Windows Operating System
 - 7-Zip: Make sure to install 7-Zip in "C:\Program Files\7-Zip\7z.exe" and have in the Edit Environment Variables, cthe path to the 7-Zip installation directory, google how to do this if needed, straightforward process.
 - ESRGAN: Clone or download the ESRGAN repository
 - Have this bat in the
 - The following directory structure:
ESRGAN_April_2022       # Folder containing the ESRGAN executables
│
├── inputcbz               # Folder containing the CBZ files to process (name must match)
│   └── your_comics.cbz
│
├── process_cbz.bat
│
├── realesrgan-ncnn-vulkan.exe
├── UPSCALE_animevideov3_x2.bat
├── others
│
├── input                    # Folder for extracted images (cleared after each processing)
│
├── output                   # Folder for enhanced images (cleared after each processing)
│
└── RESULTS                  # Folder for storing processed CBZ files

# Usage
 - Double-click process_cbz.bat
# Acknowledgements
ESRGAN - The Enhanced Super Resolution Generative Adversarial Network used for image enhancement https://github.com/xinntao/Real-ESRGAN
7-Zip - Used for file extraction and compression.
