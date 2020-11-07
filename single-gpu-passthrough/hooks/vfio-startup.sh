#!/bin/bash
set -x

echo "Beginning of startup!"

systemctl stop sddm.service

sleep 1

systemctl isolate multi-user.target

sleep 1

modprobe vfio_pci

sleep 1

echo 1 > /sys/bus/pci/devices/0000:09:00.0/remove
echo "1002 731f" > /sys/bus/pci/drivers/amdgpu/remove_id
echo "1002 731f" > /sys/bus/pci/drivers/vfio-pci/new_id
echo 1 > /sys/bus/pci/rescan

sleep 1

killall -u astro

sleep 1

sync
echo 3 > /proc/sys/vm/drop_caches

sleep 1

echo "End of startup!"
