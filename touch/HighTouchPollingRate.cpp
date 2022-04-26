/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "HighTouchPollingRateService"

#include "HighTouchPollingRate.h"

#include <fstream>

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

const std::string kHighTouchPollingRatePath =
    "/sys/kernel/tp_node/report_rate";

Return<bool> HighTouchPollingRate::isEnabled() {
    std::ifstream file(kHighTouchPollingRatePath);
    int enabled;
    file >> enabled;

    return enabled == 1;
}

Return<bool> HighTouchPollingRate::setEnabled(bool enabled) {
    std::ofstream file(kHighTouchPollingRatePath);
    file << (enabled ? "1" : "0");
    return !file.fail();
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
