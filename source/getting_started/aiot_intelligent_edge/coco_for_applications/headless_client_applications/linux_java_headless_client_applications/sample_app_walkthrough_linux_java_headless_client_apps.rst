.. sectionauthor:: Krishna

.. _sample_app_walkthrough_linux_java_headless_client_apps:

Sample App Walkthrough
======================

This guide provides a quick walkthrough of API from Java flavoured **COCO IoT Client SDK** with example code snippets to get started.

Configuring CocoClient
----------------------

 The base SDK Class that developer will call. *CocoClient* is a *singleton* so the configuration goes as follows:

 .. code-block:: Java
    :emphasize-lines: 7, 29

    public class Main {
      public static void main(String[] args) {
        if (null != CocoClient.getInstance()) {
            return;
          }
   
          new CocoClient.Configurator()
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

----

Working with Network
--------------------

1. | Linux Java client app falls under the category of Standlone Apps, which connect to a *Network* using a generated invitation from MTB portal.
   | ``cococlientsdk-java`` provides a convenient builder pattern to create a *Network* instance that wraps the ``connectWithInvite()`` API, for example

   .. code-block:: Java
      :caption: **Connect with Invite**
      :emphasize-lines: 3, 11

       public class Main {
         public static void main(String[] args) {
           Newtork network = new Network.ConnectArgs()
                                        .setNetworkId(networkId)
                                        .setInviteUrl(inviteUrl)
                                        .setNodeId(nodeId)
                                        .setNetworkName("your_network_name")
                                        .setNetworkType(Network.NetworkType.IOT)
                                        .setUserRole(Network.UserRole.ADMIN)
                                        .setAccessType(Network.AccessType.REMOTE)
                                        .connect();
         }
       }

2. After ``connect`` call to *Network* we can verify the connectivity state of *Network* by quering it as follows

   .. code-block:: Java
      :emphasize-lines: 4, 8

      public class Main {
        public static void main(String[] args) {
          // Waiting for connected state
          while (network.getState().isConnecting()) {
            // sleep for few ms
          }

          assert network.getState().isConnected();
        }
      }

3. If a *Network* is was joined using invite URL previously one can query CocoClient for saved networks as

   .. code-block:: Java

      public class Main {
        public static void main(String[] args) {
          Network[] networks = CocoClient.getInstance().getSavedNetworks();
        }
      }

----

Send Command to a Resource
--------------------------

1. | Once we have the *Resources* of the *Network* we can send command using *Capability* of that *Resource*.
   | Here we demonsrate how to capture a snapshot from the camera instance in our *Network*:

   .. code-block:: Java
      :emphasize-lines: 5, 6

      public class Main {
        public static void main(String[] args) {
          CapabilitySnapshot capablity = cameraResource.getCapability(CapabilitySnapshot.ID);

          capability.captureSnapshot("download_path_here", height_in_px, width_in_px, timeout, 
              (filePath, status) -> {
            // handle the status of command and received snapshot here.
          });
        }
      }
