# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# apnhlos firmware partition (WLAN/DSP firmware): ship in target-files/OTA,
# flashed via releasetools to /dev/block/bootdevice/by-name/apnhlos
$(call add-radio-file,../../../vendor/samsung/gts7xllite/radio/apnhlos.img)
