.. _quick_start_guide_linux_coco_for_devices:

Quick Start Guide
=================
Build and run your first Device App in a few short steps by following
the guide below.

1. ‘Signup’ for a new COCO account or ‘Sign In’ if you have one by following this `link <https://manage.getcoco.buzz/>`__
------------------------------------------------------------------------------------------------------------------------------

.. image:: quick_start_guide_linux_coco_for_devices/step1.png
   :alt: Step 1

2. Create a Product for running the Sample Device App (usually will be a Product representing the SKU of the devices to be deployed).
-------------------------------------------------------------------------------------------------------------------------------------

a. Click on 'Devices’

.. image:: quick_start_guide_linux_coco_for_devices/step2a.png
   :alt: Step 2a

b. Click on ‘(+) Product’

.. image:: quick_start_guide_linux_coco_for_devices/step2b.png
   :alt: Step 2b

c. Fill in the details for a new Product.

.. image:: quick_start_guide_linux_coco_for_devices/step2c.png
   :alt: Step 2c

3. Create a license for a device, in order to run the Sample Device App
-----------------------------------------------------------------------

a. Click on your Product to go to the Product Details page.

.. image:: quick_start_guide_linux_coco_for_devices/step3a.png
   :alt: Step 3a

b. Click on ‘Device Licenses’

.. image:: quick_start_guide_linux_coco_for_devices/step3b.png
   :alt: Step 3b

c. Enter the number of licenses required as 1 (usually will be entered
   as the no. of devices to be deployed for the Product).

.. image:: quick_start_guide_linux_coco_for_devices/step3c.png
   :alt: Step 3c

4. Set up the Sample Device App
-------------------------------

a. Download the license file for a device, using the ‘Download’ icon.

.. image:: quick_start_guide_linux_coco_for_devices/step4a.png
   :alt: Step 4a

b. Download cocodevicesdk.so

c. Download the Sample Device App source code and
   compile it by linking it to cocodevicesdk.so

d. Copy the downloaded license file to the host where you intend to run
   the Sample Device App, and rename it to **config.txt**

5. Run the Sample Device App.
-----------------------------

a. Run the Sample Device App using a command similar to:

   ::

       sudo <Sample Device App path> -d <Working Directory path> -c <config.txt path>

b. Download the ‘COCO Home’ App on your Mobile Phone (from the Apple or
   Google Store), if it’s not already downloaded.

c. Sign in using your COCO account credentials.

.. image:: quick_start_guide_linux_coco_for_devices/step5c.jpg
   :width: 45%
   :align: center
   :alt: Step 5c

d. Create a new COCONet, if you don’t already have one.

.. image:: quick_start_guide_linux_coco_for_devices/step5d.jpg
   :width: 45%
   :align: center
   :alt: Step 5d

e. Connect to the COCONet.

.. image:: quick_start_guide_linux_coco_for_devices/step5e.jpg
   :width: 45%
   :align: center
   :alt: Step 5e

f. Click on ‘+’

.. image:: quick_start_guide_linux_coco_for_devices/step5f.jpg
   :width: 45%
   :align: center
   :alt: Step 5f

g. Select ‘Devices’ in the popup menu.

.. image:: quick_start_guide_linux_coco_for_devices/step5g.jpg
   :width: 45%
   :align: center
   :alt: Step 5g

h. Select ‘Gateway’

.. image:: quick_start_guide_linux_coco_for_devices/step5h.jpg
   :width: 45%
   :align: center
   :alt: Step 5h

i. Select ‘Skip Internet Setup’

.. image:: quick_start_guide_linux_coco_for_devices/step5i.jpg
   :width: 45%
   :align: center
   :alt: Step 5i

j. Enter the device details. The Device PSN must match the one in the
   downloaded license file.

.. image:: quick_start_guide_linux_coco_for_devices/step5j.jpg
   :width: 45%
   :align: center
   :alt: Step 5j

k. Once the device is successfully added, you will see the resource
   ‘Smart Bulb’ on the home screen being refreshed continuously with
   temperature readings from our Sample Device App.

l. Click on the resource tile of ‘Smart Bulb’ to go to the Resource
   Detail page.

.. image:: quick_start_guide_linux_coco_for_devices/step5l.jpg
   :width: 45%
   :align: center
   :alt: Step 5l

m. Adjust the level slider to change the Level.

n. The log messages on the console of the Sample Device App will reflect
   the new Level setting each time you change it.

.. image:: quick_start_guide_linux_coco_for_devices/step5n.png
   :alt: Step 5n
