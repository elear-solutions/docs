.. sectionauthor:: Krishna

.. _terminology_media:

Terminology
===========

.. glossary::

   Network
      | In common words, a Network is the centralizing entity that connects all users (more particularly, Nodes) and allows them to share their Streams (Audio & Video) with one another.
      | Network when connected, allows for real-time calls and, when disconnected, terminates all :term:`Channel` and Streams.

      | For example a Network could be named "⚽ watch party🎉🎉 at 7".
      | And once a network is created (by you), you can invite any number of users and they all can start sharing their streams.

      .. note:: Streams are not recordable (as yet). So, a stream can only be received when both the sender and receiver are online.

   Session
      | A session is a construct from *cocomediasdk-android* which is sugarcoated version of :term:`Network` from *cocomediasdk-java*. Thus, the terms Network and Session can be used interchangeably.

      | Session from *cocomediasdk-android* is developed in such a way that it functions as a one-stop store for all APIs related to session handling, user management, real-time communication etc.

      | Session APIs make it simple to create and join networks, and they can help to reduce boilerplate code. It might also be beneficial in terms of unit economics by assisting you in appropriately stopping the streams when they are not in use.

   Node
      | Every client part of the Network/Session is a Node and is uniquely identified using Node ID, two clients loggedin using same User ID will have different Node IDs allowing unique identification.
      | A Node online or offline status is propagated to application so that call joining/leaving events are handled gracefully. 

   Channel
      | A Channel is a virtual construct to add constraints on Streams. A channel can contain a limited number of streams, which can be enforced during the time of creation and this value can be set to -1 to unlimit the number of streams.
      | A channel can be joined and left. Whenever a new stream is created in the channel after it has been joined, a callback will be triggered.
        This :term:`RxStream` is a :term:`TxStream` to a Source Node(origin) in the Network/Session.
      | Similarly, if you create a TxStream it will be notified to all the subscribers of the channel and they perceive it as an RxStream.
      | At the moment, channels can establish constraints on the maximum number of streams in a channel, supporting the creation of cross-platform instant messaging and conferencing apps.
      | We are working actively on enhancing this channel customisation capabilities, which will provide a multitude of possibilities for a variety of use cases such as meeting with host-guest systems, public networks, etc.,

   RxStream
      | A RxStream is an Audio/Video stream from another :term:`Node` in the session and is thus associated with StreamInfo so that the self Node would seamlessly play the streams from other Nodes.

   TxStream
      | A TxStream is used to send Audio/Video or any frame data between Nodes in the channel.
      | A TxStream is an Audio/Video stream is from self Node to the subscriber nodes of the Stream in the Channel. 

   Frame
      A ByteBuffer that is ordered in a specific way with a header indicating the size and metadata along with the data being sent.
