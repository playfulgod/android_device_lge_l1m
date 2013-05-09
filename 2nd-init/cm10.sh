#!/system/bin/sh.bin
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

chmod 777 /system/etc/init.qcom.modem_links.sh
chmod 777 /system/etc/init.qcom.mdm_links.sh
/system/etc/init.qcom.modem_links.sh
/system/etc/init.qcom.mdm_links.sh

busybox killall -9 ueventd
busybox mount -o rw,remount /
busybox rm -f /sdcard
busybox rm -f /default.prop
busybox rm -f /init.rc
busybox rm -f /init.*.rc
busybox rm -f /ueventd.rc
busybox rm -f /ueventd.*.rc
busybox rmdir /mnt/sdcard
cd /
busybox tar -C / -xf /system/xbin/cm10.tar

/system/xbin/taskset -p -c 0 1
busybox sync
/system/xbin/taskset -c 0 /system/xbin/2nd-init

/system/xbin/taskset -p -c 0-1 1
busybox sync
