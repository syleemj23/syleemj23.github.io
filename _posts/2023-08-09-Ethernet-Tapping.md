---
title: Tapping Ethernet Network
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Basic Network Concepts
---
**** Further Study needed ****
* 4 Ways of Tapping
  * Hub
  : Hubs do not introduce collisions on a network.
  : Hubs are invisible to the other devices on the same network because of no IP and MAC addressess.
  : Hubs should be placed between a target devie and a switch.
  : The data transmission capacity of hubs is below 100MB, so they are good for end-device circuits but not for backbone circuits.
  * Tap devices
  : Tap devices do not introduce collisions on a network.
  : Tap devices are fail open, which means that network traffic is still transmitable even when they are malfunctioning.
  : Tap devices should have the same layer-characteristics as the target device and switch, such as speed and connecting media.
  : Tap devices should be placed between a target device and a switch.
    * 4 Types of Tap Devices
      * Non-Aggregating Tap
      * Aggregating Tap
      * Link Aggregating Tap
      * Regenerating Tap
  * Inline Devices
  : Inline devices are machines with multiple NICs and capable of bridging.
  : IPSs and firewalls are usually of inline devices.
  * SPAN (Switch Port ANalyzer) Functionality of Switches
  : This functionality duplicates data from a target device and send the data to the SPAN port.
  : This functionality can introduce an issue of oversubscribing the collection circuit.
    * Relevant Terminology
      * Source SPAN port
      : The port that the data from a target device is received from.
      * Source SPAN VLAN
      : The port that the data from a target VLAN is received from.
      * Destination SPAN Port or Monitor Port
      : The port that the data from a target device is sent to.

* Collection Devices
: Collection devices have network interfaces but usually not assigned with IP addresses to make them harder to be recognized by the other devices on the same network.
