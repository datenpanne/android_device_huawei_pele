# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/huawei/pele

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# inherit from common g4
-include device/huawei/t2-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 400

# HIDL
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Init
#TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
#TARGET_INIT_VENDOR_LIB := libinit_pele
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_pele
TARGET_RECOVERY_DEVICE_MODULES := libinit_pele

# Kernel
TARGET_KERNEL_CONFIG := pele_defconfig

# Partitios
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 11618188288 #−16384

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libmmcamera2_sensor_modules.so|libshim_atomic.so
#    /system/vendor/bin/signinfolistener|libshim_signinfolistener.so \

# inherit from the proprietary version
include vendor/huawei/pele/BoardConfigVendor.mk
