#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device has cellular: Dialer, ImsServiceEntitlement and the
# telephony preload config come from the telephony product package.
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_product.mk)

# Inherit from gts7xllite device
$(call inherit-product, device/samsung/gts7xllite/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

# APEXes unkomprimiert (capex braucht /data/apex/decompressed beim ersten Boot)
PRODUCT_COMPRESSED_APEX := false

PRODUCT_NAME := lineage_gts7xllite
PRODUCT_DEVICE := gts7xllite
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T736B
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Fingerprint (Stock T736BXXS9DYF1)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint="samsung/gts7xllitexeea/gts7xllite:14/UP1A.231005.007/T736BXXS9DYF1:user/release-keys" \
    BuildDesc="gts7xllitexeea-user 14 UP1A.231005.007 T736BXXS9DYF1 release-keys"

# Default ringtone. /product/etc/build.prop is the last prop file init
# loads and wins even ro.* — so this must live in the product prop list,
# appended after telephony.mk's ro.config.ringtone=Orion.ogg. The dup is
# intentional: init's prop map is last-write-wins, so our later entry
# takes effect. Requires BUILD_BROKEN_DUP_SYSPROP (see BoardConfig).
PRODUCT_PRODUCT_PROPERTIES += ro.config.ringtone=NokiaTechno.ogg

