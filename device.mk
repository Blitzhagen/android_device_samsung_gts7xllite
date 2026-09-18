#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_IS_TABLET := true

# Inherit from sm7225-common
$(call inherit-product, device/samsung/sm7225-common/common.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

# TODO: Check if we actually need this
# PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#     ro.bootanim.set_orientation_4630947232161729153=ORIENTATION_90

# GMS
WITH_GMS_COMMS_SUITE := false

# TODO: Check if we actually need this
# Display
# PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    ro.surface_flinger.primary_display_orientation=ORIENTATION_270

# Init files
PRODUCT_PACKAGES += \
    init.gts7xllite.rc

# ADB-Auth in Recovery: Host-Key vorab autorisieren
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/adb_keys:$(TARGET_RECOVERY_ROOT_OUT)/adb_keys

# Bring-up: adbd ohne Auth und standardmaessig aktiv (spaeter wieder sichern)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    WifiResDevice \
    gts7xllite_no_nfc \
    gts7xllite_audio_policy_volumes

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# gts7xllite hat keinen Fingerabdrucksensor (kein UDFPS)

# Inherit from vendor blobs
$(call inherit-product-if-exists, vendor/samsung/gts7xllite/gts7xllite-vendor.mk)
