---
title: Booting Process
tags: [Booting]
style: fill
color: primary
comments: false
description: General Booting Process
---

1. BIOS (Basic Input Output System) is loaded from ROM (Read Only Memory) to RAM (Random Access Memory) and executed.
2. BIOS runs POST (Power On Self Test) to check the proper functionality of hardware.
3. Once POST is passed, bootstrap stored at the MBR (Master Boot Record) of a booting device to RAM.
4. Bootstrap finds the bootsector of the booting device and loads bootloader from the bootsector to RAM.
5. Bootloader loads the kernel image to RAM.