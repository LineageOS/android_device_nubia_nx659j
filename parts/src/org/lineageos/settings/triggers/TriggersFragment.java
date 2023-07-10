/*
 * Copyright (C) 2023 The LineageOS Project
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

package org.lineageos.settings.buttons;

import android.content.res.Resources;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.widget.Switch;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;

import org.lineageos.settings.R;

import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.utils.SettingsUtils;

public class TriggersFragment extends PreferenceFragment implements SharedPreferences.OnSharedPreferenceChangeListener {
    public static final String KEY_TRIGGERS_DISABLE = "triggers_disable";
    public static final String KEY_TRIGGERS_MODE_FILE1 = "/sys/devices/platform/soc/988000.i2c/i2c-1/1-0010/mode";
    public static final String KEY_TRIGGERS_MODE_FILE2 = "/sys/devices/platform/soc/990000.i2c/i2c-2/2-0010/mode";

    private SharedPreferences mPrefs;
    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.triggers);
        mPrefs = PreferenceManager.getDefaultSharedPreferences(getContext());
        final SwitchPreference triggersDisable = (SwitchPreference) findPreference(KEY_TRIGGERS_DISABLE);
        triggersDisable.setChecked(mPrefs.getBoolean(KEY_TRIGGERS_DISABLE, true));
    }

    @Override
    public void onResume() {
        super.onResume();
        mPrefs.registerOnSharedPreferenceChangeListener(this);
    }

    @Override
    public void onPause() {
        super.onPause();
        mPrefs.unregisterOnSharedPreferenceChangeListener(this);
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences sharedPreference, String key) {
        if (KEY_TRIGGERS_DISABLE.equals(key)) {
            final boolean value = mPrefs.getBoolean(key, false);
            mPrefs.edit().putBoolean(KEY_TRIGGERS_DISABLE, value).apply();
            FileUtils.writeLine(KEY_TRIGGERS_MODE_FILE1, value ? "0" : "1");
            FileUtils.writeLine(KEY_TRIGGERS_MODE_FILE2, value ? "0" : "1");
        }
    }
}
