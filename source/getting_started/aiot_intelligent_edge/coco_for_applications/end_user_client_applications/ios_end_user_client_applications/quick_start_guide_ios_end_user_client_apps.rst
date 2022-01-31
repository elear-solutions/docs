.. _quick_start_guide_ios_end_user_client_apps:

Quick Start Guide
=================

.. sectionauthor:: Shrinivas

Get a Client ID using
---------------------

-  Head to https://manage.getcoco.buzz (Sign up if needed)
-  Go to Applications tab |step 1|
-  Click on + Application button |step 2|
-  Choose the application name, group and type |step 3|
-  Choose the capabilities and click submit |step 4|
-  Click on the Created Application |step 5|
-  Get the client id present there |step 6|

Setup on server for custom login
--------------------------------

-  Clone `sample token
   server <https://github.com/elear-solutions/nodesampletokenserver>`__
   preferably in an linux machine and run the steps provided in that
   repo’s README.md
-  If the machine has domain name then it will be accessed using it’s
   domain
-  If the machine is local to the phone running the app. Then get the ip
   address of the machine running token server along with the port of
   the sample server

Running the app
---------------
Replace the client id and client Secret present in COCOInitialization.swift with your client id and client Secret - Run the
app

##setup for other iOS apps - Copy CocoClientSDK.xcframework and paste it
in the app folder - Add CocoClientSDK.xcframework in “Frameworks,
Libraries and Embedded Content” as “Embed & Sign” - Init CocoClient
\```swift func cocoInit() { do { try CocoClient.setup(cwdPath:
<#T##String#>, /// Current working directory for app appScope:
<#T##String#>, /// specify the app capability access list in json format
like: “{"appCapabilities": [Specify the capability number list]”
clientId: <#T##String#>, /// Specify the client id downloadPath:
<#T##String#>, /// Specify the download path oauthDelegate:
<#T##OAuthDelegate#>, /// Specify the object of class in which
implemented OAuthDelegate cocoCallbackDelegate:
<#T##CocoCallbackDelegate#>, /// Specify the object of class in which
implemented CocoCallbackDelegate connectivityTimers:
<#T##ConnectivityTimers?#>, /// Object of class ConnectivityTimers used
to initialize connectivity timers creator: <#T##Creator?#>) /// Specify
the object of new creator

::

   } catch {
     //TODO 
   }

} \``\`

-  Call CocoClient.getAccesstoken(handler:) function if token is set
   then it will return the token oherwise it will return the
   OAuthCallback with authorizationEndpoint and tokenEndpoint which can
   be used to login and get the access token from the endpoint.

   .. code:: swift

       do {
          try CocoClient.getAccesstoken(handler: { token, status in
            /// If success then 
          })
        } catch {
          // Handle the error messages
        }

      func OAuthCallback(authorizationEndpoint: String, tokenEndpoint: String) {
        self.authenticateUser(authorizationEndpoint: authorizationEndpoint, tokenEndpoint: tokenEndpoint)
      }

-  Using AppAuth(https://github.com/openid/AppAuth-iOS) and
   authorization endpoint you can setup the loging for your application

-  After Successfull login you need to call
   CocoClient.setTokens(response: ) and set the token for SDK in JSON
   format with all field access_token, token_type, expires_at,
   refresh_token

-  After setting token you can call CocoClient.getAccesstoken(handler:)
   if status is success then you can call
   CocoClient.shared.get_all_coconet(requestContext:) function if status
   is failed then setToken is failed you need to set the token again.

-  CocoClient.shared.get_all_coconet(requestContext:) will return the
   List of COCONets in NetworkListCallback(networkList:, context:)

   .. code:: swift

      func NetworkListCallback(networkList: [Network], context: UnsafeMutableRawPointer?) {
      // Process the network in this callback
      }

-  To connect to previously connected networks call get_saved_networks()
   and get all networks which are previously connected

   .. code:: swift

        var networks = CocoClient.shared.get_saved_networks()

-  Connect to the network

   .. code:: swift

        network.connect()

-  Disconnect from the network

   .. code:: swift

        network.disconnect()

-  Status of the network comes in ConnectStatusCallback

   .. code:: swift

      func ConnectStatusCallback(network: Network?, coconetStatus: Network.State, context: UnsafeMutableRawPointer?) {
         <#code#>
      }

-  Listening for callback for the Data of the network after connected to
   the network

   .. code:: swift

        class CocoCallbackImplementation: CocoCallbackDelegate {
          func NetworkDataCallback(network: Network, coconetContext: UnsafeMutableRawPointer?) {
            <#code#>
          }

          func ZoneInfoCallback(zone: Zone?, context: UnsafeMutableRawPointer?) {
            <#code#>
          }

          func SceneInfoCallback(scene: Scene?, context: UnsafeMutableRawPointer?) {
            <#code#>
          }

          func RuleInfoCallback(rule: Rule?, context: UnsafeMutableRawPointer?) {
            <#code#>
          }

          func ResourceCallback(resource: Resource?, context: UnsafeMutableRawPointer?) {
            <#code#>
          }
        }

NOTE

-  Some of the best practices have been omitted for sake of simplicity
   and readability
-  Above mentioned APIs are subject to change
-  The manual .xcframework will be replaced by pod dependency
-  CocoCallbackDelegate add method which is required no need to
   implement all methods
-  OAuthDelegate contain all method related to authorization

.. |step 1| image:: docs/Images/1.png?raw=true
.. |step 2| image:: docs/Images/2.png?raw=true
.. |step 3| image:: docs/Images/3.png?raw=true
.. |step 4| image:: docs/Images/4.png?raw=true
.. |step 5| image:: docs/Images/5.png?raw=true
.. |step 6| image:: docs/Images/6.png?raw=true
