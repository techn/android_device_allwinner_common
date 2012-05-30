#!/sbin/sh
/sbin/busybox dd if=/dev/zero count=1 | /sbin/busybox tr '\000' '\377' > /dev/block/nandf
/sbin/sync

/sbin/echo fantasy > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

if [ -e /sbin/devicespecific.sh ]; then
    . /sbin/devicespecific.sh
fi
