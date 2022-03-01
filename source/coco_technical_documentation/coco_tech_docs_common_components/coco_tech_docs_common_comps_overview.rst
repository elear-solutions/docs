.. sectionauthor:: Manav

.. _coco_tech_docs_common_comps_overview:

Overview
========
The following are the common components used by all components in the COCO system:

**elearcommon** - for common utilities such as Timers, Event Loops, Memory Management and so on.

**cococommon** - for common utilities specific to the COCO product, currently consisting of the conversions of C structures to JSON's and vice versa.

**httpserver** - for providing a component with the ability to provide REST API's of it's own to be consumed by other components.

**httpclient** - for making REST API calls and processing the responses to the calls.

**jwt-c** - for handling Java Web Tokens (JWT) used in the Auth and OAuth security protocols.

**cocostandard** - for providing the declarations and struct/JSON handlers for all of the COCO Capabilities [link], Commands [link], Attributes  [link] and Info Requests [link]. 

