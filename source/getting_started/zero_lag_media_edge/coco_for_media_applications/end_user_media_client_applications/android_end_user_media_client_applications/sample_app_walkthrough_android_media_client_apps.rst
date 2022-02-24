.. sectionauthor:: Krishna

.. _sample_app_walkthrough_android_media_client_apps:

Sample App Walkthrough
======================

This guide provides a quick understanding of API with example code snippets to get started.

.. contents::
   :local:


A :term:`Node` might well be either interested in starting a call session or invited to an existing call session. Whatever option is selected, COCO Media SDK offers appropriate solutions.

Building MediaSession
---------------------

``MediaSession`` class follows the Builder design pattern so as to facilitate an easy instance configuration for a call. It includes three useful builders: ``CreateBuilder``, ``JoinBuilder``, and ``DoNothingBuilder``, the significance of each is discussed below:

CreateBuilder
  1. A builder that will be used with a user-defined name and metadata as desired by the developer when a *Node/User* initiates a call session.
  2. Atleast one :term:`Channel` needs to be added at the time of creation.

  .. code-block:: java
     :emphasize-lines: 4,8
  
     class CallerActivity extends AppCompatActivity {
       @Override
       protected void onCreate(@Nullable Bundle savedInstanceState) {
         MediaSession session = new MediaSession.CreateBuilder(this)
             .setName("Into the COCOverse")
             .setMetadata("Created on: <Date>")
             .addChannel(new MediaSession.ChannelBuilder("channel name", "channel metadata"))
             .build();
       }
     }

JoinBuilder
  A builder that will be utilized when a :emphasis:`Node/User` wishes to join a session to which they have been invited.

  .. code-block:: java
     :emphasize-lines: 4,6

     class CallerActivity extends AppCompatActivity {
       @Override
       protected void onCreate(@Nullable Bundle savedInstanceState) {
         MediaSession session =  new MediaSession.JoinBuilder(this)
             .setSessionId("<Session Id>")
             .build();
       }
     }

.. hint:: The response of :code:`getAllSessions()` API in MediaSession provides you with the invited sessions.

DoNothingBuilder
  This builder will be utilized when the context is not creating or joining a session, but rather dealing the fundamental information about the CocoMediaClient such as.
    
    + Passing access tokens to the SDK,
    + Fetching all sessions of the User,
    + User management of session, session deletion etc.

  .. code-block:: java
     :emphasize-lines: 5, 8, 11

     class SplashActivity extends AppCompatActivity {
       @Override
       protected void onCreate(@Nullable Bundle savedInstanceState) {
         String tokens = "<fetch the tokens by performing login>";
         MediaSession session =  new MediaSession.DoNothingBuilder(this).build();

         // To pass tokens to COCO Media SDK use
         session.setTokens(tokens);

         // fetching all active sessions
         session.getAllSessions()
           .observe(this, response -> {
             if (null != response.getError()) {
               // error handling code
               return;
             }
   
             response.getValue().stream().forEach(handle -> {
               // handle is a data class with ID, name and metadata of MediaSession
               // ex: use the session ID for inviting users
             });
           });
       }
     }

.. note:: The definition DoNothingBuilder is not to be confused, as any instance of MediaSession inherits above APIs but we intend to use CreateBuilder and JoinBuilder only when User wants to create or join a call respectively.

Handling MediaSession
---------------------

Building a **MediaSession** instance is only the first portion of the call creation process, this section entails handling the MediaSession from *Channel* and *Stream* inception to termination. 

.. sidebar:: Table

   .. list-table::
      :header-rows: 1

      * - Behavior
        - Builder

      * - Creates and Joins
        - CreateBuilder

      * - Joins
        - JoinBuilder

      * - Does nothing
        - DoNothingBuilder

1. Based on the type of builder used for instantiation, the ``start()`` API in MediaSession behaves as shown in the table aside:

.. add details about channel and streams connections with remote connected status.
   
2. After the start function call we can easily listen for creation/join status using ``getConnectionStatus()`` API. 

3. The ``stop()`` API in MediaSession disconnects the call and terminates all *Streams* and *Channel* connections.

4. To delete a session or to end the call for all the participant nodes MediaSession provides ``delete()`` API.

5. Below code snippet shows all the above APIs in action:

  .. code-block:: java
     :emphasize-lines: 5,6,18,23,33

     class CallerActivity extends AppCompatActivity {
       @Override
       protected void onCreate(@Nullable Bundle savedInstanceState) {
         // start the session
         session
            .start()
            .observe(this, response -> {
              if (null != response.getError()) {
                // code to handle error goes here
                return;
              }

              MediaSession.ChannelNodesContainer nodesContainer = response.getValue();
              // code to handle channels and nodes data from response goes here
            });

         // listen session state
         session.getConnectionStatus().observe(this, status -> {
           // code to display connection status of this session goes here
         });

         // delete the session
         session.delete().observe(this, response -> {
           if (null != response.getError()) {
             // success
           }
         });
       }

       @Override
       protected void onDestroy() {
         // stop the session
         session.stop();
       }       
     }  

.. attention:: :code:`session.delete()` :strong:`MUST` be called before :code:`session.stop()`.

Communication in MediaSession
-----------------------------
.. about sessionhandle, adding streams, sending messages and listening, inviting users

Once the MediaSession state is CONNECTED we can start sending messages and add stream handlers for Voice and Video communication.

1. An overloaded ``sendMessage`` or ``sendContentInfoMessage`` API can be used to send messages to specified or all nodes in the session.
  
   .. code-block:: java
      :emphasize-lines: 17, 20, 23, 26 

      class CallerActivity extends AppCompatActivity {
        private MediaSession session;
  
        @Override
        protected void onCreate(@Nullable Bundle savedInstanceState) {
          session = new MediaSession.JoinBuilder(this)
            .setSessionId("<Session Id>")
            .build();
      
          session.start();
      
          session.getConnectionStatus().observe(this, status -> {
            // wait till session is connected, else sendMessage will fail.
          });
      
          // send message to every one in the network
          session.sendMessage("hello world");
      
          // send data to nodes with node id 1, 2
          session.sendMessage("hello world", 1, 2);
      
          // send content info to all nodes in the network
          session.sendContentInfoMessage("hello world", (int) System.currentTimeMillis());
      
          // send data to nodes with node id 1, 2
          session.sendContentInfoMessage("hello world", (int) System.currentTimeMillis(), 1, 2);
        }
      
        @Override
        protected void onDestroy() {
          session.stop();
        }
      }

.. tip:: :code:`sendContentInfo()` API can be used as content synchronization tool for watch parties.

2. Receiving messages from fellow Nodes in the MediaSession is as easy as setting a listener.

   .. code-block:: java
      :emphasize-lines: 6, 10, 14

      class CallerActivity extends AppCompatActivity {
        @Override
        protected void onCreate(@Nullable Bundle savedInstanceState) {
          // Join or create a session
      
          session.setMessageReceivedListener((message, sourceNodeId) -> {
            // triggered on receiving a new message from sourceNodeId
          });
      
          session.setContentInfoReceivedListener((message, sourceNodeId, contentTime) -> {
            // triggered on receiving a new content info message from sourceNodeId
          });
      
          session.setNodeStatusListener((nodeId, isOnline) -> {
            // triggered when nodeId becomes online / offline
          });
        }
      }

.. warning:: 
  
  The code will be executed on a :strong:`background thread` and this listener will be cleared during :code:`session.stop()`. Furthermore, memory leaks must be prevented(``LiveData`` or ``MutableStateFlow``).

3. In **COCO Media SDK** audio and video communication happens as *Streams*. Thus for a Video call you need to add *MicStreamHandler* and *CameraStreamHandler* to a given *Channel*.

   .. code-block:: java
      :emphasize-lines: 12, 29

      class CallerActivity extends AppCompatActivity {
        @Override
        protected void onCreate(@Nullable Bundle savedInstanceState) {
          MediaSession session = new MediaSession.JoinBuilder(this)
            .setSessionId("<Session Id>")
            .build();
      
          // Hard-coding channel names would be a best practice.
      
          // adding camera stream
          session
            .addStream(new CameraStreamHandler.Builder(
                "<CHANNEL NAME>",
                CameraStreamHandler.VideoQuality.SD,
                CameraSelector.DEFAULT_FRONT_CAMERA))
            .observe(this, videoHandler -> {
      
              if (null == videoHandler) {
                // error
                return;
              }
      
              videoHandler.start();
              videoHandler.bindToLifecycle(this, this, binding.pvSelf);
            });
      
          // adding microphone stream
          session
            .addStream(new MicStreamHandler.Builder("<CHANNEL NAME>"))
            .observe(this, audioHandler -> {
      
              if (null == audioHandler) {
                // error
                return;
              }
      
              audioHandler.start();
              audioHandler.bindToLifecycle(this);
            });
        }
      }

4. To setup views of other *Nodes* in the MediaSession we can listen for *Streams* in a *Channel* as shown below:

   .. code-block:: java
      :emphasize-lines: 43, 52, 55

      class CallerActivity extends AppCompatActivity {
        @Override
        protected void onCreate(@Nullable Bundle savedInstanceState) {
          MediaSession session = new MediaSession.JoinBuilder(this)
            .setSessionId("<Session Id>")
            .build();
      
          // binding each participant to their corresponding view
          session
            .start()
            .observe(this, response -> {
      
              if (null != response.getError()) {
                // error
                return;
              }
      
              MediaSession.ChannelNodesContainer nodesContainer = response
                  .getValue()
                  .stream()
                  .filter(container -> container.getChannelName().equals("<CHANNEL NAME>"))
                  .findFirst()
                  .orElse(null);
      
              if (null == nodesContainer) {
                // ignore
                return;
              }
      
              this.participants = nodesContainer.getNodes();
      
              // binding each participant to their corresponding view
              for (int i = 0; i < participants.size(); i++) {
                NodePlayerView pv = playerViews.get(i);
      
                if (null == pv.getPlayer()) {
                  SimpleExoPlayer player = MediaSession.getLowLatencyPlayer(this);
      
                  players.add(player);
                  pv.setPlayer(player);
                }
      
                pv.bindToNode(participants.get(i));
              }
      
              // unbinding each view from participant
              for (int i = participants.size(); i < playerViews.size(); i++) {
                SimpleExoPlayer player;
                NodePlayerView pv = playerViews.get(i);
      
                if (null != (player = pv.getPlayer())) {
                  player.release();
                }
      
                pv.setPlayer(null);
              }
            });
        }
      }

User Management in MediaSession
-------------------------------

1. Inviting an User to a session and removing one from a session can be achieved using ``inviteExternalUser(userId)`` and ``removeUser(userId)`` API in MediaSession.

2. Fetching participants of a session if we have the session ID is possible using ``getUsers()`` API on MediaSession instance created using any Builder,
   code example below shows using DoNothingBuilder:

   .. code-block:: java
     :emphasize-lines: 9, 15, 21

      class InviteUserActivity extends AppCompatActivity {
        @Override
        protected void onCreate(@Nullable Bundle savedInstanceState) {
      
          MediaSession nothingSession = new MediaSession.DoNothingBuilder(this)
            .setSessionId("<Session Id>")
            .build();
      
          nothingSession.getUsers().observe(this, response -> {
            if (null != response.getError()) {
              response.getValue();
            }
          });
      
          nothingSession.inviteExternalUser("<external user id>").observe(this, inviteUserResponse -> {
            if (null != inviteUserResponse.getError()) {
              // success
            }
          });

          nothingSession.removeUser("<external user id>").observe(this, removeUserResponse -> {
            if (null != removeUserResponse.getError()) {
              // success
            }
          });
        }
      }
