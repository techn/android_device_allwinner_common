#!/sbin/sh
/sbin/echo fantasy > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

if [ -e /sbin/devicespecific.sh ]; then
    . /sbin/devicespecific.sh
fi
