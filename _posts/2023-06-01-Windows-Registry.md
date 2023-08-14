---
title: Windows_Registry
tags: [Registry]
style: boarder
color: success
comments: false
description: Registry keys, hives
---
**** Further Study needed ****

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Registry is the database of Windows

### Registry Files
  * Older Versions of Windows than Windows NT
    * USER.dat (\Windows\System32\Config)
    * SYSTEM.dat (\Windows\System32\Config)
  * Windows NT or Newer Versions
    * NTUSER.dat (\Users\\`<User Name>`\Desktop)
      : This file contains the list of most recently used files and desktop configuration settings.
    * SOFTWARE.dat (\Windows\System32\Config)
      : This file contains information about the settings of and the associated usernames and passwords of the installed programs.
    * DEFAULT.dat (\Windows\System32\Config)
      : This file contains the system settings.
    * SYSTEM.dat (\Windows\System32\Config)
      : This file contains the additional system settings.
    * SECURITY.dat (\Windows\System32\Config)
      : This file contains the security settings.
    * SAM.dat
      : This file contains user account management and security settings.
  * File system is independent from OS though some file systems show limited functionalities with some OSs.<br><br>

### Registry Root Keys (Hive)
  * HKEY_CLASS_ROOT
    : This hive contains file type and file extension information, URL, protocol, prefixes, and etc.
  * HKEY_CURRENT_USER
    : This hive contains information about the currently logged-on user's settings.
  * HKEY_LOCAL_MACHINE
    : This hive contains installed hardware and software information.
  * HKEY_USERS
    : This hive contains information for the currently logged-on user, only one key.
  * HKEY_CURRENT_CONFIG
    : This hive contains information about hardware configuration.
  * HKEY_DYN_DATA (for Windows 9x or ME)
    : This hive contains installed hardware and software information.<br><br>

### Registry Artifacts
  * Security IDentifiers (SID)
    : Each Windows user account is assigned with a unique SID.
    : This SID can be found at `HKEY_LOCAL-MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\ProfileList`
  * Time Zone
    : Time-zone information can be found at `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet00x\TimeZoneInformation`
  * Mounted USB Drives
    : It can be found at `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet00x\Services\USBSTOR`
  * Windows Users' Password Hash
    : It can be found from SAM.dat.
  * Most Recently Used (Files, Commands, and etc.)
    : It can be found at `HKEY_Current_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU`
  * Typeed URLs with Internet Explorer
    : It can be found at `HKEY_Current_USER\Software\Microsoft\Internet Explorer\TypedURLs`