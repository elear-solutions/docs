.. sectionauthor:: Manav

.. _cocodb_process_struct:

Process Structure
=================

The cocodb library creates the following threads for application processing:

**Event Handling** - the main cocodb library thread for the serialized processing of all API calls (to avoid race conditions). This thread also allows for disk write operations to be delayed to optimize performance. An in-memory copy is maintained for the database and updates made to that in-memory copy before returning from the cocodb Write API to the caller. Before returning, the written data is pushed onto the event queue of this thread for asynchronous processing i.e. the writing of the data to persistent memory.
