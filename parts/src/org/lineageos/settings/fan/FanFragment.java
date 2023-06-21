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

package org.lineageos.settings.fan;

import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.provider.Settings;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;

import org.lineageos.settings.R;

import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.utils.SettingsUtils;

public class FanFragment extends PreferenceFragment implements
        Preference.OnPreferenceChangeListener {
    public static final String KEY_FAN_SMART = "smart_fan_switch";
    public static final String KEY_FAN_MAX = "fan_speed_max";

    public static final String SMART_FAN = "/sys/kernel/fan/fan_smart";
    public static final String SPEED_LEVEL = "/sys/kernel/fan/fan_speed_level";

    private SwitchPreference mPrefFanSmart;
    private SwitchPreference mPrefFanMax;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.fan);
        mPrefFanSmart = (SwitchPreference) findPreference(KEY_FAN_SMART);
        mPrefFanSmart.setChecked(SettingsUtils.getEnabled(getActivity(), KEY_FAN_SMART));
        mPrefFanSmart.setOnPreferenceChangeListener(this);

        mPrefFanMax = (SwitchPreference) findPreference(KEY_FAN_MAX);
        mPrefFanMax.setChecked(SettingsUtils.getEnabled(getActivity(), KEY_FAN_MAX));
        mPrefFanMax.setOnPreferenceChangeListener(this);

        if (SettingsUtils.getEnabled(getActivity(), KEY_FAN_SMART))
            mPrefFanMax.setEnabled(false);
    }

    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object value) {
        final String key = preference.getKey();
        boolean enabled = (boolean) value;

        if (KEY_FAN_SMART.equals(key)) {
            FileUtils.writeLine(SMART_FAN, enabled ? "1" : "0");
            SettingsUtils.setEnabled(getActivity(), KEY_FAN_SMART, enabled);
            if (enabled)
                FileUtils.writeLine(SPEED_LEVEL, "0");
            mPrefFanMax.setEnabled(!enabled);
        } else if (KEY_FAN_MAX.equals(key)) {
            FileUtils.writeLine(SPEED_LEVEL, enabled ? "5" : "0");
            SettingsUtils.setEnabled(getActivity(), KEY_FAN_MAX, enabled);
        }
        return true;
    }
}
