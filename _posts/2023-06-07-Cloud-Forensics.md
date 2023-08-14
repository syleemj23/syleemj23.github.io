---
title: Cloud Forensics
tags: [Cloud Forensics]
style: boarder
color: success
comments: false
description: Cloud Forensics
---
**** Further Study needed ****

### 3 Cloud Service Models
* SaaS (Software as a Service)
: CSPs are responsible for the maintenance of everything.
: Users simply use the software provided by CSPs and generate data.
* PaaS (Platform as a Service)
: Users are responsible for the maintenance of software while CSPs are reponsible for the others.
: Users need to install software that they want to use.
* IaaS (Infrastructure as a Service)
: Users are reponsible for the maintenance of OSs and software while CSPs are reponsible for the others.
: Users need to install OSs and software that they want to use.
: Services are usually charged for in the manner of pay-as-you-go.<br><br>


### 4 Deployment Models
* Private Cloud
: This type of cloud services are only accessible to a group.
* Public Cloud
: This type of cloud services are open to the public.
* Community Cloud
: This type of cloud services are accessible to a set of groups that shares the common interest.
* Hybrid Cloud
: <br><br>

### Cloud Forensic Tools' Capabilities
* Data Collection
: Tools should be able to identify, label, record, and  acquire data from cloud services.
* Elastic
: Tools should be able to expand or contract their data storage capabilities as the demand for cloud services changes because how much data should be stored is unknown.
* Evidence Segregation
: Tools should be able to separate each customer's data because cloud services are used by multiple users.
* Investigation in Virtualized Environment
: Tools should be able to handle VMs.<br><br>

### Legal Consideration for Cloud Forensics
* SLA (Service Level Agreement)
: This document describes CSP's responsibilities for its cloud services provided to users.
* CSP's Policies, Standards, and Guidelines
* ECPA (Electronic Communications Privacy Act)
: This law regulates the acquisition of data from service providers.
  * Search Warrant
  * Subpoena
  * Court Order
  * Preservation Letter<br><br>

### Challenges for Cloud Forensics
* Different architectures of cloud services from CSP to CSP
* Data stored over multiple jurisdictions.
* Multiple Difficulties associated with data analysis
  * Overwhelming amount of data
  * Old data being erased over time
  * Data segregation for other users
* Encryption
* Role management
* Lack of standards and training for cloud security
* Anti-forensics<br><br>

### Forensic Artifacts for Cloud Storage
* Dropbox
  * Folder
    * \Users\\`UserName`\Dropbox
    : This folder contains the files and folders synched with Dropbox.
    * \Users\\`UserName`\AppData\Roaming\Dropbox
    : Synchronizes files between Dropbox and the client computer.
  * File
    * filecache.dbx
    : This file contains information about shared directories on a user account and the files transfered between Dropbox and the client computer.
  * Prefetch
    * DROPBOXDECRYPTOR-nnnnnnn.pf
    * DROPBOX.EXE-nnnnnnnn.pf
    * DROPBOXDECRYPTORvNNNnsetup.tmp-nnnnnn.pf
    * DROPBOXINSTALLER.EXE-nnnnnn.pf
* Google Drive
  * Folder
    * \Program Files (x86)\Google\Drive
    * \Users\\`UserName`\AppData\Local\Google\Drive
    * \Users\\`UserName`\Google Drive\
  * Registry
    * SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folder
    * SOFTWARE\Google Drive
    * NTUSER\Software\Microsoft\Windows\CurrentVersion\Run\GoogleDriveSnc
    * NTUSER\Software\Classes
  * Prefetch
    * GOOGLEDRIVESYNC.EXE-nnnnnn.pf
    * GOOGLEUPDATE.EXE-nnnnnn.pf
* OneDrive
  * Folder
    * \Users\\`UserName`\AppData\Local\Microsoft\OneDrive\logs
    * \Users\\`UserName`\AppData\Local\Microsoft\Windows\SkyDrive\OneDrive\logs
    * [Windows 7] \Users\\`UserName`\AppData\OneDrive 
    : This folder contains synchronized files.
    * \Users\\`UserName`\AppData\SkyDrive\OneDrive
  * Registry
    * SOFTWARE\Microsoft\Windows\CurentVersion\Explorer\FolderDescriptions\nnnnnnnn-nnnn-nnnn-nnnn-nnnnnnnnnnnn
    * SOFTWARE\Microsoft\Windows\CurentVersion\Explorer
  * Prefetch
    * ONEDRIVEREBRAND.EXE-nnnnnn.pf
    * SKYDRIVE.EXE-nnnnnn.pf
    * SKYDRIVECONFIG.EXE-nnnnnn.pf
    * SKYDRIVESETUP.EXE-nnnnnnn.pf
