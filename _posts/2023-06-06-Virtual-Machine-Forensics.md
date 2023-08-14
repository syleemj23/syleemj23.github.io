---
title: Virtual Machine Forensics
tags: [Virtualization, Hypervisor]
style: boarder
color: success
comments: false
description: Virtual Machine Forensics
---
**** Further Study needed ****

### Virtualization
* Virtualization is running 2 or more OSs on a system.
* Virtualization is different from containerization.

### Hypervisor
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It is the software that creates a virtual environment by emulating all the functions of typical OSs on a physical systems.
* 2 Types of Hypervisors
  * Type 1 Hypervisor (Bare Metal System)
  : This type of hypervisors are run directly on the hardware of a system.
  : The possible number of VMs simultaneously running depends on the available hardware resources, such as RAM.
  : This type of hypervisors are usually used at data centers that usually requires live forensic-image acquisition due to their nature of being unable to be completely shut down.
  * Type 2 Hypervisor
  : This type of hypervisors are run on the host OS of a system.
  : Most VM software belongs to this type of hypervisors, so it is usually found on personal computers.
  : This type of hypervisors requires both live and static forensic image acquisitions because 2 different types of digital artifacts left by VMs, one left when VMs are running and the other left after they are shut down.
    * VMware

      | <center> File </center> | <center> Description </center> |
      | :-: | :-- |
      | .vmx | This file holds the configuration of a VM. |
      | .vmdk | This file represents the hard-disk of a VM. |
      | .vmem | This file represents the RAM of a VM. |
      | .vmsd | This file stores the metadata of VM snapshots. |
      | .vmsn | This file represents a snapshot of a VM and should be aligned with .vmsd files above. |
      | .vmss | This file stores information about suspended VMs. |
      | .log | |

    * Virtual Box

      | <center> File </center> | <center> Description </center> |
      | :-: | :-- |
      | .ova / .ovf | This file contains the compressed version of a VM. <br> This file format is used for cross-platforms. |
      | .vdi | This file represents a hard-disk of a VM. |
      | .vbox | This file stores the configurations of the virtual hard drives for a VM. |
      | .vbox-extpack | This file contains information about the additional features provided by Virtual Box |
      | .vbox-prev | This file stores the backup of a VM. |
      | .xml-prev | This file stores the backup of XML settings for a VM. |
      | .log | This file contains the performed VM activities. |

* Digital Artifacts for Type-2 Hypervisors
  * VM-related Folders
    * Windows
      * User Directory
      * Document Directory
      * HKEY_CLASSES_ROOT registry
    * Linux
      * home/`UserName`
    * MacOS
      * Macintosh HD/Users/`UserName`/Documents/Virtual Machines
  * VM Network Adaptors