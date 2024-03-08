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

import android.content.res.Resources;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.widget.CompoundButton;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;
import androidx.preference.SeekBarPreference;
import androidx.preference.DropDownPreference;

import com.android.settingslib.widget.MainSwitchPreference;

import org.lineageos.settings.R;

import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.utils.SettingsUtils;

public class FanFragment extends PreferenceFragment implements
        CompoundButton.OnCheckedChangeListener, Preference.OnPreferenceChangeListener,
        SharedPreferences.OnSharedPreferenceChangeListener {
    public static final String KEY_FAN_ENABLE = "fan_control_enable";
    public static final String KEY_FAN_MODE = "fan_control_mode";
    public static final String KEY_FAN_MANUAL = "fan_control_manual_slider";

    public static final String SMART_FAN = "/sys/kernel/fan/fan_smart";
    public static final String SPEED_LEVEL = "/sys/kernel/fan/fan_speed_level";

    public static final int FAN_AUTO_VALUE = 1;
    public static final int FAN_MANUAL_VALUE = 2;
    private static final int FAN_MIN_VALUE = 1;
    private static final int FAN_MAX_VALUE = 5;

    private MainSwitchPreference mSwitchBar;
    private DropDownPreference mFanControlMode;
    private SeekBarPreference mFanManualBar;

    private String summary = null;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        int fanModeValue;
        addPreferencesFromResource(R.xml.fan);

        mSwitchBar = (MainSwitchPreference) findPreference(KEY_FAN_ENABLE);
        mSwitchBar.setChecked(SettingsUtils.getEnabled(getActivity(), KEY_FAN_ENABLE));
        mSwitchBar.addOnSwitchChangeListener(this);

        mFanControlMode = (DropDownPreference) findPreference(KEY_FAN_MODE);

        mFanManualBar = (SeekBarPreference) findPreference(KEY_FAN_MANUAL);
        mFanManualBar.setValue(SettingsUtils.getInt(getActivity(), KEY_FAN_MANUAL, 1));
        mFanManualBar.setOnPreferenceChangeListener(this);
        mFanManualBar.setMin(FAN_MIN_VALUE);
        mFanManualBar.setMax(FAN_MAX_VALUE);

        if (mFanControlMode.getValue() != null) {
            fanModeValue = Integer.parseInt((String) mFanControlMode.getValue());

            if (fanModeValue == FAN_AUTO_VALUE) {
                summary = getResources().getString(R.string.fan_control_auto_summary);
                mFanManualBar.setVisible(false);
            } else {
                summary = getResources().getString(R.string.fan_control_manual_summary);
                mFanManualBar.setVisible(true);
            }
        }

        mFanControlMode.setSummary(summary);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        sharedPreferences.unregisterOnSharedPreferenceChangeListener(this);
    }

    @Override
    public void onResume() {
        super.onResume();
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        sharedPreferences.registerOnSharedPreferenceChangeListener(this);
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean enabled) {
        SettingsUtils.setEnabled(getActivity(), KEY_FAN_ENABLE, enabled);
        int fanModeValue = Integer.parseInt((String) mFanControlMode.getValue());
        String manualFanValue;

        if (enabled) {
            SettingsUtils.setEnabled(getActivity(), KEY_FAN_ENABLE, enabled);
            if (fanModeValue == FAN_AUTO_VALUE) {
                FileUtils.writeLine(SMART_FAN, "1");
            } else if (fanModeValue == FAN_MANUAL_VALUE) {
                manualFanValue = String.valueOf(SettingsUtils.getInt(getActivity(), KEY_FAN_MANUAL, 1));
                FileUtils.writeLine(SPEED_LEVEL, manualFanValue);
            }
        } else {
            FileUtils.writeLine(SPEED_LEVEL, "0");
            FileUtils.writeLine(SMART_FAN, "0");
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object value) {
        final String key = preference.getKey();
        String intValueStr;
        int intValue;

        if (KEY_FAN_MANUAL.equals(key)) {
            intValue = (Integer) value;
            intValueStr = String.valueOf(intValue);
            mFanManualBar.setValue(intValue);
            SettingsUtils.putInt(getActivity(), KEY_FAN_MANUAL, intValue);
            FileUtils.writeLine(SPEED_LEVEL, intValueStr);
        }

        return true;
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
        if (KEY_FAN_MODE.equals(key)) {
            int intValue = Integer.parseInt(sharedPreferences.getString(key, String.valueOf(FAN_AUTO_VALUE)));
            mFanControlMode.setValue(String.valueOf(intValue));
            if (intValue == FAN_AUTO_VALUE) {
                summary = getResources().getString(R.string.fan_control_auto_summary);
                mFanManualBar.setVisible(false);
                FileUtils.writeLine(SPEED_LEVEL, "0");
                FileUtils.writeLine(SMART_FAN, "1");
            } else if (intValue == FAN_MANUAL_VALUE) {
                String manualFanValue = String.valueOf(SettingsUtils.getInt(getContext(), KEY_FAN_MANUAL, 1));
                summary = getResources().getString(R.string.fan_control_manual_summary);
                mFanManualBar.setVisible(true);
                FileUtils.writeLine(SMART_FAN, "0");
                FileUtils.writeLine(SPEED_LEVEL, manualFanValue);
            }
            mFanControlMode.setSummary(summary);
        }
    }
}
