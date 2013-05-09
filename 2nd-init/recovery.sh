#!/system/bin/sh.bin
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

busybox killall -9 ueventd
busybox mount -o rw,remount /
busybox mount -o rw,remount /system
busybox rm -f /data/local/tmp/.recovery_mode
busybox rm -rf /sbin
busybox rm -f /etc
busybox rm -f /sdcard
busybox rm -f /default.prop
busybox rm -f /init.rc
busybox rm -f /init.*.rc
cd /
busybox tar -C / -xf /system/xbin/recovery.tar

/system/xbin/taskset -p -c 0 1
busybox sync
/system/xbin/taskset -c 0 /system/xbin/2nd-init

/system/xbin/taskset -p -c 0-1 1
busybox sync
