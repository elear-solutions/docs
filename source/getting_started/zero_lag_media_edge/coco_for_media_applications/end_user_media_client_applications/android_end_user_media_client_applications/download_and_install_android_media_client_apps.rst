.. _download_and_install_android_media_client_apps:

Download And Install
====================

.. sectionauthor:: Krishna

Before diving into the **COCO Media SDK Android** and getting familiar with the API, let's have a look at how to download our offering for your Android application.

1. In your Android project navigate to your root level build.gradle and add the following if not present:

   .. code-block:: groovy
   
      repositories {
          mavenCentral()
      }

.. note::

   All the latest `releases`_ of ``cocomediasdk-android`` and
   ``cocomediasdk-java`` are published to Maven
   Central.

2. Include the **IoT SDK Android** and **Java** dependencies in module/app level build.gradle files:

   .. code-block:: groovy
      :caption: **app/build.gradle**
   
        implementation 'buzz.getcoco:cocomediasdk-android:<x.y.z>'
        implementation 'buzz.getcoco:cocomediasdk-java:<a.b.c>-lite'
   
.. tip:: 
   
   - :strong:`cocomediasdk-java:x.y.z-lite` is a Java-only JAR, without native .so binaries,     
   - :strong:`cocomediasdk-java:x.y.z` is a fat JAR included with .so for all platforms.
   - :strong:`cocomediasdk-android:a.b.c` already comes with the necessary .so binaries therefore using :strong:`cocomediasdk-java:x.y.z-lite` version is encouraged. 
   
3. Gradle build tool downloads the **COCO Media SDK Android** and **COCO Media SDK Java** binaries for provided versions. It is recommended to use the latest versions from our latest `releases`_.

.. _releases: https://search.maven.org/search?q=buzz.getcoco/
