.. _sample_app_walkthrough_android_end_user_client_apps:

Sample App Walkthrough
======================

.. sectionauthor:: Krishna

The IoTSample app demonstrates the ability of the **COCO IoT SDK** in monitoring *temperature* and transmiting *ON/OFF* switching commands.

This tutorial will walk you through the process of setting up our example app and experience how we integrated the **COCO IoT SDK**.

Step1: Clone Sample App Repo
   - Visit `SampleApp Repo`_ on official `Elear Solutions`_ organization account, you can either clone using

     .. code-block:: bash
  
         git clone git@github.com:elear-solutions/cococlientsdk-java-iot-sample-app.git 

    or `download source code <https://github.com/elear-solutions/cococlientsdk-java-iot-sample-app/archive/refs/heads/main.zip>`__.

   - After unpacking the downloaded ZIP or cloning the repo we are good to
     start with Android Studio.


Step2: Verify Dependencies
   -  Now that you have cloned/downloaded the code, import the project to Android Studio.

   -  Verify that the **IoT SDK Android** and **Java** dependencies are included:

   .. code-block:: groovy
      :caption: **app/build.gradle**
   
        implementation 'buzz.getcoco:cococlientsdk-android:0.8.0'
        implementation 'buzz.getcoco:cococlientsdk-java:0.21.0-lite'

Step3: Enter ClientID and Redirect URI
   -  Enter your **ClientID** that you generated during pre-install steps.
   
   .. code-block:: xml
       :caption: **app/src/main/AndroidManifest.xml**
       :emphasize-lines: 3
   
          <meta-data
            android:name="buzz.getcoco.auth.client_id"
            android:value="your_client_id_here"/>
   
   -  In order to capture OAuth enter your **Redirect URI** in ``<activity>`` element that you generated during pre-install steps.
   
   .. code-block:: xml
       :caption: **app/src/main/AndroidManifest.xml**
       :emphasize-lines: 8
   
          <activity
            android:name="buzz.getcoco.auth.CocoRedirectActivity"
            android:exported="true">
            <intent-filter>
              <action android:name="android.intent.action.VIEW"/>
              <category android:name="android.intent.category.DEFAULT"/>
              <category android:name="android.intent.category.BROWSABLE"/>
              <data android:scheme="your_redirect_scheme_here"/>
            </intent-filter>
          </activity>

-  Its time to launch the app, connect your Android device to your PC
   and click **Run** on Android Studio toolbar.

Step4: Navigating Through Sample App
   Sample app comprises of 3 steps/screens:
   
   :menuselection:`Login with COCO --> Connect to CocoNets in your account --> View Resources in your CocoNet`
   
   - Login with COCO
      This screen demonstrates the primary COCO user login following OAuth 2.0 protocol.
   
   - Connect to CocoNets
      This screen demonstrates how to fetch all the Networks of a CocoClient and connect to one.
   
   - View Resources
      This screen shows how to obtain Resources from all Zones, send *ON/OFF* commands, and display realtime *current temperature* Attribute changes.


.. _SampleApp Repo: https://github.com/elear-solutions/cococlientsdk-java-iot-sample-app

.. _Elear Solutions: https://github.com/elear-solutions
