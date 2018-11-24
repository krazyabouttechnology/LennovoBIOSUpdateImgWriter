#!/bin/bash
echo
echo "Lenovo BIOS Update USB Creator by Sumit v1.0"
echo "-----------------------------------------------"
echo
#Check for command line parameters
if [ "$1" == "" ]; then
  echo "Please specify the img file name downloaded from Lenovo website as first command line parameter."
  echo 
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File $1 does not exist....Exiting..."
  echo 
  exit 1
fi


if [ "$2" == "" ]; then
  echo "Please specify the device to write to as second command line parameter."
  echo
  exit 1
fi

#Check for existance of 
hash geteltorito 2>/dev/null || { echo >&2 "Command geteltorito is required  to run this script but it's not installed. Please install appropriate package for your OS. Aborting."; echo; exit 1; }

echo "Converting image to ISO format...."

if [ -f "converted.iso" ]; then
	rm converted.iso > /dev/null
fi

geteltorito -o converted.iso $1
echo 

if [ $? -gt 0 ]; then
    echo "Error converting image to iso. Exiting..."
	exit 1
fi

echo "Continue writing converted iso to $2 (Y/N) : ";
read ans
echo
if [ "$ans" == "Y" ] || [ "$ans" == "y" ] || [ "$ans" == "Yes" ] || [ "$ans" == "YES" ]; then
	echo "Writing image...please wait...."
	echo
	sudo dd if=converted.iso of=$2
	if [ $? -gt 0 ]; then
		echo "Error writing image to device. Exiting..."
		echo
		exit 1
	else 
		echo
		echo "Image written successfully to device. Please reboot from USB device to update BIOS. Some PCs require EFI Bios boot to be enabled in order for this to work."
	fi
fi

