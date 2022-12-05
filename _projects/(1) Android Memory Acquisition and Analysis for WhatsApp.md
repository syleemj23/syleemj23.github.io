---
name: Android Memory Acquisition and Analysis for WhatsApp
tools: [ADB, LiME, Frida, Fridump, Odin]
image: /imgs/Android_Logo.jpg
description: system memory acquisition, application memory acquisition, string analysis.
---

<!--- Image from https://www.flickr.com/photos/grahamsblog/5695056315 -->
### <u> Executive Summary </u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Memory acquisition with WhatsApp on an Android device has been attempted for both the system memory and the application memory. Though the system memory acquisition has failed, the application memory acquisition still has provided many digital artifacts that possibly indicate to the user’s certain activities with WhatsApp. Such activities include whether a user has: 
* Added another new user
* Sent a message
* Read a message sent by another user in the same chatroom

### <u> Introduction </u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Throughout this blog post, both 2 methods of acquiring memory contents from an Android device for an application named WhatsApp, and the analysis of the acquired memory contents will be explored. By the methods, 2 different types of memory contents are acquired, one memory content from the memory space of a system and the other from the memory space of an application running on the system. Though both methods have been attempted for memory acquisition, only the application memory contents have been analyzed due to the failure of acquiring the system memory contents. However, the steps taken for both attempted methods will be provided in the following section named Procedure. The application memory contents have been analyzed mainly based on strings.

### <u> Tools </u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The following table shows the tools used for the current project.

| Tool | Type |<center>Version</center> | <center>Purpose</center> |
| :-: | :-: | :-- | :-- |
| Samsung Galaxy Tab A7 Lite <br> (SM-T220) | Hardware | [OS]Android 12 <br> [Kernel]T220XXU1BVGB   | (Device A) <br> To be used as a main testing device |
| Samsung Galaxy Z Flip 4 <br> (SM-F721U1)  | Hardware | [OS]Android 12 <br> [Kernel]F721U1UES1AVJ7 | (Device B) <br> To be used as a secondary device that communicates with the in testing device |
| Samsung Galaxy Book Pro 360 <br> (NP950QDB-KB1US) | Hardware | [OS]Windows 10 <br> [Build]19045.2251  | (Device A) <br> To be used as a workstation |
| SM-T220 Firmware | Software | T220XXU1BVGB | To be used as the base binary for a rooted custom binary |
| Magisk | Software | 25.2   | To create a rooted custom binary |
| Odin3 | Software | 3.14.4   | To install the custom recovery onto the testing device for rooting |
| WSL2 | Software | Ubuntu 20.04   | To build a kernel for a LiME module for the main testing device |
| SM-T220 Kernel | Software | T220XXU1BVGB  | To build a kernel for a LiME module for the main testing device |
| Lime | Software | 1.9.1 | To build a kernel for a LiME module for the main testing device |
| Vmware Workstation 16 Pro | Software | 16.2.4  | To use Tsurgi |
| Tsurgi | Software | 5.4.2-050402  | To acquire both the system memory contents and the application memory contents from the main testing device |
| Frida tools | Software | 15.2.2  | To acquire the application memory contents |
| fridump | Software | 0.1 | To acquire the application memory contents |
| frida-server | Software | 15.2.2  | To acquire the application memory contents |
| Visual Studio Code | Software | 1.73.1  | To both create a program and analyze the strings in the application memory contents |


### <u> Overall Procedure </u>
##### ● Prepare for Memory Acquisition
  1. Download the necessary software in the workstation
       + Android Device Firmware
          - Go to the website [https://samfrew.com](https://samfrew.com)
          - Enter *sm-t220* in the space for *Model*
          - Enter *United States* in the space for *Region*
          - Click the button *OK*
          - Select and download the firmware with version *T220XXU1BVGB*
       + Magisk
          - Download magisk from GitHub [https://github.com/topjohnwu/Magisk/releases](https://github.com/topjohnwu/Magisk/releases)
       + Odin
          - Download Odin from the website [https://www.osamsung.com/odin/Odin3-v3.14.4.zip?check=odin3.14.4](https://www.osamsung.com/odin/Odin3-v3.14.4.zip?check=odin3.14.4)
  2. Prepare the main testing device for rooting
       + Enable Developer options
          - Go to *Settings*
          - Select the menu *About tablet*
          - Select the menu *Software information*
          - Tap *Build number* 7 times to activate the menu *Developer options* under About tablet
       + Enable OEM unlocking
          - Go to *Developer options*
          - Enable the menu *OEM unlocking*
       + Unlock bootloader
          - Turn off the main testing device
          - Connect the main testing device to the workstation
          - Press and hold the 2 buttons *UP* and *Down* until the screen becomes on
          - Press the button *Up* until the screen changes to the mode *Bootloader unlock*
          - Press the button *Up* again
  3. Root the main testing device
       + Prepare a rooted custom binary
          - Copy bo the downloaded file *Magisk* and the *AP* file inside the firmware folder to the main testing device
          - Install *Magisk* on the main testing device
          - Execute the installed program *Magisk*
          - Select the menu *Install*
          - Click the menu *Select and Patch a File*
          - Select the copied file *AP*
          - Click the menu *LET'S GO*
          - Copy the Tar file starting with *magisk_patched* as its name to the workstation
       + Boot the main testing device in the mode *ODIN*
          - Turn off the main testing device
          - Connect the main testing device to the workstation
          - Press and hold the 2 buttons *Up* and *Down* until the screen becomes on
          - Press the button *Up*
       + Install the rooted custom binary on the main testing device with Odin
          - Execute the downloaded file *Odin*
          - Click the button *BL* and select the file inside the firmware folder that starts with *BL_* as its name
          - Click the button *AP* and select the file copied from the main testing device that starts with *magisk_patched* as its name
          - Click the button *CSC* and select the file inside the firmware folder that starts with *CSC_* as its name
          - Click the button *Start*
          - Disconnect the main testing device from the workstation once the message *PASS* appears on *Odin*
       + Factory-reset the main testing device
          - Hold the 2 buttons *Down* and *Power* until the screen goes dark
          - Change the button *Down* to the button *Up* while holding the button *Power*
          - Release both buttons once the message *PRESS POWER KEY TO CONTINUE* appears
          - Select the menu *Wipe data/factory reset*
          - Select the menu *Reboot system now*
       + Connect the main testing device to the workstation
       + Re-install *Magisk* on the main testing device
          - Copy *Magisk* to the main testing device
          - Install *Magisk*
          - Click the button *OK* when the message *Require Additional Setup* appears <br> (This step will reboot the main testing device)
  4. Adjust the settings of the main testing device
       + Turn off *Wi-Fi*
       + Disable *Auto-update Google apps*
       + Disable *Auto download over Wi-fi*
          - Go to *Settings*
          - Select the menu *Software update*
          - Un-check the menu *Auto download over Wi-fi*
       + Repeat *Step 2-1* to enable *Developer options*
       + Adjust the settings under *Developer options*
          - Go to *Developer options*
          - Enable *Stay awake*
          - Disable *Auto update system*
          - Enable *USB debugging*
          - Disable *Verify apps over USB*
          - Disable *Verify bytecode of debuggable apps*
       + Turn on *Wi-Fi*
       + Install *WhatsApp*
       + Log in with the *WhatApp* testing account *Test1*

##### ● Acquire the system-memory contents
  1. Download the necessary files on *WSL2* in the workstation
       + Kernel for the main testing device
          - Go to the website [https://opensource.samsung.com](https://opensource.samsung.com)
          - Search for *sm-t220*
          - Download the kernel file with version *T220XXU1BVGB*
          - Unzip the downloaded kernel file
       + LiME
          - Download *LiME* inside *WSL2* by executing the command line *git clone https://github.com/504ensicsLabs/LiME.git*
  2. Install the necessary software inside *WSL2* by executing the following command lines
       + *sudo apt-get install cmake*
       + *sudo apt-get install build-essential*
       + *sudo apt install llvm clang clang-tools*
       + *sudo apt install binutils-aarch64-linux-gnu*
       + *sudo apt install gcc-aarch64-linux-gnu*
  3. Build a kernel for the LiME module
       + Copy the file *Kernel.tar.gz* inside the unzipped kernel folder into *WSL2*
       + Uncompress *Kernel.tar.gz* by executing the command line *tar -zxvf Kernel.tar.gz -C Out_Dir* <br>(*Out_Dir* is the path to the output directory)
       + Move into the uncompressed folder
       + Modify the existing values in the file *Makefile* to the following values:
         - *CROSS_COMPILE   ?= aarch64-linux-gnu-*
         - *CC		= clang*
       + Modify the existing values in the file *build_kernel.sh* to the following values:
         - *CROSS_COMPILE   ?= aarch64-linux-gnu-*
         - *CC		= clang*
         - *CLANG_TRIPLE	?= aarch64-linux-gnu-*
       + Change *build_kernel.sh* to an executable by executing the command line *chmod 744 build_kernel.sh*
  4. Compile a *LiME* module
       + Modify the existing values in the file *Makefile* to the following values:
         - *KDIR ?= $(HOME)/Kernel_Directory/out/* <br> (*Kernel_Directory* is the path to the unzipped folder *kernel*)
         - *CCPATH := aarch64-linux-gnu-*
         - *default:	$(MAKE) ARCH=arm64 CROSS_COMPILE=$(CCPATH) -C $(KDIR) M=$(PWD)*
       + Execute the command *make*
  5. Copy the LiME module file *lime.ko* to *Tsurgi*
  6. Copy *lime.ko* to the main testing device by executing the command line *adb push < lime.ko Path> /sdcard/lime.ko*
  7. Acquire the system memory contents from the main testing device by executing the following command lines:
       + *adb shell*
       + *su*
       + *cd /sdcard*
       + *insmod lime.ko “path=sysmem.lime format=lime”*

##### ● Acquire and analyze the system-memory contents
  1. Download the necessary files on *Tsurgi*
       + Frida tools
          - Download *Frida tools*  inside *Tsurgi* by executing the command line *pip install frida-tools*
       + fridump
          - Download *fridump*  inside *Tsurgi* by executing the command line *git clone https://github.com/Nightbringer21/fridump.git*
       + frida-server
          - Check the version of *Frida tools* by executing the command line *frida-ps --version*
          - Go to the website [https://github.com/frida/frida/releases](https://github.com/frida/frida/releases)
          - Find the article with the same version as *Frida tools*
          - Click *Assets*
          - Download the file with *frida-server-Version-android-arm64.xz* as its name <br> (*Version* is the version of *Frida tools* in number)
  2. Uncompress *frida-server* by executing the command line *unxz frida_server_file*<br> (*frida_server_file* is the path to *frida-server*)
  3. Run the un-compressed *frida-server* on the main testing device
       + Copy *frida-server* to the main testing device by executing the command line *adb push frida-server file /data/local/tmp* <br> (*frida_server_file* is the path to *frida-server*)
       + Move into the directory */data/local/tmp* inside the main testing device by executing the following command lines
          - *adb shell*
          - *su*
          - *cd /data/local/tmp*
       + Change the permissions of *frida-server* by executing the command line *chmod 755 frida_server_file* <br> (*frida_server_file* is the path to *frida-server*)
       + Run *frida-server* by executing the command line *./frida-server &*
       + Check if the associated process is correctly running by executing the command line *ps -e \| grep -i frida-server*
  4. Get back to *Tsurgi*
  5. Identify the name of the process associated with *WhatsApp* by executing the command line *frida-ps -U*
  6. Acquire the application memory contents from the main testing device
       + Take one of the following actions
          - Open WhatsApp from the main testing device
          - Add another user associated the secondary device from the main testing device
          - Send a message to the secondary device from from the main testing device
          - Read the message sent from the secondary device
          - Send a message to the main testing device from the secondary device
          - Read the message sent by the secondary device from the main testing device
       + Acquire the application memory contents by executing the command line *python3 \<fridump Directory\>/fridump.py -U -s -o \<Output Directory\> \<Application Name\>*
       + Repeat *Steps 6* until all the actions above are exhausted

### <u> Analysis </u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The analysis of the application memory contents for WhatsApp has been performed on the strings stored in the memory contents. Especially, the strings that possibly indicate each of the last 5 actions in the list of 6 actions above have been looked for. As explained in the too table above, Device A is the main testing device while Device B is the secondary device that communicates with the main testing device. The screenshot below shows WhatsApp on Device A after all the 6 actions in the list have been taken.

![1](/imgs/WhatsApp.jpg)