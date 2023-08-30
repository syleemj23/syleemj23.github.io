---
title: Incident Response
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Incident Response
---
<b> <center> ** Further Study needed ** </center> </b>

* Procedure of Computer-Incident Investigation
: Not necessarily all the following phases take place.

  1. Preparation
  : Various preparations take place in this phase, such as planning and intelligence gathering.
    * Considerations
      * Legal Authority for Evidence Seizure
      : Due to the potential breach of the 4th Amendment, investigators need to prepare a legal ground for seizing evidence before the occurrence of the seizure.
      : Possible legal grounds search warrant, consent, inventory search, and exceptional cases (exigent circumstance, plain view, search incident to arrest).
      * Completeness of Toolkit

  2. Preservation
  : The least invasive methods should be employed.
  : All the steps taken should be documented.
  : Other devices than the target device that might have witnessed an incident should be identified, such as routers and firewalls.
  : Either physical or digital destruction of potential evidence should be prevented, such as remote wipe.
  : Whether to preserve volatile data should be decided based on various factors, such as the amount of time having been passed since an incident.
  : The inactivity functionality of computers, such as power scheme, screensaver, or hibernation, needs to be prevented with such as mouse jiggler. 
  : Cloud connections or wireless storage connection could be lost with the loss of network connection, so it should be determined if such loss of network connection is necessary.
  : Information on monitor could be captured by taking a photo, a sketch, or using `Save as` for open files. <br> (Processes on the System Tray on Windows also should be documented.)
  : BIOS Information, such as time, should be obtained.
  : All the visible exterior characteristics of a device in question should be documented, such as damages.
  : All the peripherals attached to a device in question should be documented because they tell how the device has been used.
  : Evidence devices should be properly packed with the consideration of heat, static electricity, and impact.
  : Evidence devices should be packed in a way of immediately revealing tempering.

  3. Duplication
  4. Analysis 
  5. Reporting

* Importance Order of Data Volatility
  1. Registry and various Cache
  2. Routing table, Process Table, Kernel Statistics, Network Connection
  4. Temporary File Systems
  5. Permanent Storage
  6. Remote Logging and Monitoring Date
  7. Physical Configurations and Network Topology
  8. Archive Media