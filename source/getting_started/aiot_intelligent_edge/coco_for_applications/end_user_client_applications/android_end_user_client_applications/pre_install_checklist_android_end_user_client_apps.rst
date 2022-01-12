.. _pre_install_checklist_android_end_user_client_apps:

Pre-Install Checklist
=====================

.. sectionauthor:: Krishna

The following are necessary to try out the **IoT SDK Android** and **Sample App**:

Git
    - To clone the Sample App repo from Github.
    - `Git Installation <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_

Android Studio
    - To run the Sample App on an Android device or an emulator.
    - `Android Studio Installation <https://developer.android.com/studio/install>`_

Generating Client ID and Redirect URI
    - If not using third-party login, the Client ID and Redirect URI are essential for a developer to handle authentication of his user.
    - The steps for generation are found in :ref:`Manage the Buzz <native_apps>`.

Setup Device App
    - Device app is a gateway that comes with a **Network** which contains a **Resource** for demo purpose.
    - Currently the Resource provided has 2 capabilities named **CapabilityOnOff** and **CapabilityTemperatureSensing**.
    - Visit :ref:`COCO for Devices <linux_coco_for_devices>` to compile and run the sample device app provided.
