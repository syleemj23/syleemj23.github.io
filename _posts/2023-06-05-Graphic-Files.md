---
title: Graphic Files
tags: [Graphic Files]
style: boarder
color: success
comments: false
description: Graphic Files
---
**** Further Study needed ****

### Types of Graphic Files
* Raster
: Pixel information is stored as fixed values, so a raster image loses its resolution with zoom-in.
* Vector
: Pixel information is stored as methematical expressions, so a vector image keeps its resolution with zoom-in.
* Metafile
: Pixel information is stored as the combination of both fixed values and methematical expressions.

### EXIF (Exchangeable Image File Format)
: It contains the camera or setting information when a picture is taken.

### JPEF Format
* JPEG JFIF
: It contains no EXIF information.
  * Header
  : `0x FF D8 FF E0`
  * Footer
  : `0x FF D9`
* JPEG Exif
: It contains EXIF information.
  * Header
  : `0x FF D8 FF E1`
  * Footer
  : `0x FF D9` <br><br>

### Image Staganography
: Information can be concealed in an image file.
* Methods
  * Insertion
  : The information to be concealed is inserted into a medium file without its original contents' data bits being modified.
  : Ex) Concealed information is added after the footer of an image file, so an image viewer does not recognize the information.
  * Substitution
  : The information to be concealed is inserted into a medium file by modifying the data bits of its original contents.
  : This method can be used for non-malicious purposes, such as placing a water mark in an intellectual property.
  : Ex) LSB (Least Significatn Bit) method
    * LSB
    : The bit data of concealed information is substitued with the least significant 2 bits of each byte in a medium file.
    : This method works because slight change in each pixel information (byte) is hard to be recognized to human eyes.