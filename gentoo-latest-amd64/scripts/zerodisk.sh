#!/bin/bash
source /etc/profile

# fill all free hdd space with zeros
dd if=/dev/zero of="$chroot/boot/EMPTY" bs=1M
rm "$chroot/boot/EMPTY"

dd if=/dev/zero of="$chroot/EMPTY" bs=1M
rm "$chroot/EMPTY"

# get install device
if [ -b /dev/vda ] ; then
  export DEVICE=/dev/vda
else
  export DEVICE=/dev/sda
fi

# fill all swap space with zeros and recreate swap
swapoff ${DEVICE}3
shred -n 0 -z ${DEVICE}3
mkswap ${DEVICE}3
exit
