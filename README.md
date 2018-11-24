# LennovoBIOSUpdateImgWriter
Utility script to write bootable BIOS update ISO/IMG file downloaded from Lenovo website to USB devices. 

BIOS updates for lenovo laptops and PCs are now available as ISOs or IMGs that can be written to USB devices and flashed. The downloaded img or iso file needs conversion using el torito convertor and then written to USB. This script automates the process.

Syntax :
writeLenovoBiosImageToUSB.sh <image file name> <usb block device name>
  
Note: this script uses sudo inside it to run dd command so admin access is required.

Use with caution, no guarantees or warranties of any kind.
