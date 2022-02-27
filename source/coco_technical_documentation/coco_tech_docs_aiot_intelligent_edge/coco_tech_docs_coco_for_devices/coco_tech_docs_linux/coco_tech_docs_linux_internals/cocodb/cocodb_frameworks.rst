.. sectionauthor:: Manav

.. _cocodb_frameworks:

Frameworks
==========

******************
Database Structure
******************

The following are the tables that make up the COCO Device Database (cocodb). During library initialization, each of these tables (with the exception of **VERSION**) is created if it doesn't already exist, and the cocodb database itself is created from scratch if it doesn't exist, adding a file named "cocodb" to the working directory of the COCO Device's file system (assuming the database is configured as a persistant one).

Database Version Information
############################

VERSION
*******

Table containing information about each of the Firmware Versions that this COCO Device has had, and the corresponding Database Version of each Firmware Version, for the purpose of performing any applicable data migrations.


Device Information
##################

* **DEVICE_INFO** - Table containing information about this COCO Device.

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key
        - SQLite Data Type
        - Description

      * - DELETE_FLAG
        - 
        - 
        - TEXT
        - Set to 'Y' or 'N' to indicate whether the row has been soft-deleted

      * - DEVICE_NAME
        - 
        - 
        - TEXT
        - Name of this COCO Device in the COCONet

      * - PRODUCT_NAME
        - X
        - 
        - TEXT
        - Market Name of the Product Make and Model (Unique SKU) that this COCO Device belongs to, for example, "COCO Low Cost Zigbee Gateway"

      * - MODEL
        - X
        - 
        - TEXT
        - Model Number of the Product

      * - MAKE
        - X
        - 
        - TEXT
        - Make (Brand Name) of the Product, for example, COCO

      * - FW_VERSION
        - 
        - 
        - TEXT
        - The Current Firmware Version installed on this COCO Device. Used to determine if the device should be upgraded through OTA (Over-the-air) Update.

      * - CREATED_TIMESTAMP
        - 
        - 
        - DATETIME
        - Date and Time when this table record was inserted

      * - CREATED_BY_USER_ID
        - 
        - 
        - TEXT
        - Not currently in use


Network Information
###################

**NETWORK** - Table containing information about the COCONet that this COCO Device belongs to. In the current platform, this table only contains one row since a COCO Device can only belong to one COCONet at a time.

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key
        - SQLite Data Type
        - Description

      * - DELETE_FLAG
        - 
        - 
        - TEXT
        - Set to 'Y' or 'N' to indicate whether the row has been soft-deleted

      * - NETWORK_ID
        - 
        - 
        - TEXT
        - Unique Identifier of the COCONet (or COCONet ID) that this COCO Device belongs to

      * - NETWORK_NAME
        - 
        - 
        - TEXT
        - Name of the COCONet that this COCO Device belongs to

      * - GATEWAY_NODE_ID
        - 
        - 
        - INT
        - Unique Identifier of the node (or Node ID) that represents this COCO Device in the COCONet

      * - CREATED_TIMESTAMP
        - 
        - 
        - DATETIME
        - Date and Time when this table record was inserted

      * - CREATED_BY_USER_ID
        - 
        - 
        - TEXT
        - Not currently in use


Node Information
################

**NODE** - Table containing information about the Client Application nodes that exist in the COCONet that this COCO Device belongs to.

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key
        - SQLite Data Type
        - Description

      * - DELETE_FLAG
        - 
        - 
        - TEXT
        - Set to 'Y' or 'N' to indicate whether the row has been soft-deleted

      * - NODE_ID
        - X
        - 
        - INT
        - Unique Identifier of the node (or Node ID) that represents a Client Application node in the COCONet that this COCO Device belongs to.

      * - NETWORK_ID
        - 
        - 
        - TEXT
        - Unique Identifier of the COCONet (or COCONet ID) that this COCO Device belongs to

      * - USER_ID
        - 
        - 
        - INT
        - Unique Identifier of the COCO User (or COCO User ID) that this Client Application node is being used by

      * - APP_ID
        - 
        - 
        - INT
        - Unique Identifier of the COCO Third Party Application (or COCO App ID) whose installed instance is represented by this Client Application node in the COCONet

      * - USER_ROLE_TYPE_ID
        - 
        - 
        - INT
        - Not currently in use

      * - USER_ACCESS_LIST_JSON
        - 
        - 
        - TEXT
        - JSON String indicating the Resources, Capabilities, Commands and Attributes in the COCONet that the COCO User has access to.

      * - APP_ACCESS_LIST_JSON
        - 
        - 
        - TEXT
        - JSON String indicating the Capabilities in the COCONet that the COCO Third Party Application has access to.

      * - NODE_ACCESS_LIST_JSON
        - 
        - 
        - TEXT
        - A JSON String generated by combining the USER_ACCESS_LIST_JSON and APP_ACCESS_LIST_JSON strings, which denotes the Resources, Capabilities, Commands and Attributes that this Client Application node has access to, which will be the accesses that are available to *both* the COCO User and COCO Third Party Application.

      * - CREATED_TIMESTAMP
        - 
        - 
        - DATETIME
        - Date and Time when this table record was inserted

      * - CREATED_BY_USER_ID
        - 
        - 
        - TEXT
        - Not currently in use


Resource Information
####################

**RESOURCE** - Table containing information about the Resources [link] provided by this COCO Device.

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key
        - SQLite Data Type
        - Description

      * - DELETE_FLAG
        - 
        - 
        - TEXT
        - Set to 'Y' or 'N' to indicate whether the row has been soft-deleted

      * - RESOURCE_EUI
        - X
        - 
        - TEXT
        - Extended Unique Identifier for uniquely identifying the Resource within this COCO Device. The same Resource EUI can exist on two different COCO Devices, so the Unique Device Identifier (Device ID) must be used in combination with Resource EUI to uniquely identify a Resource across the entire COCONet.

      * - RESOURCE_BASIC_INFO
        - 
        - 
        - TEXT
        - JSON String containing additional information about the resource.

      * - CREATED_TIMESTAMP
        - 
        - 
        - DATETIME
        - Date and Time when this table record was inserted

      * - CREATED_BY_USER_ID
        - 
        - 
        - TEXT
        - Not currently in use


.. sidebar:: RESOURCE_BASIC_INFO JSON Format

   .. list-table::
      :header-rows: 1

      * - JSON Field
        - Data Type
        - Description

      * - resourceName
        - String
        - Name of the Resource

      * - manufacturer
        - String
        - Name of Resource Manufacturer

      * - model
        - String
        - Model Number of Resource

      * - firmwareVersion
        - String
        - Current Firmware Version installed, for hardware resources. For software resources, this indicates the software version of the service representing the resource.

      * - metadata
        - String
        - Metadata information about the resource that may be utilized by Third Party Client Application to store app-specific information.

      * - powerSource
        - int32_t
        - The Power Source of a hardware resource (battery, mains power, etc.). For a software resource, this may be omitted or it may indicate the power source of the device that hosts the service representing the resource. For possible values, see declaration of *coco_std_power_source_t* in *coco_std_api.h*.

      * - receiverType
        - int32_t
        - Indicator of how the resource listens for incoming radio signals, for a hardware resource (e.g. listens when idle, listens periodically, listens when awoken, etc.). For a software resource, this is optional. For possible values, see declaration of *coco_std_receiver_type_t* in *coco_std_api.h*.

      * - explorationStatus
        - int32_t
        - Status of the Exploration process on an IoT resource. The Exploration process queries an IoT resource to find out its Capabilities. For non-IoT resources, this may be omitted if not applicable. Possible values are COCO_STD_STATUS_SUCCESS, COCO_STD_STATUS_PARTIAL_SUCCESS, COCO_STD_STATUS_RESOURCE_NOT_SUPPORTED, COCO_STD_STATUS_SUCCESS_INSECURE and COCO_STD_STATUS_PARTIAL_SUCCESS_INSECURE (enum values of *coco_std_status_code_t* declared in *coco_std_api.h*).

      * - metadataArr
        - Array of JSON Strings
        - The metadata of this resource for different Sub-clusters. See below for the format of the JSON elements. See *RESOURCE_SUBCLUSTER_METADATA* for further explanation.


.. sidebar:: metadataArr - Format of JSON Element of Array

   .. list-table::
      :header-rows: 1

      * - JSON Field
        - Data Type
        - Description

      * - subclusterId
        - uint32_T
        - Sub-cluster ID

      * - metadata
        - String
        - Metadata of Resource for this Sub-cluster


**RESOURCE_CAPABILITY** - Table containing information about the Capabilities [link] offered by each of the Resources provided by this COCO Device.

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key (To Table.Column)
        - SQLite Data Type
        - Description

      * - DELETE_FLAG
        - 
        - 
        - TEXT
        - Set to 'Y' or 'N' to indicate whether the row has been soft-deleted

      * - RESOURCE_EUI
        - X
        - To RESOURCE.RESOURCE_EUI
        - TEXT
        - Extended Unique Identifier for uniquely identifying the Resource within this COCO Device. The same Resource EUI can exist on two different COCO Devices, so the Unique Device Identifier (Device ID) must be used in combination with Resource EUI to uniquely identify a Resource across the entire COCONet.

      * - RESOURCE_CAPABILITY_INFO
        - 
        - 
        - TEXT
        - JSON String containing additional information about the resource capability - see details in table below.

      * - CREATED_TIMESTAMP
        - 
        - 
        - DATETIME
        - Date and Time when this table record was inserted

      * - CREATED_BY_USER_ID
        - 
        - 
        - TEXT
        - Not currently in use


.. sidebar:: RESOURCE_CAPABILITY_INFO JSON Format

   .. list-table::
      :header-rows: 1

      * - JSON Field
        - Data Type
        - Description

      * - capabilityName
        - String
        - Name of Capability

      * - stdCmdArr
        - Array of int32_t values
        - Array of the Standard Commands belonging to this capability that are provided by this resource. For possible int32_t values, see the *coco_std_cmd_xxx_t* enum declarations under the header file belonging to each COCO Standard Capability, for e.g. the *coco_std_cmd_on_off_t* enum in *coco_std_data_on_off_types.h* represents the possible Standard Command ID's in the COCO Standard On/Off Capability.


*RESOURCE_CAPABILITY_ATTRIBUTE* - Table containing information about the Attributes [link] stored within each of the Capabilities offered by each of the Resources provided by this COCO Device.

*REMOVED_RESOURCE* - Table containing the list of Resources that have been removed from this COCO Device. ?????? This is utilized to resolve certain race conditions where different Client Applications may perform successive actions for adding, removing and then once again adding a resource to the COCONet. ??????


Resource Sub-cluster Information
################################

*RESOURCE_SUBCLUSTER_METADATA* - Table containing Metadata that is specific to different Sub-clusters within the COCONet, for the Resources provided by this COCO Device. Different Client Applications or groups of related applications (such as a Microsoft Office-like suite of products, or the COCO iOS and Android Apps) are assigned a unique Sub-cluster Identifier (or Sub-cluster ID) of their own. Different Resource Metadata can be stored for each of the Resources in the COCONet for each of the Sub-clusters in the COCONet. For example, the COCO App has pre-defined resource icons and it assigns them to resources by storing the Icon Identifier as the Metadata for the Resource for the COCO App's Sub-cluster. Similarly, another product using the COCO platform may define it's own back-end or UI-specific data that it may store as Resource Sub-cluster Metadata.


Zone Information
################

*ZONE* - Table containing information about the Zones [link] that are defined in this COCO Device's COCONet. This contains information about all the Zones of the COCONet including those not containing any of the Resources provided by this COCO Device.

*ZONE_RESOURCE* - Table containing information about the Resources contained within each of the Zones [link] existing in this COCO Device's COCONet. This contains information about all the Resources of the COCONet including the Resources not provided by this COCO Device.


Scene Information
#################

*SCENE* - Table containing information about the Scenes [link] that are defined in this COCO Device's COCONet. This contains information about all the Scenes of the COCONet including those containing actions for Resources not provided by this COCO Device.

*SCENE_RESOURCE_ACTION* - Table containing information about the Resource Actions defined for each of the Scenes [link] existing in this COCO Device's COCONet. This contains information about the actions of all the Resources of the COCONet including the Resources not provided by this COCO Device.


Scene Sub-cluster Information
#############################

*SCENE_SUBCLUSTER_METADATA* - Table containing Metadata that is specific to different Sub-clusters within the COCONet, for the Scenes defined in this COCO Device's COCONet. For example, the COCO App has pre-defined scene icons and it assigns them to scenes by storing the Icon Identifier as the Metadata for the Scene for the COCO App's Sub-cluster. See Resource Sub-cluster Information [link] for an explanation of Sub-cluster Metadata.


Rule Information
################

*RULE* - Table containing information about the Rules [link] that are defined in this COCO Device's COCONet. This contains information about all the Rules of the COCONet including those not containing any actions or conditions for the Resources provided by this COCO Device.

*RULE_RESOURCE_ACTION* - Table containing information about the Resource Actions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about the actions of all the Resources of the COCONet including the Resources not provided by this COCO Device.

*RULE_SCENE_ACTION* - Table containing information about the Scene Actions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about all the Scenes of the COCONet including those not having any actions for the Resources provided by this COCO Device.

*RULE_CONDN_RES_CAP_ATTR* - Table containing information about the Resource Attribute Conditions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about all the conditions of all the Rules of the COCONet including the conditions relating to Resources not provided by this COCO Device.

*RULE_SCHEDULE_CONDITION* - Table containing information about the Schedule Conditions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about the schedule conditions of all the Rules of the COCONet those the Rules that don't have any actions or conditions relating to the resources provided by this COCO Device.


Pragmas and DB Configuration
****************************

The following SQLite Database Pragmas are configured during the initialization of the cocodb library. As mentioned in the Introduction [link], there are two active databases - one on disk and the other in memory to optimize performance. The configuration of both databases is covered below:

Disk Database Configuration
###########################

*PRAGMA FOREIGN_KEYS = ON* - to enable foreign key constraints in the database, to ensure that data integrity is maintained across the tables.

*PRAGMA TEMP_STORE = MEMORY* - to store all of the temporary tables and indices in memory (i.e. in RAM, as opposed to storing them in a file). These temporary tables and indices may be created by SQLite as part of its processing of database transactions. The cocodb library chooses to store these in memory in order to reduce I/O operations to optimize performance, and also to reduce disk space usage on space-constrained COCO Devices.

*PRAGMA MAIN.JOURNAL_MODE = PERSIST* - to handle transaction commits in such a manner that the database journal file's first block is overwritten with zeroes (as opposed to either deleting or truncating the file). The cocodb library uses this setting to reduce I/O operations and optimize performance.

*PRAGMA MAIN.CACHE_SIZE = 1000* - to configure the caching of the database file in memory such that it holds up to 1,000 pages in memory before deleting older pages from memory. The cocodb library uses this setting to reduce I/O operations and optimize performance

*PRAGMA MAIN.LOCKING_MODE = EXCLUSIVE* - to configure the file locks on the database file such that they are never released by the cocodb library after acquiring them the first time (as opposed to releasing them at the end of each database write transaction). Since acquiring and releasing locks uses up the compute resources of a COCO Device, the cocodb library uses this setting so that compute utilization is optimized - there is no need for the locks to ever be released once acquired since no other process running on the same COCO Device has a need to update the cocodb.

*PRAGMA MAIN.SYNCHRONOUS = FULL* - to configure the disk writing mode of the database such that it ensures that all data is completely written to disk before returning from its disk write operation (as opposed to other modes which run faster but are not completely safe). Although this is slow, it ensures that power outages or process crashes will not corrupt the database. We can afford for disk writes to be slower since the disk writing in the cocodb library is done asynchronously from the data already written to the in-memory database.


In-Memory Database Configuration
################################

*PRAGMA FOREIGN_KEYS = ON* - to enable foreign key constraints in the database, to ensure that data integrity is maintained across the tables.

*PRAGMA TEMP_STORE = MEMORY* - to store all of the temporary tables and indices in memory. See Disk Database Configuration [link] for further explanation of this PRAGMA.

*PRAGMA MAIN.JOURNAL_MODE = MEMORY* - to enable the rollback journal, so that transaction handling will be be done for the in-memory database (note that MEMORY and OFF are the only permissible values of this PRAGMA for an in-memory database).

*PRAGMA MAIN.CACHE_SIZE* - not applicable, since by definition, all pages of the in-memory database are always kept in memory.

*PRAGMA MAIN.LOCKING_MODE* - not applicable. EXCLUSIVE locking mode is always used for in-memory databases and cannot be changed. See Disk Database Configuration [link] for further explanation of this PRAGMA.

*PRAGMA MAIN.SYNCHRONOUS = OFF* - to disable any kind of safe data writing of the in-memory database i.e. SQLite does not attempt to ensure the safe writing of data to memory, since this is not necessary due to the volatile nature of the system memory (RAM). See Disk Database Configuration [link] for further explanation of this PRAGMA.

Transaction Handling - 0:15
********************

State Machine
#############

In-Memory Database Copy
***********************

Lazy Disk Writing for better performance
****************************************

Detecting and Handling DB Corruption
************************************

Database Migrations during Firmware Updates
*******************************************

