LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_AAPT_FLAGS := --keep-raw-values
LOCAL_PACKAGE_NAME := NubiaCarrierConfig
LOCAL_SDK_VERSION := current
LOCAL_VENDOR_MODULE := true
include $(BUILD_RRO_PACKAGE)
