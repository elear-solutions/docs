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

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key (To Table.Column)
        - SQLite Data Type
        - Description

      * - DB_VERSION
        - 
        - 
        - TEXT
        - The currently installed version of the cocodb

      * - APP_VERSION
        - 
        - 
        - TEXT
        - The currently installed version of the Firmware of this COCO Device

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


Device Information
##################

DEVICE_INFO
***********

Table containing information about this COCO Device.

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

      * - DEVICE_NAME
        - 
        - 
        - TEXT
        - Name of this COCO Device in the COCONet

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

NETWORK
*******

Table containing information about the COCONet that this COCO Device belongs to. In the current platform, this table only contains one row since a COCO Device can only belong to one COCONet at a time.

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

NODE
****

Table containing information about the Client Application nodes that exist in the COCONet that this COCO Device belongs to.

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

RESOURCE
********

Table containing information about the Resources [link] provided by this COCO Device.

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


RESOURCE_CAPABILITY
*******************

Table containing information about the Capabilities [link] offered by each of the Resources provided by this COCO Device.

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
        - Extended Unique Identifier for uniquely identifying the Resource within this COCO Device. See  :ref:`RESOURCE` table for further explanation.

      * - CAPABILITY_ID
        - X
        - 
        - INT
        - Unique Identifier of the supported Capability of the Resource. The ID should be one of the values of the enum **coco_std_capability_t** declared in **coco_std_api.h**.

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
        - Array of the Standard Commands belonging to this capability that are provided by this resource. For possible int32_t values, see the *coco_std_cmd_xxx_t* enum declarations under the header file belonging to each COCO Standard Capabilities, for e.g. the *coco_std_cmd_on_off_t* enum in *coco_std_data_on_off_types.h* represents the possible Standard Command ID's in the COCO Standard On/Off Capability.


RESOURCE_CAPABILITY_ATTRIBUTE
*****************************

Table containing information about the Attributes [link] stored within each of the Capabilities offered by each of the Resources provided by this COCO Device.

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
        - To RESOURCE.RESOURCE_EUI (Composite key with CAPABILITY_ID column)
        - TEXT
        - Extended Unique Identifier for uniquely identifying the Resource within this COCO Device. See :ref:`RESOURCE` table for further explanation.

      * - CAPABILITY_ID
        - X
        - To RESOURCE.CAPABILITY_ID (Composite key with RESOURCE_EUI column)
        - INT
        - Unique Identifier of the supported Capability of the Resource. See :ref:`RESOURCE_CAPABILITY` table for futher information.

      * - ATTRIBUTE_ID
        - X
        - 
        - INT
        - Unique Identifier of the supported Attribute within the supported Capability of the Resource. For possible Attribute ID values, see the *coco_std_attr_xxx_t* enum declarations under the header file belonging to each COCO Standard Capabilities, for e.g. the *coco_std_attr_on_off_t* enum in *coco_std_data_on_off_types.h* represents the possible Attribute ID's in the COCO Standard On/Off Capability.

      * - RESOURCE_CAP_ATTRIBUTE_INFO
        - 
        - 
        - TEXT
        - JSON String containing additional information about the resource attribute - see details in table below.

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


.. sidebar:: RESOURCE_CAP_ATTRIBUTE_INFO JSON Format

   .. list-table::
      :header-rows: 1

      * - JSON Field
        - Data Type
        - Description

      * - attribName
        - String
        - Name of COCO Attribute

      * - attribDesc
        - String
        - Description of COCO Attributes

      * - dataArrayLen
        - uint32_t
        - Number of elements in the currentValue array, for an array type of attribute

      * - dataType
        - int32_t
        - Data Tyoe of Attribute

      * - minValue
        - Depends on dataType
        - The minimum permitted value for the attribute by this COCO Device

      * - maxValue
        - Depends on dataType
        - The maximum permitted value for the attribute by this COCO Device

      * - defaultValue
        - Depends on dataType
        - The default value set for the attribute by this COCO Device

      * - currentValue
        - Depends on dataType
        - The current value of the attribute i.e. the value that represents the current state or configured setting or latest reported data for the resource

      * - reportableChange
        - Depends on dataType
        - For a numeric attribute, this represents the amount of change in the attribute that will cause the COCO Device to publish an attribute report to all Client Applications

      * - minReportingIntervalMs
        - uint32_t
        - The minimum interval (in milliseconds) at which the COCO Device must publish an attribute report to all Client Applications. This means that even if there are multiple changes in the attribute, the COCO Device must publish only one attribute report for every interval denoted by minReportingIntervalMs. For e.g. minReportingIntervalMs = 10 seconds, and the attribute value changes after 5 seconds and 7 seconds. There will be an attribute report at or after the 10-second mark (the exact timing will depend on the maxReportingIntervalMs attribute).

      * - maxReportingIntervalMs
        - uint32_t
        - The maximum interval (in milliseconds) at which the COCO Device must publish an attribute report to all Client Applications. This means that even if there is no change in the attribute, the COCO Device must publish an attribute report when the duration denoted by maxReportingIntervalMs has elapsed. For e.g. maxReportingIntervalMs = 5 seconds and an attribute value changes after 17 seconds - there will be attribute reports at 5, 10, 15 and 17 seconds (assume the minReportingInterval is 2 seconds).

      * - isRealTimeUpdate
        - Boolean
        - Flag denoting whether or not this represents an actual change in the resource, or whether this is a past attribute report being re-published for the purposes of ensuring the accuracy and reliability of resource data.

      * - persist
        - uint32_t
        - Flag denoting whether or not this value is persisted in the cocodb.

      * - lastUpdateTimestamp
        - uint32_t
        - The last date and time of this attribute was modified



REMOVED_RESOURCE
****************

Table containing the list of Resources that have been removed from this COCO Device. ?????? Explain the reason for this here ??????

.. sidebar:: Schema

   .. list-table::
      :header-rows: 1

      * - Column
        - Primary Key
        - Foreign Key (To Table.Column)
        - SQLite Data Type
        - Description

      * - RESOURCE_EUI
        - 
        - 
        - TEXT
        - Extended Unique Identifier for uniquely identifying the Resource within this COCO Device. See :ref:`RESOURCE` table for further explanation.

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


Resource Sub-cluster Information
################################

RESOURCE_SUBCLUSTER_METADATA
****************************

Table containing Metadata that is specific to different Sub-clusters within the COCONet, for the Resources provided by this COCO Device. Different Client Applications or groups of related applications (such as a Microsoft Office-like suite of products, or the COCO iOS and Android Apps) are assigned a unique Sub-cluster Identifier (or Sub-cluster ID) of their own. Different Resource Metadata can be stored for each of the Resources in the COCONet for each of the Sub-clusters in the COCONet. For example, the COCO App has pre-defined resource icons and it assigns them to resources by storing the Icon Identifier as the Metadata for the Resource for the COCO App's Sub-cluster. Similarly, another product using the COCO platform may define it's own back-end or UI-specific data that it may store as Resource Sub-cluster Metadata.

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
        - 
        - TEXT
        - Extended Unique Identifier for uniquely identifying the Resource within a COCO Device. See :ref:`RESOURCE` table for further explanation.

      * - SUBCLUSTER_ID
        - X
        - 
        - INT
        - Unique Identifier of the Client Application Sub-cluster to which the metadata belongs.

      * - METADATA
        - 
        - 
        - TEXT
        - Free-form Metadata string. The format is determined by the Third Party Application.

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

Zone Information
################

ZONE
****

Table containing information about the Zones [link] that are defined in this COCO Device's COCONet. This contains information about all the Zones of the COCONet including those not containing any of the Resources provided by this COCO Device.

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

      * - ZONE_ID
        - 
        - 
        - INT
        - Unique Identifer of the Zone within the COCONet.

      * - ZONE_NAME
        - 
        - 
        - TEXT
        - Name of the Zone

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


ZONE_RESOURCE
*************

Table containing information about the Resources contained within each of the Zones [link] existing in this COCO Device's COCONet. This contains information about all the Resources of the COCONet including the Resources not provided by this COCO Device.

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

      * - ZONE_ID
        - X
        - To ZONE.ZONE_ID
        - INT
        - Unique Identifer of the Zone within the COCONet.

      * - GATEWAY_NODE_ID
        - X
        - 
        - INT
        - Node ID of the COCO Device to which the Zone's Resource belongs.

      * - RESOURCE_EUI
        - X
        - 
        - TEXT
        - EUI of the Resource contained within the Zone.

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


Scene Information
#################

SCENE
*****

Table containing information about the Scenes [link] that are defined in this COCO Device's COCONet. This contains information about all the Scenes of the COCONet including those containing actions for Resources not provided by this COCO Device.

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

      * - SCENE_ID
        - 
        - 
        - INT
        - Unique Identifer of the Scene within the COCONet.

      * - SCENE_NAME
        - 
        - 
        - TEXT
        - Name of the Scene

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


SCENE_RESOURCE_ACTION
*********************

Table containing information about the Resource Actions defined for each of the Scenes [link] existing in this COCO Device's COCONet. This contains information about the actions of all the Resources of the COCONet including the Resources not provided by this COCO Device.

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

      * - SCENE_ID
        - X
        - To SCENE.SCENE_ID
        - INT
        - Unique Identifer of the Scene within the COCONet.

      * - SCENE_RESOURCE_ACTION_ID
        - X
        - 
        - INT
        - Unique Identifier of this resource action within this Scene

      * - GATEWAY_NODE_ID
        - 
        - 
        - INT
        - Node ID of the COCO Device to which the Resource of this resource action belongs.

      * - RESOURCE_EUI
        - 
        - 
        - TEXT
        - EUI of the Resource for which this resource action is to be executed.

      * - CAPABILITY_ID
        - 
        - 
        - INT
        - Unique Identifier of the supported Capability of the Resource in which the resource command is to be executed as part of this resource action.

      * - CMD_ID
        - 
        - 
        - INT
        - COCO Standard Command ID of the resource command to be executed in this resource action. For possible values, see the :ref:`RESOURCE_CAPABILITY` table.

      * - CMD_PARAMS
        - 
        - 
        - TEXT
        - JSON String containing the values of the parameters to be passed with the resource command as a part of this resource action. For the possible parameters of resource commands, see the **coco_std_cmd_<cmd_name>_t** structure declarations under the header file belonging to each COCO Standard Capabilities, for e.g. the *coco_std_cmd_set_level_t* struct in *coco_std_data_level_types.h* represents the possible parameters for the Set Level resource command in the COCO Standard Level Control Capability.

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


Scene Sub-cluster Information
#############################

SCENE_SUBCLUSTER_METADATA
*************************

Table containing Metadata that is specific to different Sub-clusters within the COCONet, for the Scenes defined in this COCO Device's COCONet. For example, the COCO App has pre-defined scene icons and it assigns them to scenes by storing the Icon Identifier as the Metadata for the Scene for the COCO App's Sub-cluster. See :ref:`Resource Sub-cluster Information` for an explanation of Sub-cluster Metadata.

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

      * - SCENE_ID
        - X
        - 
        - INT
        - Unique Identifer of the Scene within the COCONet.

      * - SUBCLUSTER_ID
        - X
        - 
        - INT
        - Unique Identifier of the Client Application Sub-cluster to which the metadata belongs.

      * - METADATA
        - 
        - 
        - TEXT
        - Free-form Metadata string. The format is determined by the Third Party Application.

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


Rule Information
################

RULE
****

Table containing information about the Rules [link] that are defined in this COCO Device's COCONet. This contains information about all the Rules of the COCONet including those not containing any actions or conditions for the Resources provided by this COCO Device.

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

      * - RULE_ID
        - 
        - 
        - INT
        - Unique Identifer of the Rule within the COCONet.

      * - RULE_NAME
        - 
        - 
        - TEXT
        - Name of the Rule

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


RULE_RESOURCE_ACTION
********************

Table containing information about the Resource Actions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about the actions of all the Resources of the COCONet including the Resources not provided by this COCO Device.

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

      * - RULE_ID
        - X
        - To RULE.RULE_ID
        - INT
        - Unique Identifer of the Rule within the COCONet.

      * - RULE_RESOURCE_ACTION_ID
        - X
        - 
        - INT
        - Unique Identifier of this resource action within this Rule

      * - GATEWAY_NODE_ID
        - 
        - 
        - INT
        - Node ID of the COCO Device to which the Resource of this resource action belongs.

      * - RESOURCE_EUI
        - 
        - 
        - TEXT
        - EUI of the Resource for which this resource action is to be executed.

      * - CAPABILITY_ID
        - 
        - 
        - INT
        - Unique Identifier of the supported Capability of the Resource in which the resource command is to be executed as part of this resource action.

      * - CMD_ID
        - 
        - 
        - INT
        - COCO Standard Command ID of the resource command to be executed in this resource action. For possible values, see the :ref:`RESOURCE_CAPABILITY` table.

      * - CMD_PARAMS
        - 
        - 
        - TEXT
        - JSON String containing the values of the parameters to be passed with the resource command as a part of this resource action. See the :ref:`SCENE_RESOURCE_ACTION` table for further explanation.

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


RULE_SCENE_ACTION
*****************

Table containing information about the Scene Actions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about all the Scenes of the COCONet including those not having any actions for the Resources provided by this COCO Device.

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

      * - RULE_ID
        - X
        - To RULE.RULE_ID
        - INT
        - Unique Identifer of the Rule within the COCONet.

      * - SCENE_ID
        - X
        - 
        - INT
        - Scene ID of the scene to be executed in this scene action within the Rule.

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


RULE_CONDN_RES_CAP_ATTR
***********************

Table containing information about the Resource Attribute Conditions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about all the conditions of all the Rules of the COCONet including the conditions relating to Resources not provided by this COCO Device.

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

      * - RULE_ID
        - X
        - To RULE.RULE_ID
        - INT
        - Unique Identifer of the Rule within the COCONet.

      * - RULE_RESOURCE_CONDN_ID
        - X
        - 
        - INT
        - Unique Identifier of this resource condition within this Rule

      * - GATEWAY_NODE_ID
        - 
        - 
        - INT
        - Node ID of the COCO Device to which the Resource of this resource condition belongs.

      * - RESOURCE_EUI
        - 
        - 
        - TEXT
        - EUI of the Resource to which this resource condition belongs

      * - CAPABILITY_ID
        - 
        - 
        - INT
        - Unique Identifier of the supported Capability of the Resource to which this resource condition belongs

      * - ATTRIBUTE_ID
        - 
        - 
        - INT
        - Unique Identifier of the supported Attribute of the Capability and Resource to which this resource condition belongs

      * - RULE_CONDN_OPERATOR_ID
        - 
        - 
        - INT
        - Numeric Identifier of the Relational Condition to be applied in this resource condition. For e.g. 'Equals' or 'Greater Than'. The possible numeric values of this column are specified in the **rule_condn_operator_id** enum in the **cocodb_common_types.h** header file.

      * - RULE_CONDN_VAL_DATA_TYPE_ID
        - 
        - 
        - INT
        - The Data Type of the value to which this resource condition is applied. The possible numeric values of this column are specified in the **rule_condn_data_type_id** enum in the **cocodb_common_types.h** header file.

      * - CURRENT_VAL
        - 
        - 
        - TEXT
        - The Current Value of the resource attribute to which this resource condition belongs. The COCO Device's Rules Engine uses this column to evaluate whether a resource condition is satisfied. Whenever a report is published for this attribute, the current value is updated in this column. The reason this is needed in addition to the :ref:`RESOURCE_CAPABILITY_ATTRIBUTE` table's current value is because the resource condition might belong to a resource that exists on a different COCO Device - in such an instance, the attribute data of the resource will not be available in the RESOURCE_CAPABILITY_ATTRIBUTE table of this device's cocodb.

      * - RULE_CONDN_VAL
        - 
        - 
        - TEXT
        - The Target Value that must be satisfied using the RULE_CONDN_OPERATOR_ID above (for e.g. 'Less Than or Equal To' 3) in order for the rule actions to be executed.

      * - RULE_CONDN_DUR_MS
        - 
        - 
        - INT
        - The duration (in milliseconds) for which the resource attribute must satisfy this resource condition in order for the rule actions to be executed. For e.g. if the condition is <= 3 with a duration of 3,000 milliseconds (or 3 seconds), and the value changes to 4 after 1,000 milliseconds, the rule will not be executed. If the value remains within 3, the rule will be executed at the 3,000-millisecond mark.

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


RULE_SCHEDULE_CONDITION
***********************

Table containing information about the Schedule Conditions defined for each of the Rules [link] existing in this COCO Device's COCONet. This contains information about the schedule conditions of all the Rules of the COCONet those the Rules that don't have any actions or conditions relating to the resources provided by this COCO Device.

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

      * - RULE_ID
        - X
        - To RULE.RULE_ID
        - INT
        - Unique Identifer of the Rule within the COCONet.

      * - RULE_SCHED_CONDN_ID
        - X
        - 
        - INT
        - Unique Identifier of this schedule condition within this Rule

      * - RULE_CONDN_SCHED_TYPE_ID
        - 
        - 
        - TEXT
        - The schedule type which specifies the frequency at which the schedule occurs for this schedule condition. For e.g. the schedule could specify executing a rule once a month on the 3rd day of the month within a specified time range, as long as all resource conditions are met. The possible numeric values of this column are specified in the **coco_std_rule_sched_type_t** enum in the **coco_std_api.h** header file of the **cocostandard** library.

      * - RULE_START_TIME
        - 
        - 
        - DATETIME
        - A Date/Time value specifying the first date of execution, and the beginning of the time range within a 24-hour time window, within which this rule must be executed. As long as nothing goes wrong, the rule will execute at this Start Time. However, for instance, if the COCO Device is offline at the start time, the rule will execute at the earliest possible time bfore the Expiry Time, if the COCO Device comes online again within the time range. After the first execution date has passed, the next execution date is determined by the RULE_CONDN_SCHED_TYPE_ID - for instance, a 'Daily' schedule type results in the rule executing again on the next day, whereas a 'Monthly' type results in execution occuring again on the next month on which the same day of month occurs again (for instance, if the date is the 31st, the rule will only execute on six out of twelve months of the year).

      * - RULE_EXP_TIME
        - 
        - 
        - DATETIME
        - The end of the time range within a 24-hour time window, within which this rule must be executed.

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


****************************
Pragmas and DB Configuration
****************************

The following SQLite Database Pragmas are configured during the initialization of the cocodb library. As mentioned in the Introduction [link], there are two active databases - one on disk and the other in memory to optimize performance. The configuration of both databases is covered below:

Disk Database Configuration
###########################

**PRAGMA FOREIGN_KEYS = ON** - to enable foreign key constraints in the database, to ensure that data integrity is maintained across the tables.

**PRAGMA TEMP_STORE = MEMORY** - to store all of the temporary tables and indices in memory (i.e. in RAM, as opposed to storing them in a file). These temporary tables and indices may be created by SQLite as part of its processing of database transactions. The cocodb library chooses to store these in memory in order to reduce I/O operations to optimize performance, and also to reduce disk space usage on space-constrained COCO Devices.

**PRAGMA MAIN.JOURNAL_MODE = PERSIST** - to handle transaction commits in such a manner that the database journal file's first block is overwritten with zeroes (as opposed to either deleting or truncating the file). The cocodb library uses this setting to reduce I/O operations and optimize performance.

**PRAGMA MAIN.CACHE_SIZE = 1000** - to configure the caching of the database file in memory such that it holds up to 1,000 pages in memory before deleting older pages from memory. The cocodb library uses this setting to reduce I/O operations and optimize performance

**PRAGMA MAIN.LOCKING_MODE = EXCLUSIVE** - to configure the file locks on the database file such that they are never released by the cocodb library after acquiring them the first time (as opposed to releasing them at the end of each database write transaction). Since acquiring and releasing locks uses up the compute resources of a COCO Device, the cocodb library uses this setting so that compute utilization is optimized - there is no need for the locks to ever be released once acquired since no other process running on the same COCO Device has a need to update the cocodb.

**PRAGMA MAIN.SYNCHRONOUS = FULL** - to configure the disk writing mode of the database such that it ensures that all data is completely written to disk before returning from its disk write operation (as opposed to other modes which run faster but are not completely safe). Although this is slow, it ensures that power outages or process crashes will not corrupt the database. We can afford for disk writes to be slower since the disk writing in the cocodb library is done asynchronously from the data already written to the in-memory database.


In-Memory Database Configuration
################################

**PRAGMA FOREIGN_KEYS = ON** - to enable foreign key constraints in the database, to ensure that data integrity is maintained across the tables.

**PRAGMA TEMP_STORE = MEMORY** - to store all of the temporary tables and indices in memory. See Disk Database Configuration [link] for further explanation of this PRAGMA.

**PRAGMA MAIN.JOURNAL_MODE = MEMORY** - to enable the rollback journal, so that transaction handling will be be done for the in-memory database (note that MEMORY and OFF are the only permissible values of this PRAGMA for an in-memory database).

**PRAGMA MAIN.CACHE_SIZE** - not applicable, since by definition, all pages of the in-memory database are always kept in memory.

**PRAGMA MAIN.LOCKING_MODE** - not applicable. EXCLUSIVE locking mode is always used for in-memory databases and cannot be changed. See Disk Database Configuration [link] for further explanation of this PRAGMA.

**PRAGMA MAIN.SYNCHRONOUS = OFF** - to disable any kind of safe data writing of the in-memory database i.e. SQLite does not attempt to ensure the safe writing of data to memory, since this is not necessary due to the volatile nature of the system memory (RAM). See Disk Database Configuration [link] for further explanation of this PRAGMA.

********************
Transaction Handling - 0:15
********************

State Machine
#############

***********************
In-Memory Database Copy
***********************

****************************************
Lazy Disk Writing for better performance
****************************************

************************************
Detecting and Handling DB Corruption
************************************

*******************************************
Database Migrations during Firmware Updates
*******************************************

