#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_CHARACTERISTICS := tablet

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false \
	dalvik.vm.dexopt-data-only=1 \
	ro.vold.umsdirtyratio=20 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 

DEVICE_PACKAGE_OVERLAYS := device/allwinner/common/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \

# EXT4 Support
PRODUCT_PACKAGES += make_ext4fs e2fsck

# Hardware support
PRODUCT_PACKAGES += audio.primary.sun4i \
	audio_policy.default \
	camera.sun4i \
	display.sun4i \
	gralloc.sun4i \
	hwcomposer.sun4i \
	sensors.sun4i \
#

# CedarX libraries
PRODUCT_PACKAGES += libCedarA \
	libCedarX \
	libcedarv \
	libcedarxbase \
	libcedarxosal \
	libcedarxsftdemux \
	libswdrm \
#

# copy all others kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/allwinner/common/prebuilt/lib/modules && \
	find device/allwinner/common/prebuilt/lib/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# let us get out of recovery
PRODUCT_COPY_FILES += device/allwinner/common/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# and let's get booting!
PRODUCT_COPY_FILES += device/allwinner/common/ueventd.sun4i.rc:root/ueventd.sun4i.rc \
	device/allwinner/common/init.sun4i.rc:root/init.sun4i.rc \
	device/allwinner/common/init.sun4i.usb.rc:root/init.sun4i.usb.rc \
#

$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full
PRODUCT_LOCALES += hdpi

PRODUCT_NAME := full_a10
PRODUCT_DEVICE := A10
