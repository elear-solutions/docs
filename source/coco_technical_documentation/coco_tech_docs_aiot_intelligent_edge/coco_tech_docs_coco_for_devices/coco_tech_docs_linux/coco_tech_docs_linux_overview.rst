.. sectionauthor:: Manav

.. _coco_tech_docs_linux_overview:

Overview
========
The following repos contain the central code behind the COCO Device SDK:

**cocodevicesdk** - the main library that is linked by developers to their OEM or Virtual Device Application, providing features for devices such as joining a COCONet, adding resources, processing incoming commands, publishing attributes and so on.

**cocodb** - providing an SQLite-based database for storing all of the persistent data required by a COCO Device, such as the COCONet it belongs to, its resources and so on.
