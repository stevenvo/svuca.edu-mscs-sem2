# CS540-Summary-Chapter-04-IPv6

[TOC]

## IPv6 Protocol

### IPv6 Addresses
* The IP address in IPv6 is 128-bit long, which is or 32 hex digits, or 16 bytes. 
    * The address is broken down to 8 chunks, each has **4 hex digits**. (Note: each hex digit represents 4 bits, so 2 hex digits represent 1 byte, 4 hex digits = 2 bytes)
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/78dc3c5d-f86c-45ff-93ea-d96f029bd461.png)
* The address can be abbreviated (shorten) for '0' values. 
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/a50aee59-aa3d-4647-ad9e-e7ccbe041551.png)
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/c8d7c9a3-0376-4edb-85e2-1d46f7f05e53.png)

* IPv6 is classless, i.e. class defined by /x.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/932926bd-20da-448c-8bdd-51ff2471489f.png)

* Address Type
    * **Unspecified** is an IPv6 address in the block of `::/128`, all 0s, equivalent to **0.0.0.0 in IPv4**, _only used for source address_. 
    * **Loopback** is an IPv6 address in the block of `::1/128`, used for the loopback address of the local host which is the **equivalent of the 127.0.0.1 in IPv4**. 
    * **Multicast** is an IPv6 address in the block of `FF00::/8`, prefixed with 1111 1111, then followed by 4 flag bits, and 4 scope bits, and then the 112 bits group ID of devices that subscribe to receive the packets. It is equivalent to **224.0.0.0/4 in IPv4**. IP Multicast is a method of **sending data to a group of hosts in a single transmission**. The same IP Multicast Address is used for both the sending host & the receiving hosts. Sending host would use it as the destination to send the message to while the receiving hosts use it to subscribe to or in other words, inform the network that they want to receive the message sent to that multicast address. 
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/e3154da2-b1ed-40c3-bff2-1e99fc24506e.png)
        * Group ID of the well known IPv6 Multicast
            ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/f33709d1-7b81-4425-b30d-9c42bb0a56a7.png)
        * Solicited-Node Multicast Address: to have a solicited node multicast address (for each of its configured unicast or anycast address), takes the last 24 bits of its IPv6 Unicast or Anycast address and append to `FF02::1:FF00:0/104`.
            ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/ecf294a5-0762-416f-bbec-6785067f7706.png)


    
    * **Link Local Unicast** is an IPv6 address in the block of `FE80::/10`, prefixed with 1111 1110 10. If a host _doesn't have any IP address_ assigned and also _failed to receive a DHCP_ address, the host gets assigned an address within the **169.254.0.0/16 block in IPv4**, which is equivalent to IPv6 link local address, FE80::/10 prefix. 
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/fd688ae0-2010-4079-9ffc-e5ed2de75001.png)

    * **Compatible address**: stores the 32bit IPv4 address in the last 32 bits (8 hex, 2 chunks), probably deprecated over Mapped address.
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/322a2e0a-4b17-42a2-9598-0989cf29ec59.png)
    * **Mapped address**: is a mechanism to represent IPv4 address in a v6. With this mechanism, the application need only do a listen using the IPv6 API, and it can accept both IPv4 and IPv6 connections through the same API. If the destination address in the sockaddr structure is a mapped address, it'll go through the IPv4 stack, otherwise it'll use the IPv6 stack.
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/beb533d2-f33f-48e6-bde5-a0407a539be3.png)
    * **Unique Local Address** (ULA) is an IPv6 address in the block of `FC00::/7`, is the approx **IPv6 counterpart of IPv4 private address** (192.168, 172.0, 10.0)
    * **Global Unicast Address** is a _public routable address_, obtained by registering through ICANN. It **contains 48 bits global routing prefix** (similar to subnet mask, a numerical value written in CIDR notation that we use to determine how many bits counting from the left are used for the network/subnet portion of the IP address), followed by 16 bit subnet and 64 bit interface ID. 
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/bfc79696-7e57-4619-add9-3606c23c9822.png)
        * The **48 bit global routing prefix** is broken up into 4 chunks, to identify major site:
            * **Prefix** (3 bits): all set to 1s.
            * **TLA ID** (top level aggregator ID - 13 bits): Allocate to ISP level.
            * **Reserved block** (8 bits): reserved for future. 
            * and **NLA ID** (Next Level Aggregator ID - 24 bits). 
            ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/7c11ae57-0382-4fb3-96e9-b5057b91dd84.png)
        * **16 bits Subnet ID** & **64 bits Interface ID** is for used within the organization


_Summary_

Name | Prefix | IPv6 | IPv4 Equivalent
---- | --- | --- | --- 
Unspecified |  | `::/128` | 0.0.0.0
Loopback | | `::1/128` | 127.0.0.1
Multicast | `FF00` | `FF00::/8` | 224.0.0.0/4
Link Local Unicast | `FF80` | `FF80::/10` | 169.254.0.0/16
Mapped address | `0::FFFF` | `0::FFFF:{4hex}:{4hex}` <br/>(last 8 hex is 32 bit IPv4 IP address) | Any IPv4 address
Unique Local Address | `FC00` | `FC00::/7` | 10.0., 172.0., 192.168. 

### EUI-64
* A 64-bit interface identifier is most commonly derived from its 48-bit MAC address. A MAC address 00:0C:29:0C:47:D5 is turned into a 64-bit EUI-64 by inserting FF:FE in the middle: 00:0C:29:FF:FE:0C:47:D5.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/1caf3f89-49b3-44e0-97f9-ec78eb1ef709.png)
* And invert the 7th bit (Universal/Local flag)
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/57727ca9-eeea-45d9-962a-f950820e2487.png)

### 3 types of IPv6 Addresses
* Unicast: to a single interface
* Anycast: to an interface of the group/set
* Multicast: to all interfaces of the group/set


### IPv6 Datagram
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/ea691c30-067a-4f00-9dad-f660651abb42.png)

* in IPv6 network layer, all ARp, IGMP... is merged into ICMPv6.
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/9c3eb6a6-352b-4005-affb-961d1c175a99.png)


#### IPv6 Header
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/a2158f9c-3ed9-4830-a21d-b9725dee3011.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/d6ff6d90-b648-4cf6-b290-d59aefb9044c.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/5b61becc-fb1f-46ed-b06c-8de95ca49d4c.png)

#### Extension Header
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/4c256196-25db-4f10-bc76-cf5fb6e2d7e0.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/42e5d05f-b3e1-4cd5-895b-e8d9948b5cad.png)

#### Source Routing (Extension Header)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/c200aed1-b589-449d-8228-7362e24ec39a.png)
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/6ab704d6-8b0a-49e4-aeb3-e2dbc3e160f2.png)

## ICMPv6
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/9c3eb6a6-352b-4005-affb-961d1c175a99.png)

* ICMP protocol is 1 in v4, and 58 in v6.
* ICMPv6 protocol used for reporting errors, performing diagnostics (ICMP), perform Neighbor Discovery, report multicast memberships (IGMP), and ARP. 
* There are 2 categories of ICMP messages: Error Reporting, and Query.
    * **Error Reporting**: Destination Unreacheable, Packet too big (NEW - needed in IPv6 and not IPv5 because IPv5 does fragmentation while IPv6 does not), Time exceeded, Parameter Problems, Redirection.
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/dddd48f0-f219-433d-812a-0f997191e461.png)
    * **Query**: Echo (request/reply), router solicitation and advertisement, neighbor solicitation and advertisement, group membership.
        ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/7b1a7f69-1fe4-4e70-8cef-c7ce18fdc56b.png)


## Path MTU Discovery for IPv6
* To enable hosts to **discover the minimal MTU on a path** to a particular destination since there is no fragmentation in IPv6 by intermediary routers.
* Base on this, the source node will do the fragmentation itself. 
* The default MTU in IPv6 is 1280 bytes (vs 576 bytes in IPv4)

### Path MTU Discovery Process
![](https://dl.dropboxusercontent.com/u/24437878/screenshots/75e4f570-f1a4-42fd-8072-fde9c8632dd2.png)

![](https://dl.dropboxusercontent.com/u/24437878/screenshots/3988c643-40df-4562-8482-41a9928a4f7d.png)

## IPv6 NDP (Neighbor Discovery Protocol)
* is a messaing protocol that is similar to ARP but more than that (no ARPv6).
* IPv6 ND is a set of messages and process that determine relationship between neighboring nodes. 
    * Used by host to discover neighboring routers. 
    * Used by host to discover addresses, prefix, other config params
    * Used by routers to advertise their presense
    * Used by routers to inform hosts of better route.
* Uses ICMPv6 Control messages
    ![](https://dl.dropboxusercontent.com/u/24437878/screenshots/dce29c40-15d8-467d-9fcc-9cf9e877cde7.png)
