.. _quick_start_guide_ios_end_user_client_apps:

Quick Start Guide
=================

.. section author:: Shrinivas

This guide provides a quick understanding of API with example code snippets to get started. 

.. contents::
  :local:


Configuring IOTClient
----------------------

The base SDK Class that the developer will call. IOTClient class follows the singleton design pattern so the configuration goes as follows:

   .. code-block:: swift
   
    func cocoInit() { 
		do { 
			try IOTClient.setup(cwdPath: <#T##String#>, /// Current working directory for app 
								 appScope: <#T##String#>, /// specify the app capability access list in json format like: “{"appCapabilities": [Specify the capability number list]”
								 clientId: <#T##String#>, /// Specify the client id 
								 downloadPath: <#T##String#>, /// Specify the download path 
								 oauthDelegate: <#T##OAuthDelegate#>, /// Specify the object of class in which implemented OAuthDelegate 
								 cocoCallbackDelegate: <#T##CocoCallbackDelegate#>, /// Specify the object of class in which implemented CocoCallbackDelegate 
								 connectivityTimers: <#T##ConnectivityTimers?#>, /// Object of class ConnectivityTimers used to initialize connectivity timers 
								 creator: <#T##Creator?#>) /// Specify the object of new creator

   		} catch {
     		     // Handle the exception thrown while initllizing the IOTClient SDK
   		}
	}
 

----

Authentication
--------------

1. To login COCO users with their accounts they need to know the endPoint of cloud API to get the endPoint you can call getAccesstoken() API in IOTClient SDK

   .. code-block:: swift

       do {
            /// if the token is set then it will return the token otherwise it will return the OAuthCallback with authorizationEndpoint and tokenEndpoint which can be used to login and get the access token from the endpoint. 
            try CocoClient.getAccesstoken(handler: { token, status in
          })
        } catch {
          // Handle the exception thrown while getting the access token 
        }

      /// Implement the OAuthDelegate to get the OAuthCallback, RefreshTokenCB
      
      func OAuthCallback(authorizationEndpoint: String, tokenEndpoint: String) {
        /// this contain the authorizationEndpoint and authorizationEndpoint 
      }

2. To get the access token use the AppAuth library in the pod spec file And send the request to the server to get the access token.

   .. code-block:: swift

       /// Specify in the pod file
       pod 'AppAuth'

       /// Create the configuration object which uses authorizationEndpoint and tokenEndpoint recived in the `OAuthCallback`
      let _configuration = OIDServiceConfiguration(authorizationEndpoint: _authorizationEndpoint,
                                                   tokenEndpoint: _tokenEndpoint)

      /// Create the request object which needs to send in the Authentication request 
      let request = OIDAuthorizationRequest(configuration: _configuration, // configuration object of OIDServiceConfiguration
                                          clientId: <#T##String#>, // Client Id you have recived from the `https://manage.getcoco.buzz` portal
                                          clientSecret: nil, // Native application not required the client secret
                                          scopes: [OIDScopeOpenID, OIDScopeProfile], // scope of the request 
                                          redirectURL: <#T##URL#>, // redirect URL of the application
                                          responseType: OIDResponseTypeCode, // response type of the request
                                          additionalParameters: nil)


      /// get the appDelegate object 
      let appDelegate = UIApplication.shared.delegate as! AppDelegate

      /// Send reuest to for the Authorization 
      appDelegate.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, // request object of the `OIDAuthorizationRequest`
                                                                    presenting: _controller // Current view controller
                                                                    ) { authState, error in 
        if let authState = authState {
          /// Retrive the access token recived in the authState
          print("Access token: " + "\(authState.lastTokenResponse?.accessToken ?? "nil")")
        } else {
          /// if you got the error in the reponse check the error message
          print("Authorization error: \(error?.localizedDescription ?? "Unknown error")")
        }
      }
                                                   

 .. admonition:: Info

    To get more info about the AppAuth(https://github.com/openid/AppAuth-iOS) library use this GitHub link 

3. Tokens must be set after a successful login and receipt of tokens.
   Once the tokens are set, the SDK will manage token expiration by
   invoking ``authCallback``; the token setter is shown below: 

   .. code-block:: swift
   
        do {
          try IOTClient.setTokens(response: <#T##String#>) // token need to be in the json string format
        } catch {
     		     // Handle the exception thrown in the set tokens
        }

 .. important:: 

    Set token in JSON String format with all values of the keys `access_token`, `token_type`, `expires_at` and `refresh_token` need to present

----

Working with Network
--------------------

Now that the SDK has been established and the tokens have been set, we
can inspect API requests on the Coconets.

1. Connecting/Disconnecting to a Coconets is as simple as calling
   ``Coconets.connect()`` and ``Coconets.disconnect()`` on the instance of
   a Network under consideration.

2. Fetching all Coconets of a CocoClient can be achieved by:

   .. code-block:: swift

      do {
        try IOTClient.shared.getAllCoconet(requestContext: context)
      } catch {
     		// Handle the exception thrown in the getting all Coconet.
      }

3. Coconets connection status updates can be listened to using `ConnectStatusCallback` you need to implement the `CocoCallbackDelegate`, some possible values are ``CONNECTED, CONNECTING, DISCONNECTED`` etc:

   .. code-block:: swift
   
    func ConnectStatusCallback(network: Network?, // Netwrok Object 
                               coconetStatus: Network.State, // Current State of the network like ``CONNECTED, CONNECTING, DISCONNECTED`` etc.
                               context: UnsafeMutableRawPointer?) {
    }

4. Network comprises of Zones and Devices. You can get the list of all Zones or Devices in a Network using a network object and updated received in the `ZoneInfoCallback`, `DeviceInfoCallback`, `ZoneDeletionCallback` implement the `CocoCallbackDelegate`.

----

Send Commands
-------------

1. Let's assume we have a Refrigeration unit resource with *OnOff* and *Temperature Sensing* Capability as some of its many capabilities.

2. This implies we can switch the resource *ON* or *OFF* and also monitor the *temperature*.

3. The code below illustrates how to send an *ON* command to the resource using ``Capability.sendResourceCommand(Command command)`` API:

    .. code-block:: swift
  
          // Create the command object for reosurce.
          let _OnCommand = CapabilityOnOff.OnCommand()

          // Get the capbility object from the Refrigeration Resource Object capabilityMap. This is to ensure resource support On/Off Capability or you can use the `Capability.supports(commandId: <##CommandIDProtocol#>)`
          if let capbility = RefrigerationResourceObj.capabilityMap[.COCO_STD_CAP_ON_OFF_CONTROL] {
              do {
                // send the command using the command Object.
                let result = try capbility.sendResourceCommand(command: _OnCommand, handler: { status in
                  // You will get the status of the command depends on success/failure you can update the UI
                }, commandContext: nil)
              } catch {
     		        // Handle the exception thrown while sending the reosurce command.
              }
          }

----

Attribute Updates
-----------------

1. We can also monitor the temperature of the Refrigeration unit resources as Temperature Sensing is one of its many capabilities.

2. As CapabilityTemperatureSensing provides *CURRENT_TEMPERATRE_CELSIUS*
   the attribute we can observe the live updates to the attribute using few
   lines of code as shown below:

   .. code-block:: swift

          func ResourceAttributeCallback(attribute: Attribute?,
                                         context: UnsafeMutableRawPointer?) {

                                           // Check if the capability is the Temperature Measurement 
                                            guard attribute?.parentCapability!.capabilityId == .COCO_STD_CAP_TEMPERATURE_MEASUREMENT else {
                                              return
                                            }

                                           // Check if the attribute is the Temperature Measurement
                                            guard CapabilityTemperatureSensing.AttributeId.COCO_STD_ATTR_CURRENT_TEMP_CELSIUS.rawValue == attribute!.attributeId else {
                                              return
                                            }

                                            // you can check the data type of the current value of the attribute. and depends on the data type you need to convert current value to appropriate data type
                                            let dataType = attribute.dataType

                                            // Get the Temperature value
                                            let tempValue = attribute.currentValue as? Double ?? 0
                                        }

.. tip::

   To understand more about Capabilities, Supported Attributes and data
   types of Attributes please refer :` COCO Standard <coco_standard>`
