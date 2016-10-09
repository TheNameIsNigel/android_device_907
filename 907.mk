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
COMMON_PATH := device/softwinner/907

PRODUCT_COPY_FILES := \
	$(COMMON_PATH)/kernel:kernel \
	$(COMMON_PATH)/prebuilt/bin/reboot-recovery.sh:root/sbin/reboot-recovery.sh \
	$(call find-copy-subdir-files,*,$(COMMON_PATH)/rootdir,root)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

# Wifi-Only
PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version = 131072 \
	drm.service.enabled=false \

# Fix Graphics Issues
PRODUCT_PROPERTY_OVERRIDES += \
	ro.zygote.disable_gl_preload=true \
	ro.bq.gpu_to_cpu_unsupported=true \

# ART
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-swap=true \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=interpret-only \
	dalvik.vm.image-dex2oat-filter=speed \
	dalvik.vm.profiler=1
	
PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
	--compiler-filter=interpret-only

PRODUCT_PROPERTY_OVERRIDES += \
	service.adb.root=1 \
	ro.eventproc.start=0 \
	ro.debuggable=1 \
	ro.com.google.locationfeatures=0 \
	ro.kernel.android.checkjni=0 \
	ro.vold.umsdirtyratio=40 \
	ro.media.enc.jpeg.quality=100 \
	ro.media.dec.jpeg.memcap=8000000 \
	ro.media.enc.hprof.vid.bps=8000000 \
	ro.additionalmounts=/storage/sdcard1 \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	ro.config.nocheckin=1 \
	persist.sys.vold.switchexternal=0 \
	persist.service.adb.enable=1 \
	keyguard.no_require_sim=true \
	logcat.live=disable \
	media.stagefright.maxsubfont=72 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 \
	ro.zram.default=1 \
	ro.crypto.state=unencrypted \
	rw.logger=0 \
	config.disable_atlas=true

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
	
# Media codecs
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Busybox for AOSP
PRODUCT_PACKAGES += \
	busybox \

PRODUCT_PACKAGES += \
	libwebviewchromium_plat_support \
	libwebviewchromium_loader \

# APP'S for AOSP
PRODUCT_PACKAGES += \
	ESFileExplorer \
	SimpleReboot \
	SoundRecorder \

# Wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf \

# Device specific settings
PRODUCT_PACKAGES += \
	dispctl \
	ethernet \

PRODUCT_PACKAGES += \
	librs_jni \

# Bluetooth
PRODUCT_PACKAGES += \
	libusb  \
	hciconfig \
	hcitool \

# Hardware libs
PRODUCT_PACKAGES += \
	audio.primary.exDroid \
	audio.a2dp.default \
	audio.usb.default \
	display.exDroid \
	gralloc.exDroid \
	power.exDroid \
	hwcomposer.exDroid \
	sensors.exDroid \
	lights.exDroid \
	libaudioutils \
	chat \
	u3gmonitor \
	devlistener \
	camera.exDroid \

# CyanogenMOD
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# ext4 filesystem utils
PRODUCT_PACKAGES += \
	e2fsck \
	libext2fs \
	libext2_blkid \
	libext2_uuid \
	libext2_profile \
	libext2_com_err \
	libext2_e2p \
	make_ext4fs \
	
# extra - present in stock images
PRODUCT_PACKAGES += \
	cpueater \
	btool \
	call-pppd \
	daemonize \
	dbus-daemon \
	dbus-monitor \
	dbus-send \
	directiotest \
	kfmapp \
	nc \
	netperf \
	netserver \
	tcpdump \
	timeinfo \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)

$(call add-product-dex-preopt-module-config,services,--compiler-filter=verify-none)

# Should be after the full_base include, which loads languages_full
PRODUCT_AAPT_CONFIG := large xlarge hdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_NAME := full_907
PRODUCT_DEVICE := 907

TARGET_SCREEN_HEIGHT := 768
TARGET_SCREEN_WIDTH := 1024
