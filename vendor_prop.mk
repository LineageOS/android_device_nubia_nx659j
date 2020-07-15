# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    vendor.qcom.bluetooth.soc=hastings \
    ro.vendor.bluetooth.emb_wp_mode=false \
    ro.vendor.bluetooth.wipower=false \
    persist.vendor.service.bdroid.fwsnoop=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aac-ldac \
    persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    ro.bluetooth.a2dp_offload.supported=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxadaptive-aptxhd-ldac

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.protected_contents=true

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.product.hardware.sku=nfc \
    persist.vendor.factory.nfc=true

# OEM unlocking
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.primarycard=true \
    ro.com.android.mobiledata=true \
    ro.com.android.dataroaming=false \
    persist.vendor.radio.custom_ecc=0 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.enableadvancedscan=true \
    persist.vendor.radio.sib16_support=1 \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.radio.multisim.config=dsds \
    persist.vendor.radio.rat_on=combine
