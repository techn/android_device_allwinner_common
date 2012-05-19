#!/sbin/sh
/sbin/busybox dd if=/dev/zero count=1 | /sbin/busybox tr '\000' '\377' > /dev/block/nandf
/sbin/sync
