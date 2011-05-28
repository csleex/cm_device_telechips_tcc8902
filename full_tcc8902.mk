$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/telechips/tcc8902/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/telechips/tcc8902/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/telechips/tcc8902/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/init.rc:root/init.rc \
    device/telechips/tcc8902/write-calc_table.sh:system/bin/write-calc_table.sh

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/etc/custom_backup_list.txt:system/etc/custom_backup_list.txt \
    device/telechips/tcc8902/etc/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/telechips/tcc8902/etc/vold.fstab:system/etc/vold.fstab \
    device/telechips/tcc8902/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/modules/mali.ko:system/lib/modules/mali.ko

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    frameworks/base/data/fonts/MTLmr3m.ttf:system/fonts/MTLmr3m.ttf

PRODUCT_PACKAGES += \
    makesoftmac.sh \
    tccgetserial

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_tcc8902
PRODUCT_DEVICE := tcc8902
