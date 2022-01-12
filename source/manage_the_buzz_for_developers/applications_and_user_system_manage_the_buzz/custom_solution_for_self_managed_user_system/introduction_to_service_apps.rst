.. _introduction_to_service_apps:

Introduction to Service Apps
============================
Service Apps are used in scenarios:

1. Where you are providing your own user management system and bypass the COCO User management system
2. Where you are developing an application or integration that does not require authorization from a specific COCO user.

Apps that have long-running processes or that operate without interaction with a user also need a way to access secured resources.
This uses Oauth Client Credentials grant flow.

Flow
++++
.. image:: ../../../_static/serviceAppFlow.png

.. sectionauthor:: Narendra
