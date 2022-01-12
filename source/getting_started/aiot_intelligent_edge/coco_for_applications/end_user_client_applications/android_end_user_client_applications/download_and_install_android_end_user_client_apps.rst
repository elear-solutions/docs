.. _download_and_install_android_end_user_client_apps:

Download And Install
====================

.. sectionauthor:: Krishna

Before diving into the **IoT SDK Android** and getting familiar with the API, let's have a look at how to download our offering for your Android application.

1. In your Android project navigate to your root level build.gradle and add the following if not present:

.. code-block:: groovy

   repositories {
       mavenCentral()
   }

.. note::

   All the latest `releases`_ of ``cococlientsdk-android`` and
   ``cococlientsdk-java`` are published to Maven
   Central.

2. Include the **IoT SDK Android** and **Java** dependencies in module/app level build.gradle files:

.. code-block:: groovy
   :caption: **app/build.gradle**

     implementation 'buzz.getcoco:cococlientsdk-android:<x.y.z>'
     implementation 'buzz.getcoco:cococlientsdk-java:<a.b.c>-lite'

3. Gradle build tool downloads the **IoT SDK Android** and **IoT SDK Java** binaries for provided versions.

.. important::

   It is recommended to use the latest versions from our latest `releases`_.

.. _releases: https://search.maven.org/search?q=buzz.getcoco/
