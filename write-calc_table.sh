#!/system/bin/sh

if [ -e /system/etc/calc_table -a -e /sys/class/input/input1/calc_table ]; then
	cat /system/etc/calc_table > /sys/class/input/input1/calc_table
fi
