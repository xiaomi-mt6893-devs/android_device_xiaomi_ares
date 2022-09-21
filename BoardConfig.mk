#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/ares
PREBUILT_PATH := device/xiaomi/ares-prebuilt

BOARD_VENDOR := xiaomi

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    boot \
    vbmeta_vendor \
    vbmeta_system
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOARD_PLATFORM := mt6893
TARGET_BOOTLOADER_BOARD_NAME := mt6893
TARGET_NO_BOOTLOADER := true
PRODUCT_PLATFORM := mt6893

# Vintf
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.device.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest.xml

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := ares_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/ares

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(PREBUILT_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115234275328

BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_ODMIMAGE_EXTFS_INODE_COUNT := -1

FRAMEWORK_PARTITIONS_RESERVED_SIZE := 536870912
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1048576000
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1572864000
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_MAIN_SIZE := 9124708352
BOARD_MAIN_PARTITION_LIST := system system_ext product vendor odm
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_ERROR_LIMIT := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/recovery.fstab

# Treble
BOARD_VNDK_VERSION := current