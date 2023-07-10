/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2019 The LineageOS Project
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

package org.lineageos.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import org.lineageos.settings.fan.FanFragment;
import org.lineageos.settings.buttons.TriggersFragment;
import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.utils.SettingsUtils;

public class BootCompletedReceiver extends BroadcastReceiver {

    private static final boolean DEBUG = false;
    private static final String TAG = "NubiaParts";

    @Override
    public void onReceive(final Context context, Intent intent) {
        if (DEBUG) Log.d(TAG, "Received boot completed intent");
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        int intValue = Integer.parseInt(sharedPreferences.getString(FanFragment.KEY_FAN_MODE, String.valueOf(FanFragment.FAN_AUTO_VALUE)));

        if (SettingsUtils.getEnabled(context, FanFragment.KEY_FAN_ENABLE)) {
            if (intValue == FanFragment.FAN_AUTO_VALUE) {
                FileUtils.writeLine(FanFragment.SMART_FAN, "1");
            } else if (intValue == FanFragment.FAN_MANUAL_VALUE) {
                String fanSpeed = String.valueOf(SettingsUtils.getInt(context, FanFragment.KEY_FAN_MANUAL, 1));
                FileUtils.writeLine(FanFragment.SPEED_LEVEL, fanSpeed);
            }
        }

        Boolean enabled = sharedPreferences.getBoolean(TriggersFragment.KEY_TRIGGERS_DISABLE, true);
        if (enabled) {
            FileUtils.writeLine(TriggersFragment.KEY_TRIGGERS_MODE_FILE1, "0");
            FileUtils.writeLine(TriggersFragment.KEY_TRIGGERS_MODE_FILE2, "0");
        }
    }
}
