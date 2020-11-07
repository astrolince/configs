#!/bin/bash
set -x

echo "Beginning of teardown!"

echo 1 | tee /sys/bus/pci/devices/0000:09:00.0/remove
echo "1002 731f" | tee /sys/bus/pci/drivers/vfio-pci/remove_id
echo "1002 731f" | tee /sys/bus/pci/drivers/amdgpu/new_id
echo 1 | tee /sys/bus/pci/rescan

sleep 2

modprobe -r vfio-pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

sleep 2

killall -u astro

sleep 6

systemctl isolate graphical.target

echo "End of teardown!"
