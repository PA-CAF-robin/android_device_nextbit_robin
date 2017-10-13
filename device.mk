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

DEVICE_PACKAGE_OVERLAYS := device/nextbit/robin/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Call the proprietary setup
$(call inherit-product, vendor/nextbit/robin/robin-vendor.mk)

# Setup base hwui configs
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.msm8992 \
    audiod \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors

PRODUCT_COPY_FILES += \
    device/nextbit/robin/audio/acdbdata/NBQ_Bluetooth_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Bluetooth_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_General_cal.acdb:system/etc/acdbdata/NBQ/NBQ_General_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_Global_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Global_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_Handset_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Handset_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_Hdmi_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Hdmi_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_Headset_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Headset_cal.acdb \
    device/nextbit/robin/audio/acdbdata/NBQ_Speaker_cal.acdb:system/etc/acdbdata/NBQ/NBQ_Speaker_cal.acdb \
    device/nextbit/robin/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/nextbit/robin/audio/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/nextbit/robin/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/nextbit/robin/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/nextbit/robin/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    device/nextbit/robin/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/nextbit/robin/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/nextbit/robin/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml  \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Display
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# GPS
PRODUCT_COPY_FILES += \
    device/nextbit/robin/gps/flp.conf:system/etc/flp.conf \
    device/nextbit/robin/gps/gps.conf:system/etc/gps.conf \
    device/nextbit/robin/gps/izat.conf:system/etc/izat.conf \
    device/nextbit/robin/gps/sap.conf:system/etc/sap.conf \
    device/nextbit/robin/gps/xtwifi.conf:system/etc/xtwifi.conf

# Init
PRODUCT_PACKAGES += \
    init.nbq.charger.rc \
    init.nbq.fingerprint.rc \
    init.nbq.led.rc \
    init.nbq.mac.sh \
    init.nbq.nfc.rc \
    init.nbq.poweroff_charging.rc \
    init.nbq.smartamp.rc \
    init.nbq.target.rc \
    init.nbq.usb.rc \
    init.qcom.fs.rc

# Input
PRODUCT_COPY_FILES += \
    device/nextbit/robin/configs/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Media
PRODUCT_COPY_FILES += \
    device/nextbit/robin/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/nextbit/robin/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/nextbit/robin/configs/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_COPY_FILES += \
    device/nextbit/robin/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/nextbit/robin/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/nextbit/robin/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

# Power
PRODUCT_PACKAGES += \
    init.nbq.power.sh \
    power.msm8992

# QPerformance
PRODUCT_BOOT_JARS += \
    QPerformance

# QTIC
-include $(QCPATH)/common/config/qtic-config.mk

PRODUCT_PACKAGE_OVERLAYS += \
    $(QCPATH)/qrdplus/Extension/res \
    $(PRODUCT_PACKAGE_OVERLAYS)

# Sensors
PRODUCT_COPY_FILES += \
    device/nextbit/robin/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# Telephony
PRODUCT_BOOT_JARS += \
    qti-telephony-common

# Thermal
PRODUCT_COPY_FILES += \
    device/nextbit/robin/configs/thermal-engine-8992.conf:system/etc/thermal-engine-8992.conf

# Tools
PRODUCT_PACKAGES += \
    libjson \
    libprotobuf-cpp-full \
    libtinyxml \
    libtinyxml2

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    libwpa_client

PRODUCT_COPY_FILES += \
    device/nextbit/robin/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/nextbit/robin/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    device/nextbit/robin/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    device/nextbit/robin/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/nextbit/robin/wifi/WCNSS_cfg.dat:system/etc/wifi/WCNSS_cfg.dat \
    device/nextbit/robin/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/nextbit/robin/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
