---
title: Windows_Prefetch
tags: [Prefetch]
style: boarder
color: success
comments: false
description: Prefetch
---
**** Further Study needed ****

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Windows creates prefetch files to enhance performance by caching application codes and preloading it the next time.

### Maximum Number of Prefetch Files
  * Windows XP, 7
    : 128
  * Windows 8, 10
    : 1024<br><br>

### Registry to find out Enabledness of Prefetch
  * It can be found at `\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters`
  * `0` means disabled.

### Prefetch File Location
  : It is located at `Windows\Prefetch\`

### Types of Information in Prefetch Files
  * Timestamp of Last Execution, Last Modification, Creation.
  * Number of Execution
  * Device and File Handles used by the associated program
  * [Windows 8, 10] Last 8 times of Execution.
  