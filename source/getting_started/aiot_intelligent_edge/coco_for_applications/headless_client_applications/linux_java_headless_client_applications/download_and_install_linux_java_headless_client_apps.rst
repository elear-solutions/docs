.. sectionauthor:: Krishna

.. _download_and_install_linux_java_headless_client_apps:

Download And Install
====================

Before diving into the **COCO IoT SDK Java** and getting familiar with the API, let's have a look at how to download our offering for your Headless Linux Java application.

1. All the latest `releases`_ of  ``cococlientsdk-java`` are published to Maven Central. As a result, whatever IDE a developer wants, the **COCO IoT SDK Java** can be downloaded using the *Gradle* or *Maven* build system.

2. If your Java project uses Gradle build system one can simply add the following dependencies in module/app level ``build.gradle``.

   .. code-block:: groovy
      :caption: **build.gradle**

      implementation 'buzz.getcoco:cococlientsdk-java:<a.b.c>'

3. If using Maven build system, add the following in your ``pom.xml``.

   .. code-block:: xml
      :caption: **pom.xml**

      <dependency>
        <groupId>buzz.getcoco</groupId>
        <artifactId>cococlientsdk-java</artifactId>
        <version>a.b.c</version>
      </dependency>

.. note::

   - :strong:`cococlientsdk-java:a.b.c-lite` is a Java-only JAR, without native .so binaries,     
   - :strong:`cococlientsdk-java:a.b.c` is a fat JAR included with .so for all platforms.
   - Thus it is recommended to use :strong:`cococlientsdk-java:a.b.c` for Headless Java applications.


 .. _releases: https://search.maven.org/search?q=buzz.getcoco/
