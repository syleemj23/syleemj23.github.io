---
title: Network Based Evidence (NBE)
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Network Based Evidence (NBE)
---
**** Further Study needed ****

* Sources of NBE
  * IDS (Intrusion Detection System)
  : It alerts when pre-defined conditions are satisfied.
  * IPS (Intrusion Prevention System)
  : It not only alerts but also take an action to stop an event when pre-defined conditions are satisfied.
  * Host-based Collection
  * Netflow
  : It is the collection of some header information of packets, such as the IP addresses and port numbers of both a source node and a destination node.
  * Log data
  : It can come from router, firewall, server, IDS sensors, DHCP servers, host-based sensors, or host itself.
  * Full-Content Intercept

* Purposes of Network Monitoring
  : Confirm or dispel suspicions around a reported potential incident.
  : Function as an additional type of evidence to an incident
  : Verify the scope of a compromise
  : Identify the involved parties in a compromise
  : Develop the timeline of an incident
  : Help ensure the compliance of security policies and procedures in place

* Types of Network Monitoring
  * Event Monitoring
  : Network traffic is monitored based on certain patterns (signatures) or pre-defined rules.
  : This type of network monitoring is implemented by programming an monitoring device, such as IDS, to generate alerts when signatures are found or pre-defined rules are satisfied.
  * Trap and Trace Monitoring
  : Network traffic is monitored based on the transactional data of packets, such as the IP addresses and port numbers of both a source node and a destination node.
  : A type of such a transational data is NetFlow.
  * Full Content Monitoring
  : Network traffic is monitored based on the actual contents of packets.
  : This type of network monitoring requires a high storage capacity to hold all the packets on a given network.
  * Frequency Monitoring
  : Network traffic is monitored based on the statistical characteristics of network traffic, such as mean, mode, largest, and smallest.
  * Anomaly Monitoring
  : Network traffic is monitored based on anomaly events from the baseline of network traffic patterns.

* 2 Types of Network Security Monitoring (NSM)
  * Proactive
  : NBE is collected before an incident occurs.
  * Reactive
  : NBE is collected during or after an incident occurs.

* Life Cycle of APT (Advanced Persistent Threat)
  1. Initial Reconnaissance
  : In this stage, malicious actors gather information about a target.
  : Such information includes the identification of staff members, target systems, and security vulnerabilities.
  2. Initial Compromise
  : In this stage, malicious actors launches an attack on a target system by exploiting the researched vulnerability in the previous stage.
    * Types of Attacks
      * Buffer Overflow
      * Remote Shell Execution
      * SQL Injection
      : Malicious actors provides a databse server with a SQL that makes the server executes commands for the malicious actors.
      * DLL Injection
      : Malicious actors inject a DLL into the target system's processes that will act as a backdoor.
      * Phishing
      * Denia-of-Service (DoS)
      : Malicious actors makes the target system unavailable for its legitimate users by depleting its resources.
  3. Foothold Establishment
  : In this stage, malicious actors prepare the way of getting back to the target system in the future by placing backoors on the system.
  : Such backdoors can be public backdoors found online or custom backdoors developed by malicious actors themselves.
  4. Privilege Escalation
  : In this stage, malicious actors try to obtain a privileged account on the currently compromised system, such as an administrator account.
  5. Internal Reconnaissance
  : In this stage, malicious actors try to understand the network environment of the currently compromised system. 
  6. Lateral Movement
  : In this stage, malicious actors move from the currently compromised system to another system to get the targeted information.
  7. Presence Maintenance
  : In this stage, malicious actors prepare the way of getting back to the currently compromised system that is different from the initially compromised one.
  : Such a way can include another backdoor or a user-account creation.
  8. Mission Completion
  : In this stage, malicious actors often pack the target information into archive files, encrypt the files, and exffiltrate the files. 

* Popular Reconnaissance Tools
  * Nmap
  : This tool identifies open ports on a given target system.
  : Open ports on a target system help find out which services are offered from the target system.
  * whois
  : This tool shows the registrant information for a given domain or IP address.
  : The information helps the geographic locations of a target system and its point of contact for social engineering.
  * nslookup
  : This tool translates a domain name to its actual IP address.
  * traceroute (Linux) / tracert (Windows)
  : This tool idenfies the name and IP address of each router on the route from the current system to the target system.
  * ping
  : This tool checkes if a given target system is reachable.
  * Vulnerability Scanner
  : This type of tools provides the details of known vulnerabilities on the network services available on the target system by trying to communicate with the network services through their associated port numbers.
  : Such tools include Nessus, Netsparker, Skybox, Metaploit, Intruder, and Probely.

* tcpdump / windump
: These are network traffic collection tools
: Their default package capture size should be checked because they can vary depending on versions.