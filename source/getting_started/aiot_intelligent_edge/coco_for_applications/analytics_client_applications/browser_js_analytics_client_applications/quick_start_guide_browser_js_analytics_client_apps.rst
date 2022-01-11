.. _quick_start_guide_browser_js_analytics_client_apps:

Quick Start Guide
=================

<Content here - Owner: Deekshith>

.. Suggestions from Ashish - Steps to Sync Sources, Compilation, and Running Successfully. Also mentioning how Auto-Magically things connect to the COCO App

Application Build Process
++++

1. Register an Single Page Application from here :ref:`quick_start_guide_single_page_apps`
2. Clone sample application from `Github <https://github.com/elear-solutions/cocoanalyticssdk-js-energy-sample-app>`_ and checkout to master branch
3. Steps to build

   1. update `CLIENT_ID` in `cocoanalyticssdk-js-energy-sample-app/src/environments/environment.ts`
   2. npm i
   3. ng serve
4. Now you can see your application at **http://localhost:4200**

Application usage
++++
1. Login to coco user account which has resources updating analytics data. after login you will see a page as shown below
  .. image:: ../../../../../_static/analytics_welcome_page.png
2. Select network and resolution as shown below
  .. image:: ../../../../../_static/analytics_network_selection.png
3. On successful analytics data fetch all graphs will be updated.
  .. image:: ../../../../../_static/analytics_bargraph_data.png