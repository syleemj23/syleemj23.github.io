---
title: Anti-Forensics_Hiding Techniques
tags: [Hiding]
style: boarder
color: success
comments: false
description: Hiding Techniques
---
**** Further Study needed ****

### Files
  * Chnage of File Extension
    : It can be discovered through file signature analysis where the header and footer of a file is checked if they are consistent with the extension.
  * Hidden File Attribute
    * Windows
      : `Hidden items` is checked in File Explorer to show hidden files.
    * MacOS
      : Keys `Command`, `Shift`, and `.` are pressed to show hidden files.
    * Linux  
      : Command `ls -a` is entered to show hidden files. <br><br><br>
  * Files stored in Bad Clusters or Bad Blocks.
    * NTFS
      : `$BadClus`
    * FAT
      : `0xFF7`
    * HFS+
      : in extents overflow
  * Bit Shift
    : It can be deteched only manually with hex editor.
    : It changes the hash value of a file.
    : It makes known good files uncarvable by forensic tools because such files are carved by their hash values being checked.
  * Staganography
    : It is the technique of hiding data within a cover medium, such as a picture.
    * Types of Detection Techniques
      * Stego-Only
        : It is the technique when only the steganography medium but not the hidden message is available for analysis.
      * Known Cover
        : It is the technique when both the steganography medium and the associated original medium without the hidden message are available for analysis.
      * Known Message
        : It is the technique when only the hidden message is available for analysis.
      * Chosen Steganography
        : It is the technique when both the steganography medium and the staganography algorithm are available for analysis.
      * Chosen Message
        : It is used to create steganography media with a known message and algorithm in order to discover corresponding patterns in the created steganography media that may tell the use of specific algorithm.
  * Encryption
    : It is a subset of cryptography.
    : It needs a key to decrypt an encrypted message.
    * Decryption Methods without Key
      * Key Escrow
      * Brute Force
      * Dictionary
        : List of words.
      * Rainbow Table
        : A table of hash values for plain text

### Partitions
  * Windows
  ```consol
  diskpart
  remove or assign
  ```
  * MacOS
  ```consol
  diskutil list
  ```
  * Linux
  ```consol
  mnt/hidden
  ```