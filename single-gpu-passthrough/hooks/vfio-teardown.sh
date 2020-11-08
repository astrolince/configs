#!/bin/bash
set -x

echo "Beginning of teardown!"

# Reset GPU and bind it to AMD driver
echo 1 > /sys/bus/pci/devices/0000:09:00.0/remove
echo "1002 731f" > /sys/bus/pci/drivers/vfio-pci/remove_id
echo "1002 731f" > /sys/bus/pci/drivers/amdgpu/new_id
echo 1 > /sys/bus/pci/rescan

sleep 1

# Unload VFIO drivers
modprobe -r vfio-pci
modprobe -r vfio
modprobe -r vfio_iommu_type1
modprobe -r vfio_virqfd

sleep 1

# Kill stuff that may still be running by your user
killall -u astro

sleep 1

# Drop all RAM caches
sync
echo 3 > /proc/sys/vm/drop_caches

sleep 3

# Switch to graphical mode
systemctl isolate graphical.target

echo "End of teardown!"
