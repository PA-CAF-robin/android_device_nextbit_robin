# Copyright (C) 2017 PA-CAF
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

# Check for target product
ifeq (aosp_robin,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Advanced platform features
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_DISABLE_DASH := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/nextbit/robin/device.mk)

# Inherit CAF MSM8992 device configuration
$(call inherit-product, device/nextbit/robin/base.mk)

# Override AOSP build properties
PRODUCT_NAME := aosp_robin
PRODUCT_DEVICE := robin
BOARD_VENDOR := nextbit
TARGET_VENDOR := nextbit
PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
     BUILD_FINGERPRINT=Nextbit/ether/ether:7.1.1/Robin_Nougat_108/00WW_Jenkins_108:user/release-keys \
     PRIVATE_BUILD_DESC="ether-user 7.1.1 Robin_Nougat_108 00WW_Jenkins_108 release-keys"

# AOSP platform
include vendor/aosp/common.mk

endif
