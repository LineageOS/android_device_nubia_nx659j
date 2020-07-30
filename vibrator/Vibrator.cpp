/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "VibratorService"

#include <android-base/logging.h>
#include <hardware/hardware.h>
#include <hardware/vibrator.h>

#include "Vibrator.h"

#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>

// Refer to non existing
// kernel documentation on the detail usages for ABIs below
static constexpr char ACTIVATE_PATH[] = "/sys/class/leds/vibrator_aw8695/activate";
static constexpr char DURATION_PATH[] = "/sys/class/leds/vibrator_aw8695/duration";
static constexpr char GAIN_PATH[] = "/sys/class/leds/vibrator_aw8695/gain";
static constexpr char STATE_PATH[] = "/sys/class/leds/vibrator_aw8695/state";

namespace android {
namespace hardware {
namespace vibrator {
namespace V1_0 {
namespace implementation {

/*
 * Write value to path and close file.
 */
template <typename T>
static void set(const std::string& path, const T& value) {
    std::ofstream file(path);

    if (!file.is_open()) {
        LOG(ERROR) << "Unable to open: " << path << " (" <<  strerror(errno) << ")";
        return;
    }

    file << value;
}

Vibrator::Vibrator() {
}

Return<Status> Vibrator::on(uint32_t timeoutMs) {
    set(STATE_PATH, 1);
    set(DURATION_PATH, timeoutMs);
    set(ACTIVATE_PATH, 1);
    return Status::OK;
}

Return<Status> Vibrator::off()  {
    set(ACTIVATE_PATH, 0);
    return Status::OK;
}

Return<bool> Vibrator::supportsAmplitudeControl()  {
    return true;
}

Return<Status> Vibrator::setAmplitude(uint8_t amplitude) {
    long strength_level = std::lround(amplitude / 2);
    set(GAIN_PATH, strength_level);
    return Status::OK;
}

Return<void> Vibrator::perform(Effect effect, EffectStrength strength, perform_cb _hidl_cb) {
    if (effect == Effect::CLICK) {
        uint8_t amplitude;
        switch (strength) {
        case EffectStrength::LIGHT:
            amplitude = 42;
            break;
        case EffectStrength::MEDIUM:
            amplitude = 72;
            break;
        case EffectStrength::STRONG:
            amplitude = 255;
            break;
        default:
            _hidl_cb(Status::UNSUPPORTED_OPERATION, 0);
            return Void();
        }
        on(15);
        setAmplitude(amplitude);
        _hidl_cb(Status::OK, 15);
    } else
        _hidl_cb(Status::UNSUPPORTED_OPERATION, 0);

    return Void();
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace vibrator
}  // namespace hardware
}  // namespace android
