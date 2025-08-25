# **Image Processing in MIPS Assembly**

Two MIPS assembly programs that process **PPM** images:
- **increase_brightness.asm** — increases image brightness
- **greyscale.asm** — converts a color image to **greyscale**

![MIPS Image Processing Screenshot](https://github.com/Gladmots/image-processing-mips-assembly/blob/main/Image%20Processing%20MIPS%20Assembly/Screenshot%202025-08-24%20221209.png?raw=1)

![MIPS Image Processing Screenshot](https://github.com/Gladmots/image-processing-mips-assembly/blob/main/Image%20Processing%20MIPS%20Assembly/Screenshot%202025-08-24%20221149.png?raw=1)

## **Repository Contents**
- `increase_brightness.asm`
- `greyscale.asm`
- `sample_images/`
- `myrepo/log.txt`
- `greyscale_output.txt`
- `increase_output.txt`

## **Requirements**
- **QtSPIM** (MIPS simulator)
- **VS Code** (editor)
- **GIMP** (to open/export PPM/PNG)

## **Usage**
1. Open `increase_brightness.asm` or `greyscale.asm` in **VS Code**.
2. Set **absolute paths** for `original_file` and `modified_file`.
3. In **QtSPIM** → *Reinitialize and Load File…* → **Run**.
4. Check console for **average RGB** stats.
5. Open outputs in **GIMP** or a text editor.

## Program Explanations
### **increase_brightness.asm**
Increases each RGB channel by **+10** (max **255**), writes `increase_output.txt`,
and prints **average RGB** for original vs modified.

### **greyscale.asm**
Converts color to **greyscale**, writes `greyscale_output.txt`,
and prints **average RGB** for the original.

## **Author**
**Gladys Motsinoni**
