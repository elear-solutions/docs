.. sectionauthor:: Krishna

.. _quick_start_guide_android_media_client_apps:

Quick Start Guide
=================

**COCO Sessions** sample app illustrates COCO Media SDK Android's ability to communicate in real time via text, audio, and video.

This tutorial will walk you through the process of setting up our example app and experience how we integrated the **COCO Media SDK**.

Step1: Clone the Sample App repo
   - Visit `COCO Sessions Repo`_ on official `Elear Solutions`_ organization account, you can either clone using 

     .. code-block:: shell
  
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
      This screen allows the user to login passing his external user ID and base url of Node sample token server.

   .. image:: /_static/android_end_user_media_client_applications/pre_install_checklist/sessions_login.jpeg
      :scale: 40
      :align: center

   - ViewSessionsActivity
      This screen displays all the MediaSessions that a user is part of. It also facilitates joining and deletion of those sessions.

   .. image:: /_static/android_end_user_media_client_applications/pre_install_checklist/sessions_view_sessions.jpeg
      :scale: 40
      :align: center

   - CreateSessionActivity
      This screen receives the name of the session that the user wishes to create and directs the user to CallerActivity.

   .. image:: /_static/android_end_user_media_client_applications/pre_install_checklist/sessions_create_session.jpeg
      :scale: 40
      :align: center

   - CallerActivity
      This screen appears once the session has been successfully created or joined.

   .. image:: /_static/android_end_user_media_client_applications/pre_install_checklist/sessions_caller_activity.jpeg
      :scale: 40
      :align: center

   - InviteUserActivity
      This screen allows you to invite a person to a :term:`session` by providing his user ID.

   .. image:: /_static/android_end_user_media_client_applications/pre_install_checklist/sessions_invite_user.jpeg
      :scale: 40
      :align: center

.. _COCO Sessions Repo: https://github.com/elear-solutions/cocomediasdk-android-video-conference-sample-app

.. _Elear Solutions: https://github.com/elear-solutions
