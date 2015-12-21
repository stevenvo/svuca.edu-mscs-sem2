# CS540 - Summary -Chapter-03

[TOC]

## IPv4 Forwarding
### IP Routing

* Connectionless 
    * Pros: flexible, can be made robust, no overhead
* IP Design Issues: routing, datagram lifetime, fragmentation and reassembly, error control, flow control

### Network Layer (IP Datagram, layer 3)
Hops in the Network Layer and their roles:

* **Source**: create packet, includes header (with source and dest IP), find routing info in the routing table, fragment packet if larger than MTU.
* **Router**: route/forward packet according to its routing table.
* **Destination**: verify address, reassemble frames if they are fragmented, deliver up.

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/3d7bb901-512a-480b-9eab-e9f050a40f2f.png)


#### IPv4 Header
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/ffcbe076-8b5a-4545-80f5-d977a4be105d.png)
_Notes:_

* IPv4 Header size is 20 bytes (or 20 octets), max 60 bytes, count by multiple of 4.
* Source address, destination address occupies 4 bytes (32 bits) each.
* each row is 4 bytes

### IPv4 address
* IPv4 address is 32 bit long
* In **classful** (almost obsolete) addressing, address space is divided into A, B, C, D, and E. And a large part of available addresses were wasted.
* In replace, we have **classless** addressing: `x.y.z.t/n`, for example 205.16.37.32/28.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/8c66b83c-4fdb-4968-958f-e6a3f826ea0e.png)

### Packet Switching
Handled in 2 ways:

* Datagram: each packet is independent, can take any route, go out of order or may be missing, more flexible. **Datagram technique is used by the network layer**. 
* Virtual circuit: preplanned route for all packets, handshake when connection establishes, each packet contains a virtual circuit identifier instead of destination address. (still no dedicated path, shared medium) Packet forwarded faster, but less reliable. 
* IPv4 is unreliable, connectionless datagram protocol. 
* Fragmentation is required if packet size larger than MTU.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/b6065d25-2436-45e6-8bc9-8d4bd8d7087e.png)
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/d9736d02-7f4f-484b-8567-c067954a68e3.png)

### Routing Table (important)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/4599f6f5-0c5a-4a42-953b-342c4f79760f.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/b4b46593-1448-43d5-a0c2-59ab05c8281b.png)


## ARP/RARP/GARP
A packet can be delivered to a host requires 2 types of addressing:

* Logical: IP address
* Physical: MAC address

### ARP (Address Resolution Protocol)
* ARP is used to map Logical address to Physical address, i.e. convert IP address to MAC address.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/0aa52dd0-42d4-4f98-aebb-a66a23241990.png)
* Four cases of using ARP:
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/c039679b-572c-4652-9e15-6843508a22a6.png)
* An ARP request is broadcast, an ARP reply is unicast.

Example:
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/5f2a39ba-f5f7-40c3-9a4f-963af3250ad8.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/53a2ed47-bc29-4902-aabb-7f666a47d979.png)

### RARP (Reverse Address Resolution Protocol)
* Use the PHY address to get the LOGICAL address using RARP.
* RARP is also broadcast on local network.

### GARP (Gracious ARP)
* Advertise the MAC before people ask for. Benefits:
    * when the device moves, it can inform its new location
    * reduce unecessary asking traffic in broadcast. 

## ICMP (Internet Control Message Protocol)
* for tranferring messages between host/router/host
* provide feedbacks about problems
    * destination unreacheable
    * TTL exeeced 
    * parameter problem
    * source quench
    * redirect
    * echo and echo reply
    * timestamp and timestamp reply
    * address mask request and reply
* No ICMP error msg will be generated in response to a datagram carrying an ICMP error message.
* ICMP error msg is only generated for first fragment. 
* No ICMP for special address such as 127.0.0.0 or 0.0.0.0