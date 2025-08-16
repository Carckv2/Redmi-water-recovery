#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
#

LOCAL_PATH := device/xiaomi/water

# Shipping API level (Android 12 = 31)
PRODUCT_SHIPPING_API_LEVEL := 31

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Define A/B partitions
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor \
    product \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    odm


# Fastbootd support (for GSI flashing from recovery)
PRODUCT_PACKAGES += \
    fastbootd \
    lpdump \
    lpunpack \
    lpmake

# Decryption + FBE
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.keymaster@4.0-service

# Crypto configs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.dm_default_key.options_format.version=2

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6765.rc:root/init.recovery.mt6765.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6765.rc:root/ueventd.mt6765.rc

# Include recovery resource files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system.prop:system/system.prop
