.. sectionauthor:: Krishna

.. _quick_start_guide_linux_java_headless_client_apps:

Quick Start Guide
=================

The **Coco Camera Object Detection** example shows how the **COCO IoT SDK Java** can be used in conjunction with `Deep Java Library <https://djl.ai/>`_ to gather snapshots periodically and run an inference to detect objects in images.

This tutorial will assist you with setting up our example app and experience how we integrated the **COCO IoT SDK Java**.

.. TODO: change download link

Step1: Clone Sample App Repo
   - Visit `SampleApp Repo`_ on official `Elear Solutions`_ organization account, you can either clone using:

.. code-block:: shell

    git clone git@github.com:elear-solutions/cococlientsdk-java-iot-sample-app.git

----

    or :download:`download source code <https://github.com/elear-solutions/cococlientsdk-java-iot-sample-app/archive/refs/heads/main.zip>`.

   - After unpacking the downloaded ZIP or cloning the repo we are good to
     start with IntelliJ Idea(Any IDE of your interest).

----

Step2: Verify Dependencies
   - Now that you have cloned/downloaded the code, import the project to IntelliJ Idea.

   - Verify that the **IoT SDK Java** dependency is included:

.. code-block:: groovy
   :caption: **build.gradle**

   implementation 'buzz.getcoco:cococlientsdk-java:a.b.c'

----

Step3: Run the example
  - This is a console based application thus the steps to run are simple, **invite** generated during pre-install steps with appropriate path should be passed as a command-line argument.

  - The following is an example of how to run the sample app using the Gradle build system:

.. code-block:: shell
   
   ./gradlew run --args=/path/to/invite.json

.. TODO: change this after repo is added

.. _SampleApp Repo: https://github.com/elear-solutions/cococlientsdk-java-iot-sample-app

.. _Elear Solutions: https://github.com/elear-solutions
