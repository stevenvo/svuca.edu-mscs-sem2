# CS540 - Network II - Chapter 01

[TOC]


## Definitions

* **Protocol Architecture**: each layer performs a subset of functions, change in one layer should not require changes in other laywers. Key features: syntax, semantics, timing.
* The services between adjecent layers are expressed in terms of **primitives** (functions to be performed) and **parameters** (input/output, and control info).
    * Service Primitives
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/97e7dcae-eed0-4cd9-9c1b-e680bf002e3b.png)

* Socket is the **concatenation of a port value and an IP address**, and is **unique** through out the Internet. Categorized into stream sockets, datagram sockets and raw sockets. 
* Elements of routing techniques for **Packet Switching Networks**
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/f91b4bbf-b55e-4c11-b307-576d8298b334.png)
* **AS (Autonomous System)**: is a set of routers and networks in a single organization. There is a path between any pair of nodes in AS.
* **IRP (Interior Router Protocol)**: a shared routing protocol for passing _routing information_ **within an AS**.
* **ERP ( Exterior Router Protocol)**: protocol use for passing _routing information_ **between different ASs**. Eg., BGP (Border Gateway Protocol), OSPF (Open Shortest Path First)
* **Internet Routing protocol** uses 3 approaches for gathering routing information: 
    * **Distance-vector routing**: exchange of vector of **link costs** between each node and **its neighbors** (next hop). Used by RIP.
    * **Link-state routing**: the router determines the link cost **on each of its interfaces** and advertise **to ALL other routers** in the same network, _not just the neighbors_. This is a better version of Distance vector routing. 
    * **Path-vector routing**: does not include a distance or cost est, but include the routing information list of all the ASs that need to be crossed in order to reach the destination. Usually used for security purpose (to avoid certain ASs) or for QOS (base on the quality metrics such as link speed, capacity). 


## Network Layers 

This section will go through the network layers from bottom up.

### Some sample protocols/models

#### TCP/IP Layers and example protocols
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/3ff2bcaa-2678-40e5-b0cb-77c21b07f489.png)

#### OSI Model

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/53587bbc-2b55-41a8-8fb0-b49e37c8ad2a.png)

#### IEEE 802 Protocol Layers
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/a970edaa-9c7c-4121-9aca-5245845f7a45.png)


#### OSI v/s IEEE 802
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/04e4b919-0aff-4631-aa0c-9fb4dc5f5d3f.png)

#### OSI v/s TCP/IP
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/5e6ead76-aa76-431c-8888-dacc02cd8fd3.png)

*Notes: in TCP/IP, sometimes Network Access also includes the Physical layer.*


### Physical layer
Has the same definition for OSI, IEEE 802 or TCP/IP.
It covers the **physical interface** between computer and network and concern with:

* Transmission Medium
* Nature of signals
* Data Rates

In **IEEE 802**, physical layer includes functions:

* Encoding/decoding of signals
* Preamble generation / removal (for synchronization)
* Bit transmission/reception


### Network Access / Data Link Layer
Covers the **exchange of data** between an end system and the network, concerned with: 

* **access and routing** of data between the system and the neighborhood networks.

This layer is equivalent to these layers in different protocols/schemes.

* Data Link (OSI)
* LLC / MAC [^llcmac] (IEEE 802)
* Network Access / Data Link (TCP/IP)

In **TCP/IP**, Network Access Layer can be Ethernet, Token Ring, Frame Relay, or ATM. 

In **IEEE 802**, this layer consists of 2 sub-layers, from bottom up: 

* **MAC** (Medium Access Control): 
    * assembles data into frame on transmision
    * disassembles frame into data on reception
    * performs address recognition & error detection (NO flow control)
    * controls access to transmission medium
* **LLC** (Logical Link Control): 
    * performs flow and error control.
    * provides interface to higher level by **service access points** (SAPs).

#### MAC and LLC data frame structure:
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/5142f668-e97a-4eef-a806-b2c1db6ee086.png)

**Notes:**

* MAC has header and trailer (CRC), while
* LLC only has header.

#### LLC PDU (Protocol Data Unit) Structure:
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/21b97a7d-0ce9-4d92-bbdd-64c097262134.png)

#### MAC Protocol
* Control of access to transmission medium in 2 schemes:
    * **Centralized**: a controller is designated to grant access to network; or
    * **Distributed**: each station works out how it should transmit the data in order.
* Access control techniques using:
    * **Synchronous**: specific capapcity is dedicated to a connection. Similar approach used in Circuit Switching, FDM, and TDM.
    * **Asynchronous**: dynamic allocation of capacity on demand, subdivided into 2 cats: round robin, reservation, and contention. 

**MAC frame fields:**
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/d8778f78-76e7-4eb9-b152-de8d95afdb62.png)

### Internet Layer
* named Internet Layer (TCP/IP), or Network layer (OSI)
* use **IP (Internet Protocol)** to provide routing function across multiple networks. 
    * Some **IP design issues**: 
        * Routing, includes: 
            * a **routing table** (dynamic, static) is maintained on each node. 
            * a routing technique called **Source Routing** can also be used to predefine a special path.
            * a service called **Route Recording**, useful for testing and debugging.
        * Datagram lifetime: prevent looping.
        * Fragmentation and reassembly: break the data up into smaller blocks, for effecient transmission.
        * Error control: discard datagrams if lifetime expires, congestion or FCS error.
        * Flow control: allows routers to limit the data rate they receive, using ICMP messages, usually when destination unreacheable, time exceeded, parameters problem,, source quench, redirect, echo, address mask request/response or timestamp.
    * **IP Services**:
        * the **primitives** specify the function to be performed, and
        * the **parameters** are used to pass data and control info. These parameters are defined in the IP header.
        * other IP Options (extended after the Header) are security, source routing, route recording, stream identification and timestamping. 
* use **ARP (Address Resolution Protocol)** to convert an IP address into a physical address (MAC address), usually on the last hop to deliver the data to the correct host. A host wishing to obtain a physical address broadcasts an ARP request onto the TCP/IP network. The host on the network that has the IP address in the request then replies with its physical hardware address.
* connectionless operation at the Internet Protocol (IP) level.
    * _Advantage_: flexible, can be made robust, no unecessary overhead.
* 


#### IPv4 Header
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/ffcbe076-8b5a-4545-80f5-d977a4be105d.png)
_Notes:_

* IPv4 Header size is 20 bytes (or 20 octets)
* Source address, destination address occupies 4 bytes (32 bits) each.
* each row is 4 bytes

#### IPv6 Header
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/fc4b149b-f422-41a5-8d83-812b524177f7.png)

_Notes:_

* IPv6 Header size is 40 bytes (or 40 octets), twice the size of IPv4 Header.
* Source address, destination address occupies 16 bytes (128 bits) each.
* Fragmentation is removed from main header (moved to extension header).
* each row is 4 bytes

##### IPv6 Enhancements
* 128 bit address space
* improves option mechanism with extension headers
* dynamic address assignment
* introduces anycast (one of a set of interface addresses) and multicast (all of a set of interfaces)
* flow label: to relate sequence of packets that have the same flow, or special handling of packets.


![](https://dl.dropboxusercontent.com/u/24437878/screenshots/589ef8fe-101f-4aec-a8a8-8b682e9e3a45.png)


#### Example of Internet Protocol Operation
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/8cd39ab1-861b-484c-b076-6dd9bea6359b.png)
**Notes:**

* No change to IP Header, only change at MAC, LLC, FR.


### Transport Layer
* uses the same name in both TCP/IP and OSI.
* provides reliable end-to-end service (TCP) or unreliable service (UDP)

#### TCP – Transmission Control Protocol
* Transport layer protocol used by most applications.
* Reliable, connection oriented to deal with these issues: addressing, multiplexing, flow control, and connection establishment/termination.
* Basic protocol unit is TCP segment
* Seven issues to be addressed in TCP
    * Ordered delivery
    * Retransmission strategy
    * Duplicate detection
    * Flow control
    * Connection establishment
    * Connection termination
    * Failure recovery

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/05833430-49d6-4c27-8528-e66c7dc7077d.png)
_Notes:_

* TCP Header size is 20 bytes (similar to IPv4 header)
* each row is 4 bytes

#### UDP - User Datagram Protocol
* **Unreliable**, **no guarantee** of delivery, order, or duplication.
* **Connectionless** (datagram service), fast, small header.
* Usually used for SNMP.
* Has a CRC check, but _optional_.

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/f42f4a8e-65f7-414f-8e5a-880f50720e18.png)





## Don't know where to put yet

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/8092ade6-9ab0-4098-b758-b3fe4c7393fe.png)


![](https://dl.dropboxusercontent.com/u/24437878/screenshots/3fb3df96-606c-4df6-93f1-6c402fda49ac.png)


![](https://dl.dropboxusercontent.com/u/24437878/screenshots/fcf79aab-5b2c-46ec-a942-3271ce13a391.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/fbf7581d-84f8-42dc-9e38-1758d5d42f39.png)


[^llcmac]: LLC: Logical Link Control, MAC: Medium Access Control.