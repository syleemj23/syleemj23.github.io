---
title: File Analysis
tags: [File Analysis]
style: boarder
color: success
comments: false
description: File Analysis
---
**** Further Study needed ****

* It yeilds important metadata of a file. <br><br>
* Types of Metadata
  * Owner or Creator of File
  * File Size
  * MAC Timestamp of File (Modified, Accessed, Created)
  * File Type
  * Change Timestamp
    : This is the timestamp of the metadate being modified.<br><br>
* Locations of MAC Timestamp
  * $STANDARD_INFO
    : This can be modified by users.
  * $FILE_NAME
    : This is updated by the kernel.<br><br>
* File Type is checked by ensuring the consistency between the file extension of a file and the associated header and footer values.<br><br>
* The header and footer of a file type can be used in carving out a hidden file in another file by copying the binary data between the header and footer into a new file.