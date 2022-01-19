.. _sample_app_walkthrough_android_media_client_apps:

Sample App Walkthrough
======================

.. sectionauthor:: Krishna

**COCO Sessions** sample app illustrates COCO Media SDK Android's ability to communicate in real time via text, audio, and video.

This tutorial will walk you through the process of setting up our example app and experience how we integrated the **COCO Media SDK**.

Step1: Clone the Sample App repo
   - Visit `COCO Sessions Repo`_ on official `Elear Solutions`_ organization account, you can either clone using 

     .. code-block:: bash
  
         git clone git@github.com:elear-solutions/cocomediasdk-android-video-conference-sample-app.git 

    or `download source code <https://github.com/elear-solutions/cocomediasdk-android-video-conference-sample-app/archive/refs/heads/master.zip>`__.

   - After unpacking the downloaded ZIP or cloning the repo we are good to
     start with Android Studio.

Step2: Verify Dependencies
   -  Now that you have cloned/downloaded the code, import the project to Android Studio.

   -  Verify that the **COCO Media SDK Android** and **Java** dependencies are included with latest versions:

   .. code-block:: groovy
      :caption: **app/build.gradle**
   
        implementation 'buzz.getcoco:cocomediasdk-android:<x.y.z>'
        implementation 'buzz.getcoco:cocomediasdk-java:<a.b.c>-lite'

Step3: Node Sample Token Server
   - Run the node sample token server as suggested in pre-install checklist.
   - Visit :ref:`guide for service apps <quick_start_guide_service_apps>` to learn more.
   - Its time to launch the app, connect your Android device to your PC and click **Run** on Android Studio toolbar.

Step4: Navigating Through Sample App
   Sample app comprises of 5 screens, described below:
      
   .. figure:: /_static/coco_sessions_flow.png
      :align: center

   - LoginActivity
      This screen demonstrates the Third-party login solution for service apps.
   
   - ViewSessionsActivity
      This screen demonstrates how to fetch all the MediaSessions that a user is part of and start the call.
   
   - CreateSessionActivity
      This screen collects the details of the call a user wants to create and navigates to CallerActivity.

   - CallerActivity
      This screen demonstrates the creation and joining the call.

   - InviteUserActivity
      This screen deals with the code to invite a user to the :term:`session` using User ID.


.. _COCO Sessions Repo: https://github.com/elear-solutions/cocomediasdk-android-video-conference-sample-app

.. _Elear Solutions: https://github.com/elear-solutions
