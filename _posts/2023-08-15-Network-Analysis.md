---
title: Network Analysis
tags: [Static Analysis, Dynamic Analysis]
style: boarder
color: success
comments: false
description: Network Analysis
---
**** Further Study needed ****

* Protocol Analysis
: Protocol analysis is the practice of examining the fields in the header of a network protocol.
  * Commonly Encountered Protocols

| Protocol | Layer | Characteristics |
| :-: | :-: | :-- |
| Ethernet | 2 (Data Link) | MAC |
| IP | 3 (Network) | IP address |
| TCP | 4 (Transport) | Connection-oriented |
| UDP | 4 (Transport) | Connection-less |
| ICMP | 3 (Network) | Used to communicate network status |
| DHCP | 5 (Application) | - UDP Server Port#: 67 <br> - UDP Client Port#: 68 |
| HTTP | 5 (Application) | - TCP/UDP Port#: 80 |
| HTTPS | 5 (Application) | - TCP Port#: 443 |
| FTP | 5 (Application) | <center> - </center> |
| SIP, H.323 | 5 (Application) | - Media session initiation protocol <br> - Used for VoIP services <br> SIP TCP/UDP Port#: 5060, 5061 |
| DNS | 5 (Application) | <center> - </center> |

* Packet Analysis
: Packet analysis is the practice of examining the contents or metadata of packets to identify interesting packets for flow analysis and content reconstruction.
  * Techniques
    * Pattern Matching
    : Interesting packets are identified by looking for specific values in packets
    * Parsing Protocol Fields
    : Interesting packets are identified by looking for unusual settings of protocol field.
    : Ex) a HTTP request with 0 window size.
    * Packet Filtering
    : Interesting packets are identified by filtering given packets with specific values in protocol fields.
    : Ex) a TCP communication between two specific nodes.

* Flow Analysis
: Flow analysis is the practice of examining related groups of packets to identify patterns, analyze higher level protocols, or extract data.
: Flow record is a subset of full-content collection.
: Flow record consists of source/destination IP address, source/destination port number, protocol and flag, date and time, the amount of data transmitted, connection status, and data-flow direction.
  * Formats of Flow Record
    * NetFlow
    : NetFlow is proprietary to Cisco.
    * IPFIX
    : IPFIX is a open-source version of NetFlow.
    * sFlow
  * Types of Trigger Events
    * The compromised system's IP address
    * Suspected time frame of malicious activity
    * Known port number for active malicious code
    * Abnormal activity
  * Analysis Techniques
    * Filtering
    : Network traffic is reduced to more manageable amount by filtering irrelevant traffic.
    * Baselining
    : The baseline of both host and network needs to be acquired before an event takes place to understand their normal status.
    * Interesting Items
    : Interesting keywords or items, such as IP addresses, port numbers, and protocols, are searched from network traffic.
    * Network Communication Pattern
      * Many to One
      : Network traffic flows from many nodes to one specific node.
      : Possible activities include DDos attack or server activity (Syslog server, file server, email server).
      * One to Many
      : Network traffic flows from one specific node to many nodes.
      : Possible activities include server activity (web server, email server), SPAM bot, or port scanning.
      * Many to Many
      : Network traffic flows from many nodes to many nodes.
      : Possible activities include P2P file sharing or widespread malware infection.
      * One to One
      : Network traffic flows from one specific node to another specific node.
      : Possible activities include server communication or targeted attack.
      * Complex Pattern
      : Network traffic flows in complex pattern.
      : This type network traffic needs IOC development.

* Higher-Layer Traffic Analysis
  * HTTP (Hyper Text Transfer Protocol)
    * Port#: 80
    * Methods
    : A method is a type of requests by client computers.
    : The followings are types of methods.
      * *Get*
      : This method is used to retrieve the resource at a given URI from a server.
      * *Head*
      : This method is used to retrieve only the hreader information of the resource at a given URI from a server.
      * *Post*
      : This method is used to send a given data to the resource at a given URI in a server for processing.
      * *Put*
      : This method is used to upload a given data at a given URI to a server.
      * *Delete*
      : This method is used to delete the resource at a given URI in a server.
      * *Trace*
      : This method is used for a server to echo the request from a client back to the client.
      * *Options*
      : This method is used to obtain information about the communication with a server.
      * *Connect*
    * Status Codes
    : A status is a type of messages by a server in response to a method by a client.
    : The followings are types of responses.
      * 1xx
      : This response is sent to inform that a request has been received and is being processed.
      * 2xx
      : This response is sent to inform that a request has been successfully processed.
      * 3xx
      : This response is sent to request a further action from a client to process a given request.
      * 4xx
      : This response is sent to inform that a given request is not valid, meaning the client-side error.
      * 5xx
      : This response is sent to inform that a request is valid but cannot be processed, meaning the server-side error.
  * SMTP (Simple Mail Transfer Protocol)
  : *Base64* is used to encode emails.
    * Port#: 25 (relay), 587 (Submission), 465 (deprecated but for SMTPS), 2525 (Not Official but for submission)
    * Types of Commands
      * *HELO*
      : This command is used to open a connection.
      * *MAIL*
      : This command is used to specify return address.
      * *RCPT*
      : This command is used to specify the recipient's address
      * *DATA*
      : This command is used for message contents.
    * Terminology
      * MUA (Mail User Agent)
      : It is the end-user's mail client.
      * MSA (Mail Submission Agent)
      : It is the agent in the sender-side's organization that is in charge of sending an email from the sender.
      * MTA (Mail Transfer Agent)
      : It transfers emails between servers.
      * MX (Mail Exchanger)
      : It accepts the messages from a domain.
      * MDA (Mail Delivery Agent)
      : It is the agent in the receiver-side's organization that is in charge of delivering an email to the receiver.
  * DNS (Domain Name System)
  : DNS provides the IP address associated with a given URL to a client.
  : DNS usually works in UDP.
  * DHCP (Dynamic Host Configuration Protocol)
    * Types of Messages
      * *DHCPDISCOVER*
      : This message is sent from a client to find a DHCP server.
      * *DHCPOFFER*
      : This message is sent from a server as a response to *DHCPDISCOVER*.
      * *DHCPREQUEST*
      : This message is sent from a client to 1) request an IP address, 2) check the validity of an IP address after rebooting, and 3) extend the lease of an IP address.
      * *DHCPACK*
      : This message is sent from a server as an acknowledge response to *DHCPREQUEST*.
      * *DHCPNAK*
      : This message is sent from a server to decline a given request as a reponse to *DHCPREQUEST*.
      * *DHCPDECLINE*
      : This message is sent from a client to inform a server that the previously assigned IP address is already in use.
      * *DHCPRELEASE*
      : This message is sent from a server to inform a client that the assigned IP address will be released.
      * *DHCPINFORM*
      : This message is sent from a client to request the local information while the client already has an IP address.