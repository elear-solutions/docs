.. sectionauthor:: Manav

.. _coco_tech_docs_aiot_architecture:

Architecture
============
[Insert Image - Whitepaper diagram Full.jpg]

The COCO IoT platform consists of components on the edge and the cloud interacting with each other to provide secure and private network connectivty to COCO Client Applications [link] and Devices [link].

The following are the components making up the COCO Architecture and the role they play in the system:

**Common Frameworks** [link] - librarized programming frameworks and common utilities such as Timers, Memory Management, Event Loops, Condition Variables, Unordered Memory Maps and so on.

**Cluster Transport**, **Cluster Network** and **COCO CP Interface** - jointly forming the Cluster Protocol [link], a library enabling the formation of COCONet's [link], and providing a variety of networking services to COCONet nodes, including the ability to transport packets to other nodes, framing of packets, filtering packets, allowing one node to subscribe to another for information, delivery guarantees, acknowledgements, and ultimately the delivery of a packet to the SDK layer in a format that's easy to process.

**COCO Capability Standards** - providing common COCO Standard [link] declarations and utilities to enable the implementation and use of COCO Capabilities [link], Commands [link], Attributes [link] and Info Requests [link] on COCONet nodes.

**COCO Device SDK** - the SDK for developing Device applications, for OEM's to develop physical device firmware, or for other service providers to provide a software service (such as storage) delivered over a COCONet. The Device SDK attempts to join a COCONet every time it starts up, and once joined, it provides Device Management and Resource [link] Management services to Client Applications, and via its Resources it provides commonly used IoT and IoT Next functionality in the form of Capabilities. The code is POSIX-compliant to enable it to be ported easily to a variety of platforms such as MacOS. A FreeRTOS porting of the SDK is coming soon.

**COCO Client App SDK** - a POSIX-compliant SDK for developing Client Applications which consume the Capabilities provided by Device nodes.

**Language Bindings** - language wrappers for the COCO Device and Client App SDK API's to enable the development of Client Applications on different POSIX-compliant platforms like MacOS, Linux, Android and iOS; and Device Applications on platforms like Raspberry Pi, Linux and Arduino. 

**Network Management Node** or **NMN** - a COCONet node on the Cloud that provides networking services to Client Application and Device nodes in the COCONet, such as joining and leaving a COCONet, adding Resources, Users [link] and Devices, and so on. This node provides a common connection point for all Client Application and Device nodes to join a COCONet. This node also enables peer-to-peer connections to be formed through UDP Hole Punching for lower network latency between the Client Application and Device nodes running on the edge.

**Network Management Sub-System**, **Auth Sub-System** and other Sub-Systems on the Cloud - providing a variety of services to the COCO platform edge nodes - firstly to enable Client Applications and Devices that are not already a part of a COCONet to be authenticated and authorized for joining a COCONet, and subsequently to provide services for managing said networks, as well as a variety of other COCO platform services like Device Licenses, Firmware Updates, Third-Party App Publishing (coming soon!) and so on.
