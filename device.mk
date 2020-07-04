#
# Copyright (C) 2020 The LineageOS Project
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

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Inherit proprietary libraries
$(call inherit-product, vendor/nubia/NX659J/NX659J-vendor.mk)

-include $(LOCAL_PATH)/product_prop.mk
-include $(LOCAL_PATH)/system_prop.mk

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# A/B
AB_OTA_UPDATER := false

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti

# Camera
PRODUCT_PACKAGES += \
    Snap

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.nubia_NX659J

PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/nubia/NX659J

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement

# Overlays
PRODUCT_PACKAGES += \
    NubiaBluetooth \
    NubiaFrameworks \
    NubiaSystemUI

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# Parts
PRODUCT_PACKAGES += \
    NubiaParts

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.nfc.sku.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    fstab.qcom \
    init.msm.usb.configfs.rc \
    init.multicolor.led.rc \
    init.nb.nfc.rc \
    init.nb.rc \
    init.nubia.fingerprint.rc \
    init.nubia.haptic.rc \
    init.nubia.Light.rc \
    init.nubia.mmi.rc \
    init.nubia.perf.rc \
    init.nubia.platform.rc \
    init.nubia.sensors.rc \
    init.nubia.smartfan.rc \
    init.nubia.touch.lcd.rc \
    init.project.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml
