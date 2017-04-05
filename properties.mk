# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    aaudio.hw_burst_min_usec=2000 \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.mmap_policy=2 \
    af.fast_track_multiplier=2 \
    audio.deep_buffer.media=true \
    audio.offload.video=true \
    persist.audio.fluence.voicecomm=true \
    persist.vendor.audio.ambisonic.capture=false \
    persist.vendor.audio.ambisonic.auto.profile=false \
    persist.vendor.audio.apptype.multirec.enabled=false \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=false \
    persist.vendor.audio.fluence.tmic.enabled=false \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    persist.vendor.audio.spv3.enable=true \
    persist.vendor.audio.avs.afe_api_version=2 \
    persist.vendor.audio.ras.enabled=false \
    persist.vendor.audio.voicecall.speaker.stereo=false \
    ro.vendor.audio.sdk.fluencetype=fluence \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio_hal.period_size=192 \
    vendor.audio.tunnel.encode=false \
    vendor.audio.debug.voip.haptic=true \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.offload.track.enable=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=false \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio_hal.in_period_size=144 \
    vendor.audio_hal.period_multiplier=3 \
    vendor.audio.adm.buffering.ms=2 \
    vendor.audio.volume.headset.gain.depcal=true \
    vendor.audio.hal.output.suspend.supported=true \
    vendor.audio.enable.mirrorlink=false \
    vendor.audio.usb.disable.sidetone=true

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=false \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.battery_listener.enable=true \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_in.enable=true \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.compr_voip.enable=false \
    vendor.audio.feature.concurrent_capture.enable=true \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.display_port.enable=true \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.dynamic_ecns.enable=true \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true \
    vendor.audio.feature.hdmi_passthrough.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.hifi_audio.enable=false \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=true \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.keep_alive.enable=true \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.snd_mon.enable=true \
    vendor.audio.feature.spkr_prot.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=true \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=false \

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.device.class_of_device=90,2,12 \
    bluetooth.hardware.power.operating_voltage_mv=3300 \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true \
    bluetooth.profile.bas.client.enabled?=true \
    bluetooth.profile.gatt.enabled?=true \
    bluetooth.profile.hfp.ag.enabled?=true \
    bluetooth.profile.hid.device.enabled?=true \
    bluetooth.profile.hid.host.enabled?=true \
    bluetooth.profile.map.server.enabled?=true \
    bluetooth.profile.opp.enabled?=true \
    bluetooth.profile.pan.nap.enabled?=true \
    bluetooth.profile.pan.panu.enabled?=true \
    bluetooth.profile.pbap.server.enabled?=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxadaptive-aptxhd \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.service.bdroid.fwsnoop=true \
    ro.bluetooth.a2dp_offload.supported=true \
    ro.vendor.bluetooth.emb_wp_mode=false \
    ro.vendor.bluetooth.wipower=false \
    persist.vendor.qcom.bluetooth.soc=hastings \
    vendor.qcom.bluetooth.soc=hastings

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,org.lineageos.aperture \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,org.lineageos.aperture

# Chipset
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM8250

# CNE
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.cne.feature=1

# Crypto
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=4000 \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696

PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=0 \
    debug.sf.disable_backpressure=1 \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.high_fps_early_gl_phase_offset_ns=-2000000 \
    debug.sf.high_fps_early_phase_offset_ns=-4000000 \
    debug.sf.high_fps_late_app_phase_offset_ns=1000000 \
    debug.sf.high_fps_late_sf_phase_offset_ns=-2000000 \
    debug.sf.hw=0 \
    debug.sf.latch_unsignaled=1 \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_mode=0 \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.native_mode=0 \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610 \
    vendor.display.comp_mask=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.disable_offline_rotator=1 \
    vendor.display.disable_scaler=0 \
    vendor.display.enable_async_powermode=0 \
    vendor.display.enable_optimize_refresh=1 \
    vendor.display.enable_posted_start_dyn=1 \
    vendor.display.use_smooth_motion=0 \
    vendor.gralloc.disable_ubwc=0

# DPM
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.dpm.feature=9

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# fwk-detect
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# GMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-zte

# Netmgr
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.data.mode=concurrent \
    ro.vendor.use_data_netmgrd=true \

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.factory.nfc=true

# OEM unlocking
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    ro.telephony.default_network=22,22

PRODUCT_PRODUCT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    ro.telephony.default_network=22,22

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds \
    persist.vendor.radio.primarycard=true \
    persist.vendor.radio.custom_ecc=0 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.enableadvancedscan=true \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.vendor.radio.rat_on=combine \
    ro.com.android.mobiledata=true \
    ro.com.android.dataroaming=false \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.usb.diag.func.name=diag \
    vendor.usb.dpl.inst.name=dpl \
    vendor.usb.qdss.inst.name=qdss \
    vendor.usb.rmnet.func.name=gsi \
    vendor.usb.rmnet.inst.name=rmnet \
    vendor.usb.rndis.func.name=gsi \
    vendor.usb.use_ffs_mtp=0 \
    vendor.usb.use_gadget_hal=0

# Zygote
PRODUCT_PROPERTY_OVERRIDES += \
    zygote.critical_window.minute=10
