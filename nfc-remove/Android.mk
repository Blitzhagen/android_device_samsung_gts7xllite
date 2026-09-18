# SM-T736B has no NFC hardware (stock firmware has no NFC stack). The AOSP NFC
# apps would run as persistent processes waiting forever for a nonexistent INfc
# HAL, so they are overridden by this module.
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := gts7xllite_no_nfc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := nfc-removed.txt
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_OVERRIDES_MODULES := NfcNci Tag com.android.nfc_extras
include $(BUILD_PREBUILT)
