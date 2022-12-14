#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Api level
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    odm

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Bootctrl
PRODUCT_PACKAGES += \
    bootctrl.default \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2.recovery

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey \
    android.hardware.drm@1.3.vendor

# Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Init scripts
PRODUCT_PACKAGES += \
    init.mt6893.rc

# Fstab
PRODUCT_PACKAGES += \
    fstab.mt6893

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6893:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6893

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi
    
# Input
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(DEVICE_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-goodix.idc

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# IFAA manager
PRODUCT_PACKAGES += \
     IFAAService

# Mlipay
PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.mlipay@1.1.vendor \
    vendor.xiaomi.hardware.mtdservice@1.0.vendor

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/ares/ares-vendor.mk)