#
# Xiaomi Redmi A2 (water) TWRP product definition
#

LOCAL_PATH := device/xiaomi/water

# Inherit common TWRP config
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device-specific config
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifiers
PRODUCT_DEVICE := water
PRODUCT_NAME := twrp_water
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi A2
PRODUCT_MANUFACTURER := Xiaomi

# Boot animation (safe default)
TARGET_BOOT_ANIMATION_RES := 720

# Shipping API level (Android 12 = 31)
PRODUCT_SHIPPING_API_LEVEL := 31

# Build fingerprint (for asserts / compatibility)
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_water-user 12 SP1A.210812.016 V14.0.11.0.TGOMIXM release-keys"

BUILD_FINGERPRINT := Redmi/water_global/water:12/SP1A.210812.016/V14.0.11.0.TGOMIXM:user/release-keys
