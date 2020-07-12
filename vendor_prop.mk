# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.protected_contents=true

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
