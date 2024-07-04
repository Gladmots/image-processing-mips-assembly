##Image Processing in MIPS Assembly
This assignment consists of two MIPS assembly programs that involves image processing tasks with .ppm images. The first program, increase_brightness.asm, increases the brightness of a color image, and the second program, greyscale.asm, converts a color image to greyscale.

##Table of Contents
Introduction
Files stored
requirement
Usage
Program Explanations
Author

##Introduction
Image processing involves the manipulation of images, and in this project, we focus on PPM images. Each program in this project is designed to work with 64x64 pixel PPM images with specific header formats. The programs open, read, process, and save images, and display relevant information such as average pixel values.

##Files stored
####increase_brightness.asm
####sample_images folder
####myrepo containing log.txt (git log)
####greyscale.asm
####greycale_output.txt
####increase_output.txt

##requirement
A MIPS assembly environment, such as QtSPIM, to run the assembly files.
Visual Studio Code to program the assembly files
GNU Image manipulation program to open the .ppm and .txt files in an image format
Text editor to open the .txt files in text format
Folder for modified and original files

## Usage: How to run the .asm files (Note both files are run the same way)
1. Load both the increase_brightness.asm and greyscale.asm on visual studio code and save it
2. Choose one of the sample .ppm images and load the direct file path into the the original_file
3. Create two .txt files one for brightness_increase.asm, increase_output.txt and one for greyscale.asm, greyscale_output.txt in the same path directory and put this path in the modified_file
4. Save the .asm file
5. Go onto qtSPim click on file then reinitialize and load file, then run the .asm file
6. If it is the brightness_increase.asm check the console for the average values of the modified and original pixel values
7. If it is the greyscale.asm file that was run check the console for the modified pixel values
8. For both files to see the modified pixel values open the increase_output.txt or the greyscale_out.txt with GIMP to see the modified image
9. To see the modified pixel values of the image open the increase_output.txt or the greyscale_out.txt with with a text editor.

##Program Explanations
####increase_brightness.asm
This program reads a colour PPM image, increases the brightness of each pixel by 10 (limited to 255), and saves the modified image to a new file.
It calculates and prints out the average RGB values of the original and modified images to the console.
####greyscale.asm
This program reads in a colour PPM image, converts it to a greyscale PPM image, and saves the modified image to a new file.
It calculates and prints out the average RGB values of the original image in the console.

##Author
Gladys Motsinoni