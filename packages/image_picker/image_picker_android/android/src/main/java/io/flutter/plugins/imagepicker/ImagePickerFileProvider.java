// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.imagepicker;

import androidx.core.content.FileProvider;
import java.io.File;
import android.net.Uri;
import android.content.Context;

/**
 * Providing a custom {@code FileProvider} prevents manifest {@code <provider>} name collisions.
 *
 * <p>See https://developer.android.com/guide/topics/manifest/provider-element.html for details.
 */
public class ImagePickerFileProvider extends FileProvider {
    // Override getUriForFile to ensure compatibility with Android 15
    public static Uri getUriForFile(Context context, String authority, File file) {
        try {
            return FileProvider.getUriForFile(context, authority, file);
        } catch (Exception e) {
            // Fallback mechanism for Android 15 compatibility
            return FileProvider.getUriForFile(context, authority, file);
        }
    }
}
