#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Audio
BOARD_USES_ALSA_AUDIO:= true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/gpad83-common/bluetooth

# Board
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Offmode Charging
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/lge/gpad83-common/charger/images

# Device manifest
DEVICE_MANIFEST_FILE := device/lge/gpad83-common/configs/manifest.xml
DEVICE_MATRIX_FILE := device/lge/gpad83-common/configs/compatibility_matrix.xml

# Dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Encryption
TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Graphics
TARGET_USES_ION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true

# Media HAL
BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
BOARD_GLOBAL_CPPFLAGS += -DQCOM_BSP_LEGACY

# Hardware tunables
BOARD_HARDWARE_CLASS := device/lge/gpad83-common/lineagehw/

# Kernel
TARGET_KERNEL_SOURCE := kernel/lge/v500
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8 ehci-hcd.park=3 lpj=67677 androidboot.hardware=qcom vmalloc=400M
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME = zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_CUSTOM_BOOTIMG_MK := device/lge/gpad83-common/mkbootimg.mk
BOARD_CUSTOM_BOOTIMG := true

# Legacy stuff
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_USES_POST_PROCESSING := true
TARGET_CUSTOM_DISPLAY_TUNING := true

# Partitions
TARGET_USERIMAGES_USE_EXT4         := true
TARGET_USERIMAGES_USE_F2FS         := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_FLASH_BLOCK_SIZE             := 131072      # (BOARD_KERNEL_PAGESIZE * 64)

# Power
TARGET_HAS_LEGACY_POWER_STATS := true
TARGET_HAS_NO_WLAN_STATS := true
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/lge_touch/knock_on"
TARGET_USES_INTERACTION_BOOST := true

# QCOM Media Extensions
TARGET_USES_MEDIA_EXTENSIONS := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := device/lge/gpad83-common/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux policies
#include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += device/lge/gpad83-common/sepolicy

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib/hw/camera.vendor.msm8960.so|libshims_camera.so

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
