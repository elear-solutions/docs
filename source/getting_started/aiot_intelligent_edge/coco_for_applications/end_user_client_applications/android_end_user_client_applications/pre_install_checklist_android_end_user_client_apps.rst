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
    - Therefore *Client ID* and *Redirect URI* are essential for a developer to handle authentication of his user. The steps for generation are found in :ref:`Native Apps <native_apps>` section.

The IoT Sample App will work either with the aforementioned **Device App**, or with Zigbee or Z-Wave **Light Bulbs** or **Temperature Sensors**.

Setup Device App
    - Device app is a software gateway that simulates a COCO Device and is built using COCO platform's Device SDK.
    - Visit :ref:`COCO for Devices <linux_coco_for_devices>` for steps to compile, run and add the sample device app to your COCONet.

Adding Zigbee Light bulb using COCO App
    - To try out this Sample App with Zigbee Devices, use our physical COCO Gateway and add it to your own COCONet using the COCO App.
    - Download and install **COCO Home** from `Google Playstore <https://play.google.com/store/apps/details?id=buzz.getcoco.cocoapp>`_.
    - Connect to a COCONet that has a physical COCO Gateway added after logging in using COCO credentials.
    - On home_screen click on **(+)** floating action button to expand.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/home_screen.png
        :scale: 40
        :align: center

    - Choose **Devices** in the expanded bottom sheet.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/fab_add_device.png
        :scale: 40
        :align: center

    - Choose **Bulb** to add Zigbee bulb.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_device_type.png
        :scale: 40
        :align: center
    
    - Choose **Zigbee** protocol and continue.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_resource_protocol.jpeg
        :scale: 40
        :align: center

    - Choose your COCO gateway to pair the Zigbee bulb and proceed wih continue.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_resource_pair_with_gateway.jpg
        :scale: 30
        :align: center

    - Make the zigbee bulb resource in announcing mode, After successful discovery of bulb select **Add**.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_resource_scanning.jpg
        :scale: 30
        :align: center

    - Resource addition in progress is shown below.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_resource_progress.jpg
        :scale: 30
        :align: center

    - Successful addition of Zigbee bulb indicated as below, click done and the resource tile is displayed in the default zone.

    .. image:: /_static/android_end_user_client_applications/pre_install_checklist_android_end_user_client_apps/add_resource_success.jpg
        :scale: 30
        :align: center

    - Now that the Zigbee bulb has been added to your COCONet, we should be able to view it and send commands to it when we log into IoT Sample App and connect to this COCONet.
