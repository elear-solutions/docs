.. _sample_app_walkthrough_browser_js_analytics_client_apps:

Sample App Walkthrough
======================

.. sectionauthor:: Deekshith

This tutorial will walk you through the process of setting up our example app and experience how we integrated the **COCO Analytics SDK**.

Step1: Connect to COCO
  - Initialize coco with the clientId and redirect URL which is mentioned while registring application. This is being done in **cocoanalyticssdk-js-energy-sample-app/src/app/app.component.ts**

    .. code:: javascript


      Coco.init({
        client_id: environment.CLIENT_ID,
        redirect_uri: environment.REDIRECT_URL, // optional
      }).then(() => {
        return Coco.isLoggedIn();
      }).then((isLoggedIn: any) => {
        this.isLoggedIn = isLoggedIn;
        if (!isLoggedIn) {
          Coco.login();
        }
      }).then(() => {
        this.userService.getUserDetails()
          .then((data: { status: number; response: User; }) => {
            if (data.status != 401) {
              this.userService.currentUserSubject.next(data.response);
              localStorage.setItem('coco-user', JSON.stringify(data.response));
            } else if (data.status == 401) {
              Coco.login();
            }
          },(error: any) => {
            console.log('Error - user', error);
            return error;
          });
      });



Step2: Initializing COCO analytics
  - We need to initialize the cocoanalytics to order to get analytics data from coco cloud. For this we need to add the SDK in **cocoanalyticssdk-js-energy-sample-app/src/index.html**

    .. code:: html


      <script type="text/javascript"src="https://static-assets.getcoco.buzz/scripts/coco-analytics-sdk.min.js"></script>


  - Now call the connect function in the SDK to intialize and store the analyticsHandle which is used to get analytics data. In this application initialization is made at **cocoanalyticssdk-js-energy-sample-app/src/app/components/total-home-consumption/total-home-consumption.component.ts**

    .. code:: javascript

      // Get access token and connect to cocoanalytics
      Coco.getAccessToken()
        .then((data: any) => {
          var accessToken = data;
          CocoAnalytics.connect(accessToken)
            .then((data: any) => {
              this.analyticsHandle = data;
          });
        })


Step3: Fetch data from COCO cloud and visualize in application
  - To get the analytics data we need to call the fetchData from SDK. To know detailed description on parameters `refer here <https://docs.getcoco.buzz/CocoAnalytics.html>`_ 

  - Here we will see some important parametes are configured. These are configured at **cocoanalyticssdk-js-energy-sample-app/src/app/components/total-home-consumption/total-home-consumption.component.ts**

    1. **attributeInfo** param is an object which contains capabilityId and attributeId
    Since we are building apllication for energy consumption `capabilityId is 4 and attributeId is 0` which were defined as constants in the application

      .. code:: javascript


        //Capability and Attribute Settings
        const capabilityEnergyMeter: number = 4;
        const attributeEnergyMeterConsumption: number = 0;


    2. **networkId** is an unique id of a COCONet which user owns or part of.

      .. code:: javascript


        //On Selecting a network
        selectNetwork(network: any) {
          var previousNetwork = this.selectedNetwork.networkId;
          if (previousNetwork != network.networkId) {
            this.analyticsData = {};
            this.selectedNetwork.networkId = network.networkId;
        }


  - By calling the fetchData() function we will get the analytics data.

    .. code:: javascript


      CocoAnalytics.fetchData(this.analyticsHandle, this.selectedNetwork.networkId, this.attributeInfo, this.filters, this.time, this.selectedMeasure)
        .then((response: any) => {
          // analytics data from COCO cloud
          this.analyticsData = response;
          this.spinnerService.setSpinner(false);
        }, (error: any) => {
          this.spinnerService.setSpinner(false);
          Utils.gotoTop();
          this.errorMessage = error;
          setTimeout(() => {
            this.errorMessage = "";
          }, 5000);
        });


  - Fetched analytics data should be displayed in a graph. update **cocoanalyticssdk-js-energy-sample-app/src/app/components/total-home-consumption/total-home-consumption.component.html** with below code

    .. code:: html


      <app-bar-chart *ngIf="showTotalHomeConsumption" [dataset]="this.analyticsData"
        [timeResolution]="this.resolution" title="Total Home Consumption">
      </app-bar-chart>


  - Once your application is built it will display data as below. similarly data can be represented in various formats.

    .. image:: ../../../../../_static/getting_started/aiot_intelligent_edge/coco_for_applications/analytics_client_applications/analytics_bargraph_data.png
