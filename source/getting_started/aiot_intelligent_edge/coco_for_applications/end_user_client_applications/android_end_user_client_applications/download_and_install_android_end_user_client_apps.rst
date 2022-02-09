.. sectionauthor:: Krishna

.. _download_and_install_android_end_user_client_apps:

Download And Install
====================

Before diving into the **COCO IoT SDK Android** and getting familiar with the API, let's have a look at how to download our offering for your Android application.

1. In your Android project navigate to your root level build.gradle and add the following if not present:

.. code-block:: groovy

   repositories {
       mavenCentral()
   }

.. note::

   All the latest `releases`_ of ``cococlientsdk-android`` and
   ``cococlientsdk-java`` are published to Maven
   Central.

2. Include the **COCO IoT SDK Android** and **COCO Client SDK Java** dependencies in module/app level build.gradle files:

.. code-block:: groovy
   :caption: **app/build.gradle**

     implementation 'buzz.getcoco:cococlientsdk-android:<x.y.z>'
     implementation 'buzz.getcoco:cococlientsdk-java:<a.b.c>-lite'

.. tip:: 
   
   - :strong:`cococlientsdk-java:x.y.z-lite` is a Java-only JAR, without native .so binaries,     
   - :strong:`cococlientsdk-java:x.y.z` is a fat JAR included with .so for all platforms.
   - :strong:`cococlientsdk-android:a.b.c` already comes with the necessary .so binaries therefore using :strong:`cococlientsdk-java:x.y.z-lite` version is encouraged.

3. Run :kbd:`sync` from the toolbar and Gradle build tool downloads the Android and Java flavoured **COCO Client SDK** binaries for provided versions.

.. important::

   It is recommended to use the latest versions from our latest `releases`_.

.. _releases: https://search.maven.org/search?q=buzz.getcoco/
