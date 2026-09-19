#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm7225-commmon
include device/samsung/sm7225-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gts7xllite

# Kernel: Phase 2 = Source-Build aus Original-Quellcode (kernel/samsung/sm7225)
# Rollback: TARGET_PREBUILT_KERNEL/TARGET_FORCE_PREBUILT_KERNEL/
#           BOARD_PREBUILT_DTBIMAGE_DIR/BOARD_PREBUILT_DTBOIMAGE auf
#           $(DEVICE_PATH)/prebuilt/* setzen
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_DTBO_CFG              := $(DEVICE_PATH)/dtboimg.cfg

# Kernel modules (Liste aus Stock vendor/lib/modules/modules.load)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

BOARD_NAME := SRPUA05O009

# Display
TARGET_SCREEN_DENSITY := 340

# OTA assert
TARGET_OTA_ASSERT_DEVICE := gts7xllite

# Recovery
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT
TARGET_RECOVERY_DEFAULT_TOUCH_ROTATION := ROTATION_RIGHT

# SELinux
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Security patch (aus Stock vendor/build.prop)
VENDOR_SECURITY_PATCH := 2025-06-01

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml


# Private AVB-Signierung (ueberschreibt die Testkeys aus BoardConfigCommon)
BOARD_AVB_KEY_PATH := vendor/lineage-priv/keys/avb.pem
BOARD_AVB_RECOVERY_KEY_PATH := vendor/lineage-priv/keys/avb_recovery.pem
BOARD_AVB_SYSTEM_KEY_PATH := vendor/lineage-priv/keys/avb_system.pem
