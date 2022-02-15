.. sectionauthor:: Deekshith

.. _quick_start_guide_browser_js_analytics_client_apps:

Quick Start Guide
=================

.. sectionauthor:: Deekshith

.. Suggestions from Ashish - Steps to Sync Sources, Compilation, and Running Successfully. Also mentioning how Auto-Magically things connect to the COCO App

1. Application Build Process
----------------------------

a. Register an Single Page Application from here :ref:`quick_start_guide_single_page_apps`

b. Clone sample application from `Github <https://github.com/elear-solutions/cocoanalyticssdk-js-energy-sample-app>`_ and checkout to master branch

c. Steps to build

   - update `CLIENT_ID` in `cocoanalyticssdk-js-energy-sample-app/src/environments/environment.ts`
   - npm i
   - ng serve

d. Now you can see your application at **http://localhost:4200**

2. Application usage
--------------------
a. Login to coco user account which has resources updating analytics data. after login you will see a page as shown below

  .. image:: ../../../../../_static/getting_started/aiot_intelligent_edge/coco_for_applications/analytics_client_applications/analytics_welcome_page.png
     :alt: Step 2a

b. Select network and resolution as shown below

  .. image:: ../../../../../_static/getting_started/aiot_intelligent_edge/coco_for_applications/analytics_client_applications/analytics_network_selection.png
     :alt: Step 2b

c. On successful analytics data fetch all graphs will be updated.

  .. image:: ../../../../../_static/getting_started/aiot_intelligent_edge/coco_for_applications/analytics_client_applications/analytics_bargraph_data.png
     :alt: Step 2c
