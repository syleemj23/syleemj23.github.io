---
title: Router Forensics
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Router Forensics
---
**** Further Study needed ****

* Reason for Routers being targeted
: Routers can be used for DDoS attacks.
: Routers can be a stepping stone to compromise other systems.
: Routers can be used for sniffing network traffic.
: Routing table can be manipulated.

* Considerations
  * Connect directly to routers if possible because malicious actors can recognize the presence of investigators with telnet access.
  * Note the system date and time of routers
  * Check if anyone else is logged into routers
  * Record all the information about the current session (Volatile)
* IOS Commands to Run for Collecting Information from Routers
: Commands need to be run in privileged mode.
  * Separate Commands
  ```consol
  sh clock/ sh clock detail
  sh audit
  sh users
  sh logging
  sh version
  sh access-lists
  sh run
  sh start
  sh ip route
  sh int
  sh hosts
  sh ip arp
  sh cdp neighbor
  sh banners
  sh tcp sockets
  sh udp sockets
  sh stacks
  ```
  * All-in-One Command
  : This command is not supported in some old routers.
  ```consol
  sh tech-support
  ```