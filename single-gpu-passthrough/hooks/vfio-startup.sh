#!/bin/bash
set -x

echo "Beginning of startup!"

# Kill desktop manager
systemctl stop sddm.service

sleep 1

# Switch to text mode
systemctl isolate multi-user.target

sleep 1

# Load VFIO drivers
modprobe vfio_pci
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_virqfd

sleep 1

# Reset GPU and bind it to VFIO driver
echo 1 > /sys/bus/pci/devices/0000:09:00.0/remove
echo "1002 731f" > /sys/bus/pci/drivers/amdgpu/remove_id
echo "1002 731f" > /sys/bus/pci/drivers/vfio-pci/new_id
echo 1 > /sys/bus/pci/rescan

sleep 1

# Kill stuff that may still be running by your user
killall -u astro

sleep 1

# Drop all RAM caches
sync
echo 3 > /proc/sys/vm/drop_caches

sleep 1

echo "End of startup!"
