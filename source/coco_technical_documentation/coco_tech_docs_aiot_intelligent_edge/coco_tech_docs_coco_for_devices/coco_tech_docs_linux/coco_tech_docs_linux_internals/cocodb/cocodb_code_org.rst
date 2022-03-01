.. sectionauthor:: Manav

.. _cocodb_code_org:

Code Organization
=================

The cocodb library consists of the following code modules which provide the services mentioned in the Introduction [link] section. Note that each C module below has a corresponding header file with the same name for e.g. cocodb_api.h, cocodb_api_worker.h and so on:

* cocodb_api.c - cocodb external API function implementations, for API's such as those for fetching data from or writing data to the database.

* cocodb_api_sequence_handler.c - a state machine implementation that ensures that cocodb API's are invoked in the right sequence. For e.g. calling commit on a transaction without first beginning the transaction, or invoking any API without first initializing the cocodb library.

* cocodb_api_worker.c - functions for starting up an event loop (from the elearcommon [link] library), and handling events in the main worker thread of the cocodb, where most processing is done, for fetching or writing data, handling transactions, and so on.

* cocodb_common_types.c - declarations of data structures commonly used throughout the cocodb library code

* cocodb_global_vars.c - Global Variables used throughout the cocodb library code, such as the global strings containing the Database Setup SQL statements invoked during library initialization.

* cocodb_data_free.c - utilities for de-allocating the memory allocated for various data structures such as the Resource Information struct.

* cocodb_dispatchers.c - Handlers which receive API calls and dispatch them to the appropriate handler. For e.g. an API call for updating Device Information may be redirected to the appropriate handler in the cocodb_dev_info_handlers.c module.

The following modules contain handlers specific to each database entity such as Resource Information. For more information about the tables, see the Database Structure [link] section:

* cocodb_version_handlers.c - Handlers for fetching and writing data from/to the Database Version Information tables.

* cocodb_dev_info_handlers.c - Handlers for fetching and writing data from/to the Device Information database tables.

* cocodb_network_handlers.c - Handlers for fetching and writing data from/to the COCONet Information database tables.

* cocodb_node_handlers.c - Handlers for fetching and writing data from/to the Node Information database tables.

* cocodb_resource_handlers.c - Handlers for fetching and writing data from/to the Resource Information database tables.

* cocodb_resource_subcluster_handlers.c - Handlers for fetching and writing data from/to the Resource Sub-cluster Information database tables.

* cocodb_zone_handlers.c - Handlers for fetching and writing data from/to the Zone Information database tables.

* cocodb_scene_handlers.c - Handlers for fetching and writing data from/to the Scene Information database tables.

* cocodb_scene_subcluster_handlers.c - Handlers for fetching and writing data from/to the Scene Sub-cluster Information database tables.

* cocodb_rule_handlers.c - Handlers for fetching and writing data from/to the Rule Information database tables.
