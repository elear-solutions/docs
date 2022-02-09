.. sectionauthor:: Krishna

.. _sample_app_walkthrough_android_end_user_client_apps:

Sample App Walkthrough
======================

This guide provides a quick walkthrough of API with example code snippets to get started. 

.. contents::
  :local:


Configuring CocoClient
----------------------

The base SDK Class that developer will call. CocoClient class follows the singleton design pattern so the configuration goes as follows:

   .. code-block:: java
   
        public class SplashActivity extends AppCompatActivity {
        @Override
        protected void onCreate(Bundle savedInstanceState) {
          if (null != CocoClient.getInstance()) {
            return;
          }
   
          new CocoClient.Configurator()
              .withCreator(new CreatorEx())
              .withPlatform(new PlatformInterface() {
                @Override
                public String getCwdPath() {
                  return "provide_current_working_directory";
                }
   
                @Override
                public String getClientId() {
                  return "your_client_id_here";
                }
   
                @Override
                public String getAppAccessList() {
                  // JSON that describes SDK the capabilities your app will deal
                  return "{\"appCapabilities\": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}";
                }
   
                @Override
                public void authCallback(String authorizationEndpoint, String tokenEndpoint) {
                  // override this callback to perform authentication, This is triggered by SDK when tokens are expired
                }
              }).configure();
        }
      }

.. important:: 

   ``.withCreator(new CreatorEx())`` is essential as it creates Android
   flavoured instances of NetworkEx, DeviceEx, ResourceEx, AttributeEx, etc. 

   | Above Ex suffixed classes are sub classes of Java flavoured Network, Device, Resource, Attribute respectively.

----

Authentication
--------------

1. | To login COCO users with their accounts we offer **CocoLoginMgr** a wrapper around **AppAuth-Android** to authenticate users and access their COCO account.
   | The code snippet below achieves Login with COCO using simple result launcher:

   .. code-block:: java
       :emphasize-lines: 23

        public class MainActivity extends AppCompatActivity {
          private final ActivityResultLauncher<Intent> resultLauncher =
              registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), result -> {
                Intent dataIntent = result.getData();
        
                if (RESULT_OK != result.getResultCode()) {
                  // process failure
                  return;
                }
        
                if (dataIntent.hasExtra(Constants.KEY_AUTH_STATE)) {
                  String tokens = dataIntent.getStringExtra(Constants.KEY_AUTH_STATE);
                  // pass tokens to sdk and start making api calls
                }
              });
  
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            Intent loginIntent = new Intent(this, LoginActivity.class)
                .putExtra(Constants.AUTH_ENDPOINT, authEndpoint)
                .putExtra(Constants.TOKEN_ENDPOINT, tokenEndpoint);
        
            resultLauncher.launch(loginIntent);
          }
        }

.. admonition:: Info

    If you are a Third-party-App with its own user base we also have a solution for authentication. Visit :ref:`self managed user system <custom_solution_for_self_managed_user_system>` section.

2. Tokens must be set after a successful login and receipt of tokens.
   Once the tokens are set, the SDK will manage token expiration by
   invoking ``authCallback``; the token setter is shown below:

   .. code-block:: java
       :emphasize-lines: 4
   
       public class SplashActivity extends AppCompatActivity {
         @Override
         protected void onCreate(Bundle savedInstanceState) {
           CocoClient.getInstance().setTokens(tokens);
         }
       }

3. Access tokens if set can be queried from SDK using:

   .. code-block:: java
       :emphasize-lines: 4
   
       public class SplashActivity extends AppCompatActivity {
         @Override
         protected void onCreate(Bundle savedInstanceState) {
           CocoClient.getInstance().getAccessTokens((accessToken, tr) -> {
             if (null != accessToken) {
               startCocoNetActivity();
               return;
             }
    
             // perform login
           });
         }
       }

----

Working with Network
--------------------

Now that the SDK has been established and the tokens have been set, we
can inspect API requests on the Network(or COCONet).

1. Connecting/Disconnecting to a Network is as simple as calling
   ``network.connect()`` and ``network.disconnect()`` on the instance of
   a Network under consideration.

2. Fetching all Networks of a CocoClient can be achieved by:

   .. code-block:: java
       :emphasize-lines: 6

        public class CocoNetworksActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            CocoClient
                .getInstance()
                .getAllNetworks((networkList, throwable) -> {
                   if (null != throwable) {
                     return;
                   }

                   recyclerViewAdapter.setList(networkList);
                 });
          }
        }

3. Network connection status updates can be listened using, some possible values are ``CONNECTED``, ``CONNECTING``, ``DISCONNECTED`` etc:

   .. code-block:: java
       :emphasize-lines: 4
   
        public class MainActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            network.getStateObservable().observe(this, state -> {
               String message = "Name: " + network.getName() + ", state: " + state;
     
               // show a toast 
               Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT).show();
             });
          }
        }

4. Network comprises of Zones and Devices. You can get the list of all Zones or Devices in a Network using a getter on Network instance as follows:

   .. code-block:: java
       :emphasize-lines: 8,12

       public class MainActivity extends AppCompatActivity {
         @Override
         protected void onCreate(Bundle savedInstanceState) {
           super.onCreate(savedInstanceState);
           
           NetworkEx network = CocoClient.getInstance().getNetwork(networkId);
           
           network.getZoneListObservable().observe(this, zoneList -> {
             // code to handle list of zones in a network goes here
           });
           
           network.getDeviceListObservable().observe(this, deviceList -> {
             // code to handle list of devices in a network goes here
           });
         }
       }

----

Working with Device
-------------------
A Device is node in a Network representing either a physical device (such as a Gateway, Camera or Light Bulb) or a software gateway, and is built using the COCO Device SDK.

1. Observing device *ready* state (as it publishes resource definitions and attribute updates to client application) is as straight forward as:

   .. code-block:: java
       :emphasize-lines: 7

        public class MainActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);

            DeviceEx device = network.getDevice(deviceNodeId)
            device.getDeviceStateObservable().observe(this, ready -> {
              // handle the ready boolean
            });
          }
        }

2. Using a Device object we can add a Resource in its parent Network.
   The Device class provides functions to add Resources that communicate using Zigbee, ZWave, BLE, Thread etc. 

   .. code-block:: java
       :emphasize-lines: 6

        public class MainActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
        
            network.getDevice(deviceNodeId).addZwaveResource(metadata, parameters, timeout, new Device.AddResourceListener() {
              @Override
              public void onStatusChanged(CommandResponse<Device.CommandId> response, Resource[] resourcesImpacted, Throwable tr) { 
              }
        
              @Override
              public void onInfoRequest(InfoRequest infoRequest) {
              }
        
              @Override
              public void onMessage(String title, String message, MessageType messageType) {
              }
            });
          }
        }

----

Send Commands
-------------

1. Lets assume we have a Refrigeration unit resource with *OnOff* and *Temperature Sensing* Capability as some of its many capabilities.

2. This implies we can switch the resource *On* or *Off* and also monitor the *Temperature*.

3. The following basic snippet creates an *On* command for a resource with *CapabilityOnOff*:

    .. code-block:: java
        :emphasize-lines: 4
    
        public class MainActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            Command<CapabilityOnOff.CommandId> command =  new CapabilityOnOff.On();
          }
        }

4. The code below illustrates how to send an *On* command to the resource
   using ``Capability.sendResourceCommand(Command command)`` API:

   .. code-block:: java
       :emphasize-lines: 11
   
        public class MainActivity extends AppCompatActivity {
          @Override
          protected void onCreate(Bundle savedInstanceState) {
            CapabilityOnOff capabilityOnOff = resource.getCapability(Capability.CapabilityId.ON_OFF_CONTROL);
     
            if (null == capabilityOnOff) {
              return;
            }
     
            // API call with listener for command response registered
            capabilityOnOff.sendResourceCommand(new CapabilityOnOff.On(), (commandResponse, tr) -> {
              if (null != tr) {
                // do something using throwable error
                return;
              }
     
              String message = (Command.State.SUCCESS == commandResponse.getState()) ? "Command Success" : "Command Failed";
              // handle command state and response
            });  
          }
        }

----

Attribute Updates
-----------------

1. We can also monitor temperature of Refrigeration unit resource as
   Temperature Sensing is one of its many Capabilities.

2. As CapabilityTemperatureSensing provides *CURRENT_TEMPERATRE_CELSIUS*
   attribute we can observe the live updates to the attribute using few
   lines of code as shown below:

   .. code-block:: java
       :emphasize-lines: 6

        public class MainActivity extends AppCompatActivity {
        @Override
        protected void onCreate(Bundle savedInstanceState) {
          AttributeEx temperatureAttr = resource.getAttribute(CapabilityTemperatureSensing.AttributeId.CURRENT_TEMP_CELSIUS);

          temperatureAttr.getCurrentValueObservable().observe(lifecycleOwner, currentTemperature -> {
            if (currentTemperature instanceof Double) {
              // bind the currentTemperatureto the UI
            }
          });
        }

.. tip::

   To understand more about Capabilities, Supported Attributes, Protocols and data
   types of Attributes please refer :ref:`COCO Standard <coco_standard>`.
