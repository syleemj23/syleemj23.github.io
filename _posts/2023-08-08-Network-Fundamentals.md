---
title: Network Fundamentals
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Basic Network Concepts
---
**** Further Study needed ****

### TCP/IP Model

| Layer | Data-Unit Name in Layer | Identifier |
| :-: | :-: | :-: | :-- |
| Application | Data | Telnet, FTP, Web |
| Transportation | Segment | Port # |
| Network | Packet | IP address |
| Data Link | Frame | Mac address |
| Physical | Bit | Circuit # |

* Physical Layer
  : The 3 main types of the mediums used in physical layer are copper, fiber optics, and wireless.
  1. Copper
    :
  2. Fiber Optics
    :
  3. Wireless
    : The things needed to intercept 802.11 are SSID, MAC address of AP, encyption type, and channel #.

| Wireless Standard | Max. Speed | Radio Frequency |
| :-: | :-: | :-: |
| 802.11a | 54 Mbps | 5 GHz |
| 802.11b | 11 Mbps | 2.4 GHz |
| 802.11g | 54 Mbps | 2.4 GHz |
| 802.11n | 100 Mbps | 2.5 Ghz or 5 GHz |

| Wireless Security Protocol | Encryption |
| :-: | :-- |
| WEP <br> (Wired Equivalent Privacy) |  48-bit RC-4 |
| WPA <br> (Wi-Fi Protected Access) | 128-bit  RC-4 |
| WPA2 | AES |

* Data-Link Layer (MAC)
  : This layer is responsible for node-to-node communication.
  : Layer-2 protocols include ATM, PPP, X.25, and Ethernet.
  : The 2 types of ethernet encapsulation are IEEE 802.2/802.3 and Ethernet Encapsulation
  : ARP (Address Resolution Protocol) is used to obtain the MAC address associated with an IP address while RARP (Reverse Address Resolution Protocol) is used to obtain the IP address associated with a MAC address.
  : Proxy ARP and Gratuitous ARP.

* Network Layer (IP)
  : This layer is responsible for host-to-host communication.
  1. IP Address Class
  2. Subnet
  3. CIDR (Classless Inter-Domain Routing)
    : It groups networks together for routing.
  4. Non-Routable IP Address

* Transport Layer (Port)
  : This layer is reponsible for process-to-process communication
  : Layer-4 protocols include TCP and UDP.
  : UDP-applications include Tftp, DNS, SNMP, RIP, VoIP, and streaming media.
  : A socket in TCP is identified with the IP addresses and port numbers of source and destination.
  : ICMP (Internet Control Message Protocol) includes ping and trace rouote.

* Application Layer

---

* Encapsulation
  : Encapsulation is to include the data associated with the current layer to the data from the upper layer.

* Routing Protocol
  * RIP (Routing Information Protocol)
    : It is for an IGP (Interior Gateway Protocol).
    : It is used within an Autonomous System (AS).
  * OSPF (Open Shortest Path First)
    : It is based on SPF (Shortest Path First) algorithm, AKA. Dijkstra.
  * BGF (Border Gateway Protocol)

* Firewall
  : A firewall is a hardware or software device that permits, deny or proxy data between computer networks with different levels of trusts, such as between the Internet, a network with the lowest trust, and the intranet, a netwrok with the highest trust.
  : The rules enforced by firewalls are described in Access Control Lists (ACL).

* VPN (Virtual Private Network)
  : VPN is a technology that securely transmit data over an untrusted network, such as the Internet, by establishing an encrypted channel between two end networks.

* [Windows] Command-Prompt commands
  * *netstat*
    : This command shows the network status.
  * *nbtstat*
    : This command shows the netwrok status associated with NetBIOS.
  * *ipconfig*
    : This command shows the IP protocol configurations.
  * *tasklist*
    : This command shows running processes on either the current machine or a remote machine.
  * *ping*
    : This command checks if a given host is reachable.
  * *tracert*
    : This command identifies the routers that a packet has passed to reach to a given host.
  * *getmac*
    : This command shows the MAC addresses of all network adapters.
  * *wmic*
    : This command is the command-line version of Windows Management Instrumentation.
  * *net*
    : This command allows to view or modify the settings of network resources, such accounts and users.

* Domain Controller
  : A domain controller is a machine run on a server version of Windows and provides services to the host machines on the current network, such as centralized authentication.
  : Two or more domain controllers are usually used for fault tolerance.
  : All domain controllers sync every few minutes.
  : Domains can be hierarchical, such as the parent-child relationship.
  * Active Directory
    :It stores configuration information for an entire domain.
    : *ntds.dit* is a file that holds information about all the domain user-accounts.
  * Group Policy
    : It is means by which an administrator can alter and enforce policies to parts or all the computers in a domain.
  * Organizational Unit
    : It helps manage resources.
    : It is used for administrative convenience.
  * Member Server
    : A member server is a machine run on a server version of Windows but not a domain controller.
  * Client Computer
    : A client compuer is a machine run on a non-server version of Windows.

* Account
  : An account can represent a user, a computer, or a service.
  : Each account is assigned a globally unique SID (Security IDentifier).
  * Local Account
    : A local account is valid for a local machine, and its information is stored in the SAM registry of the machine.
  * Domain Account
    : A domain account is valid for a domain, and its information is stored in the active directory of the domain controller.

* Common Default Group
  * Backup Operator
    : It can back up any data on a system.
  * Administrator
  * Domain Admin
    : A domain admin is a member of *Administrator* group for all the machines in a domain.
  * Enterprise Admin
    : An enterprise admin has full administrative control over all the machines in an enterprise.
  * Account Operator 
    : It can create, delete, and modify user accounts and members of most groups.

* Policy
  : A policy is a rule set by an administrator that applies to an entire domain, an organizational unit, or a computer.
* Right
  : A right is an ability assigned to a particular account.
* Permission
  : A permission is assigned to a file or another object.
  : A permission determines which account can access a particular file or resource and level of access grant.
* Share Permission
  : A share permission governs who has access to a resource that that has been made available for other computer users who access the resource remotely.
  : A share permission is checked only when a file is accessed remoly with SMB protocol.

* [Linux] Commands
  * *ifconfig*
    : This command is equivalent to *ipconfig* on Windows.
  * *ip*
    : This command is an replacement for *ifconfig*.
  * *netstat*
    :  This command is equivalent to *netstat* on Windows.
  * *ss*
    : This command is an replacement for *netstat*.
  * *ps*
    : This command is similar to *tasklist* on Windows.
  * *ping*
    :  This command is equivalent to *ping* on Windows.
  * *traceroute*
    :  This command is equivalent to *tracert* on Windows.

* TCP Header Fields
  * Port#
    : This information tells which application is intended for with a given segment.
  * Sequence and Acknowledgement #
    : This information tell the order of the segments transmitted during a given session.
  * Flag Bits
    * *URG*
    : This flag means *Urgent* and is used to request the immediate process of the current segment at the destination node.
    : This flag can be used by *FTP*
    * *ACK*
    : This flag means *Acknowledge* and is used to inform the source node of confirming the *SYN* segment from it.
    : The segment with this flag and Window-Size 0 not together with either *FIN* or *RST* can be suspicious because the segment does not make sense.
    * *PSH*
    : This flag means *Push* and is used to request the push of the current segement without buffering at the destination node.
    : A large number of this flag bit is abnormal.
    * *RST*
    : This flag means *Reset* and is used to force the closure of the current session.
    : This flag can be used under both normal and abnormal situations.
      * *Example of Normal Situation*
      : A user closes forcibly an application.
      * *Example of Abnormal Situation*
      : A malicious actor is performing the port scanning.
    * *SYN*
    : This flag means *Synchronization* and is used to initiate a session.
    : A huge number of the segments with this flag can be sent to the destination node for the DoS attack by exhausting its socket capacity.
    * *FIN*
    : This flag means *Finish* and is used to request a gracefule closure of the current session.
  * Window Size
  : This field indicates the maximum amount of data that the source and destination nodes agree to transmit.
  : This field can give a hint to identifying the OS of invovled nodes because an OS tends to request a particular Window Size.

* DNS (Domain Name Service) Protocol for Application Layer
: DNS packet is transmitted in UDP.
: DNS packet is rarely blocked because of the significance of DNS on the Internet.
: DNS uses port# 53.
: DNS can be used for a covert channel by a malicious actor.
: The normal size of DNS packet is around hundreds of bytes.

* ICMP (Internet Control Message Protocol) for Network Layer
: ICMP is used to communicate the status of network.
: ICMP packets are usually blocked at the gateway routers of an organization because of no reason to share its internal network status.
: The normal size of ICMP packets is below 100 bytes.

* *Time To Live* field in the IP Header
: This field tells how many hops a given packet can pass.
: This field exists to prevent infinite routing loops.
: This field together with Window Size field can be used in identifying the OS of involved nodes.