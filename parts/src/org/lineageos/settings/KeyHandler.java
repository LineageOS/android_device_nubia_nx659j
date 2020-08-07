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

import android.content.Context;
import android.media.AudioManager;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.KeyEvent;
import android.util.Log;

import com.android.internal.os.DeviceKeyHandler;

public class KeyHandler implements DeviceKeyHandler {
    private static final String TAG = KeyHandler.class.getSimpleName();

    private static final int KEY_GAMESWITCH_ON = 250;
    private static final int KEY_GAMESWITCH_OFF = 251;

    private final Context mContext;
    private final AudioManager mAudioManager;
    private final Vibrator mVibrator;

    public KeyHandler(Context context) {
        mContext = context;

        mAudioManager = mContext.getSystemService(AudioManager.class);
        mVibrator = mContext.getSystemService(Vibrator.class);
    }

    public KeyEvent handleKeyEvent(KeyEvent event) {
        int scanCode = event.getScanCode();

        switch(scanCode) {
            case KEY_GAMESWITCH_OFF:
                mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_SILENT);
                break;
            case KEY_GAMESWITCH_ON:
                mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_NORMAL);
                break;
            default:
                return event;
        }

        doHapticFeedback();

        return null;
    }

    private void doHapticFeedback() {
        if (mVibrator != null && mVibrator.hasVibrator()) {
            mVibrator.vibrate(VibrationEffect.createOneShot(50,
                    VibrationEffect.DEFAULT_AMPLITUDE));
        }
    }
}
 
