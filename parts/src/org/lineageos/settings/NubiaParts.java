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

package org.lineageos.settings;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.MenuItem;
import android.content.Intent;
import android.os.Bundle;
import androidx.preference.PreferenceFragment;
import androidx.preference.Preference;
import androidx.preference.ListPreference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceManager;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;
import androidx.preference.TwoStatePreference;

import org.lineageos.settings.FanSettings;

public class NubiaParts extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getActionBar().setDisplayHomeAsUpEnabled(true);

        Fragment fragment = getFragmentManager().findFragmentById(android.R.id.content);
        NubiaPartsFragment mNubiaPartsFragment;
        if (fragment == null) {
            mNubiaPartsFragment = new NubiaPartsFragment();
            getFragmentManager().beginTransaction()
                    .add(android.R.id.content, mNubiaPartsFragment)
                    .commit();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public static class NubiaPartsFragment extends PreferenceFragment implements
        Preference.OnPreferenceChangeListener {

        @Override
        public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
            setPreferencesFromResource(R.xml.nubiaparts, rootKey);
            Preference mFanPref = findPreference("fan");
            mFanPref.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
                @Override
                public boolean onPreferenceClick(Preference preference) {
                    Intent intent = new Intent(getContext(), FanSettings.class);
                    startActivity(intent);
                    return true;
                }
            });
        }

        @Override
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            final String key = preference.getKey();
            return true;
        }
    }
}
