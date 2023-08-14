---
title: File System
tags: [File system, FAT, NTFS, EXT]
style: fill
color: secondary
comments: false
description: File system, FAT, NTFS, Ext2, Ext3, Ext4
---
**** Further Study needed ****

### File System
  * File system is the logical method of organizing files on digital media.
  * File system is independent from OS though some file systems show limited functionalities with some OSs.
  * Basic Components of File System
    * File System
      : Mapping methods, such as FAT, MFT, Superblock
    * Content
      : Space where the actual contents of files are stored.
    * Metadata
      : Space where information about files are stored, such as file size, timestamps.
    * File Name
      : Space where the string values of file names are stored.
    * Application
      : Extra features of file systems, such as journaling, file permissions.<br><br><br>

### FAT (File Allocation Table)
  * It is mostly used for flash drives.
  * Deletion of a file in FAT is reflected by the first byte of the file's name in the root directory being changed to 0xE5 and FAT being updated to reflect the associated clusters as free.
  * Components of FAT
    * Boot Sector
      : Boos sector contains general information about the current file system.
      : The location os Root Directory is located through Boot Sector.
    * FAT 1, FAT 2
      : The contents of both FAT 1 and FAT 2 are the same.
      : They contain information about all the clusters in the current file system, so when they are damaged, the clusters associated with a file cannot be located.
    * Root Directory
      : Root directory contains information about all the files and directories in the root directory.
      : Root directory is located just after FAT in FAT 16 but can exist anwere in Data Area in FAT 32
    * Data Area
      : Data Area contains the actual contents of all the files and directories in the current file system.
  ![](/imgs/FileSystem_Picture1.jpg)

### NTFS (New Technolofy File System)
  * It is used mostly for Windows.
  * Deletion of a file in NTFS is reflected by the file's name being changed to $D03 and being moved to Recycle Bin and MFT being updated to reflect the associated clusters as free.
  * NTFS supports encryption.
  * NTFS has a feature called Alternate Data Stream (ADS) by which the data attached to a file cannot be seen through normal means, such as File Explorer.
  * Components of NTFS
    * MFT (Master File Table)
      : MFT is the Mapping mechanism.
      : MFT can contain hidden data.
      : MFT can contain small data called resident files that is smaller than 515 bytes.
      : MFT slack could contain digital evidence.
      : Bitmap attribute tells which clusters are free.<br><br><br>

### EXT (Extended File System)
  * It is used mostly for Linux or Unix.
  * Everything is a file
  * Ext is based on Unix File System (UFS).
  * Components of EXT
    * Boot Block
    * Superblock & Group Descriptor (File System)
      : It is a mapping mechanism
    * Index Node (iNode) Blocks (Metadata)
      : It corresponds to a file.
      : It contains all the meta data of a file.
      : It has 13-15 pointers that link to data blocks and other iNode blocks.
      * Types of Pointers
        * Direct Pointer
          : It contains the address of a data block.
        * Indirect Pointer
          : It contains the address of another iNode that contains the addresses of 128 data blocks.
        * Double Indirect Pointer
          : It contains the address of another indirect Pointer.
        * Triple Indirect Pointer
          : It contains the address another double indirect pointer. 
    * Data Block (Content)
  * Forensic Artifact
    * /etc/exports
      : It contains the mappings of directories and files being shared over a network.
    * /etc/fstab 
      : It contains the file system table of devices and mount points.
    * /var/log/lastlog
      : It contains the user's last logon.
    * /var/log/auth.log
      : It contains the history of logon and logoff.
    * /var/run/utmp
      : It contains the current user's logon information.
    * /var/log/dmesg
      : It contains the log of system messages.
    * /var/log/syslog
      : It contains system log, such as `system.log` or `kernel.log`.
    * /etc/shadow
      : It contains the hashed passwords for the local system.
    * /etc/group
      : It contains the group membership for the local system.
    * /etc/passwd
      : It contains the account information for the local system.
    * /etc/localtime
      : It contains the system's time zone.
  * Deletion of File
    * Ext2
      : Pointers are removed, but metadata is still available.
      : Data is still recoverable.
    * Ext3, 4
      : Both pointers and metadata are removed.
      : The recovery of data is more difficult.<br><br><br>

### HFS+ (Hierarchical File System Plus)
  * It is mostly used for Apple devices.
  * It is based on Unix File System (UFS).
  * Forensic Artifacts
    * /var/audit
      : It contains system logs, such as user logon and command.
    * /etc/shadow
      : It contains the hashed passwords for the local system.
    * /etc/group
      : It contains group membership for the local system.
    * /etc/passwd/hash
      : It contains account information for the local system.
    * /usr/lib/cron/jobs
      : It contains the system's current time zone.
    * /library/receipts/installhistory.plist
      : It contains installed software.
    * /library/preferences/syustemConfiguration/
      : It contains network connections.<br><br><br>

### APFS (Apple File System)
  * It is mostly used for Apple devices.
  * It replaces HFS+ for the Apple devices with iOS 10.3 and later or macOS High Sierra and later.
  * It is optimized for flash drives and SSDs.
  * It has strong encryption capability.
  * Space Sharing
    : Different volumes share spaces.
  * Copy-On-Write feature
    : Only new contents are stored in new spaces while the same contents are pointed to the existing contents.