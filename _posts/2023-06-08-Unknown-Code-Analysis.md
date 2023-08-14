---
title: Unknown Code Analysis
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Static Analysis, Dynamic Analysis
---
**** Further Study needed ****

### Pupose of Unknown Code Analysis
* To understand both the types of damage and the extent of a compromise caused by an unknown code.
* To prevent similar attacks in the future.
* To access the skill or threat level of malicious actors.
* To identify the number and types of malicious actors.
* To prepare for the subject interview of the caught malicious actors.
* To determine the malicious actors' goals and objectives. 
<br><br>

### 2 Types of Unknown Code Analysis
* Static Analysis
: It is the way of examining a given executable without running it to get a better sense of the code before its further analysis.
  * Steps
    1. Record file information.
       * File path of a supicious file.
       * OS of the machine where a suspicious file is found.
       * MAC timestamps of a suspicious file.
       * Hash value of a suspicious file.
    2. Determine the file format of a suspicious file
      * Aavailable Tools
         * `file`
         : It is a Linux native program that shows the file type of a given file.
         * `nm`
         : It is a Linux native program that shows symbols from object files.
         : Symbols are variable names defined by programmers.
         * Hex Editor
           * `Hexdump` for Linux
           * `HexEdit` for Windows
    3. Review the string values stored in a suspicious file that are at least 4 character long.
       * `strings`
       : It is a linux native program that shows the string values stored in a given file.
    4. Check if a suspicious file is a known malware.
    : `VirusTotal` shows the information about a given file that has been reported by users and Anti-Virus companies.
    : Searching such information with the hash value of a suspicious file is recommended because doing so with a suspicious file itself involves uploading the file to VirusTotal.  
    5. Examine the shared objects used in a suspicious file
       * Available Tools
         * Windows
           * PEView
           * Dependency Walker
           * PEiD
         * Linux
           * `ldd`
           : Its some versions execute a given file, so caution is needed.
           * `objdump `
    6. Review the source code of a suspicious file.
* Dynamic Analysis
: It is the way of examining a given executable by running it in a sandboxed environment to observe its behaviors.
  * Steps
    1. Place a given executable in a sandboxed environment
    2. Initiate analysis tools
    3. Take a snapshot
    4. Run the executable
    5. Take another snapshot
    6. Analyze the results
<br><br>

### Executable File Formats
* PE (Portable Executable)
  * Target OS
  : Linux
  * Magic Number
  : MZ
  * Relevant File Extension
    * .exe
    * .dll
* ELF (Executable and Linkable File)
  * Target OS
  : Linux, Unix
  * Magic Number
  : 0x7F ELF
  * Relevant File Extension
    * .so (equivalent to .dll for Windows)
* Mach-O
  * Target OS
  : Apple OS
  * Magic Number
    * 32-bit Architecture
      * 0xce fa ed fe
      * 0xfe ed fa ce
    * 62-bit Architecture
      * 0xcf fa ed fe
      * 0xfe ed fa cf
  * Relevant File Extension
    * .o
    * .dylib
    * .bundle