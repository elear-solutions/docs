.. sectionauthor:: Manav

.. _cocodb_intro:

Introduction
============

The cocodb repo implements an SQLite-based Database for storing the data used by the Device SDK for its processing, including :ref: `COCONet <terminology_aiot:COCONet>` and :ref:`Resource <terminology_aiot:Resource>` information.

The cocodb library depends on the following third-party libraries:

* The cococommon [link] library of common COCO utilities and frameworks, including struct-to-JSON conversion utilities (and vice versa). 
* The cocostandard [link] library providing the declarations of capabilities for the COCO standard as well as other commonly used data structures such as Resource information, which are utilized for writing and retrieving data in the cocodb.
* The cocostandard library itself links statically to the elearcommon [link] library which provides common utilities and frameworks used by the cocodb library code.
* The **sqlite** database library

The cocodb library implements the following services:

* Maintaining an SQLite-based COCO Device Database (cocodb) for storing COCONet and Resource information, as well as other information used by the COCO Device that is required to be persistant.
* Allowing related database updates to be processed as a transaction i.e. if any of the updates fail, all other updates in the transaction are rolled back so that the database remains in a consistent state.
* Maintaining an in-memory copy of the database (in RAM) for faster querying of data.
* Asynchronously performing database I/O operations on persistent storage (flash or hard disk) in order to optimize performance.
* Detecting and handling database corruption
* Performing cascading database migrations when the COCO Device firmware is updated, for each of the firmware versions between the old and new firmware version.
