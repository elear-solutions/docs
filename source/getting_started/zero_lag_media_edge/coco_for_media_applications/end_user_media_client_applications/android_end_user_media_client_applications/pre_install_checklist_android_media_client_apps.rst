.. sectionauthor:: Krishna

.. _pre_install_checklist_android_media_client_apps:

Pre-Install Checklist
=====================

The following are necessary to tryout the **COCO Media SDK Android** and **COCO Sessions** sample app.

Git
   - To clone the **COCO Sessions** app repo from Github.
   - `Git Installation <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_.

Android Studio
   - To run the **COCO Sessions** app on Android device or an emulator.
   - `Android Studio Installation <https://developer.android.com/studio/install>`_.

Node Sample Token Server
   - It is a Third-party server that will authenticate itself with COCO server to receive access and refresh tokens. If you do not fall under :ref:`Service apps <introduction_to_service_apps>` category skip this.
   - Clone `sample token server <https://github.com/elear-solutions/nodesampletokenserver>`_ preferably in an linux machine and run the steps provided in that repo's README.md
   - If the machine has domain name then it will be accessed using it's domain
   - If the machine is local to the phone running the app. Then get the ip address of the machine running token server along with the port of the sample server.
