.. sectionauthor:: Krishna

.. _pre_install_checklist_android_end_user_client_apps:

Pre-Install Checklist
=====================

The following are necessary to try out the **COCO IoT SDK Android** and **IoT Sample App**:

Git
    - To clone the Sample App repo from Github.
    - `Git Installation <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_

Android Studio
    - To run the Sample App on an Android device or an emulator.
    - `Android Studio Installation <https://developer.android.com/studio/install>`_

Generating Client ID and Redirect URI
    - The IoT example app shows a login solution for developers to get apps authorized by a COCO user and build value-added service extensions for the COCO platform.
    - Therefore *Client ID* and *Redirect URI* are essential for a developer to handle authentication of his user. The steps for generation are found in :ref:`Manage the Buzz <native_apps>` section.

Setup Device App
    - Device app is a software gateway that simulates a COCO Device and is built using COCO platform's Device SDK.
    - This Sample App will work either with the aforementioned **Device App**, or with Zigbee or Z-Wave **Light Bulbs** or **Temperature Sensors**.
    - Visit :ref:`COCO for Devices <linux_coco_for_devices>` for steps to compile, run and add the sample device app to your COCONet.
