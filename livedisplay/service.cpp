/*
 * Copyright (C) 2023-2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "AdaptiveBacklight.h"
#include "SunlightEnhancement.h"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

using aidl::vendor::lineage::livedisplay::AdaptiveBacklight;
using aidl::vendor::lineage::livedisplay::SunlightEnhancement;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(0);

    std::shared_ptr<AdaptiveBacklight> adaptiveBacklight =
        ndk::SharedRefBase::make<AdaptiveBacklight>();
    const std::string abInstance =
        std::string(AdaptiveBacklight::descriptor) + "/default";
    binder_status_t status =
        AServiceManager_addService(adaptiveBacklight->asBinder().get(), abInstance.c_str());
    CHECK_EQ(status, STATUS_OK);

    std::shared_ptr<SunlightEnhancement> sunlightEnhancement =
        ndk::SharedRefBase::make<SunlightEnhancement>();
    const std::string seInstance =
        std::string(SunlightEnhancement::descriptor) + "/default";
    status =
        AServiceManager_addService(sunlightEnhancement->asBinder().get(), seInstance.c_str());
    CHECK_EQ(status, STATUS_OK);

    ABinderProcess_joinThreadPool();
    return EXIT_FAILURE;  // should not reach
}

