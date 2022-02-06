.. sectionauthor:: Manav

.. _coco_standard:

COCO Standard
=============

The COCO Standard is an interoperable, open source standard provided by the our AIoT platform for Resource Definition. OEM's who provide appliances or sensors, as well as providers of resource-driven services like online storage may utilize the standard to define the capabilities, commands and attributes provided by the Resources that their Buzzed-On-COCO Device supports. A Device may be either a hardware (physical) or software (virtual) device. A Resource may be pre-included with the device (such as our COCO Cameras) or capable of being dynamically added to an extendable COCO Device (such as our Zigbee & Z-Wave compatible COCO Gateways).

The COCO Standard Specification is available <here> and it defines all the Capabilities supported by our platform, and provides the following details for each Capability:

#. Commands supported by a Capability, along with the list of parameters passed to the command, and information about passing each parameter such as whether or not it is mandatory; and where applicable, the Command Response, if any, sent for a command.
#. Attributes supported by a Capability, along with pertinent information for interpreting the attribute such as its data type and valid values.
#. Information Requests supported by a Capability, along with the list of parameters passed, and information about passing each parameter such as whether or not it is mandatory; and the Information Response sent for the request.

When a Resource has a large amount of information to share with Client Applications, the OEM may choose to make that information or portions of the information available on demand. This may be driven by design constraints such as the compute, memory or other constraints potentially placed on a Client Application by streaming a large amount of data to it.
