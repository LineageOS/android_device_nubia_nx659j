/*
 * Copyright (C) 2023-2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "SunlightEnhancementService"

#include "SunlightEnhancement.h"

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/strings.h>

namespace aidl {
namespace vendor {
namespace lineage {
namespace livedisplay {

using ::android::base::ReadFileToString;
using ::android::base::Trim;
using ::android::base::WriteStringToFile;

static constexpr const char* kHbmStatusPath =
    "/sys/devices/platform/soc/soc:qcom,dsi-display-primary/hbm";

ndk::ScopedAStatus SunlightEnhancement::getEnabled(bool* _aidl_return) {
    std::string buf;
    if (!ReadFileToString(kHbmStatusPath, &buf)) {
        LOG(ERROR) << "Failed to read " << kHbmStatusPath;
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }
    *_aidl_return = std::stoi(Trim(buf)) == 1;
    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus SunlightEnhancement::setEnabled(bool enabled) {
    if (!WriteStringToFile(enabled ? "1" : "0", kHbmStatusPath)) {
        LOG(ERROR) << "Failed to write " << kHbmStatusPath;
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }
    return ndk::ScopedAStatus::ok();
}

}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor
}  // namespace aidl

