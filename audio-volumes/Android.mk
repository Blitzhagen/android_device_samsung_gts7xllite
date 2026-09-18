LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := gts7xllite_audio_policy_volumes
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_STEM := audio_policy_volumes.xml
LOCAL_SRC_FILES := audio_policy_volumes.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_OVERRIDES_MODULES := audio_policy_volumes
include $(BUILD_PREBUILT)
