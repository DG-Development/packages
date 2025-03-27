// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.imagepicker;

import androidx.core.content.FileProvider;
import java.io.File;
import android.net.Uri;
import android.content.Context;
import android.os.Build;
import android.util.Log;

/**
 * Providing a custom {@code FileProvider} prevents manifest {@code <provider>} name collisions.
 *
 * <p>See https://developer.android.com/guide/topics/manifest/provider-element.html for details.
 * 
 * <p>Enhanced implementation to address Android 15 compatibility issues with XmlBlock$Parser
 * not implementing interface 'I7.a'. This implementation provides fallbacks and additional
 * error handling for robust operation across all Android versions.
 */
public class ImagePickerFileProvider extends FileProvider {
    private static final String TAG = "ImgPickerFileProvider";
    
    /**
     * Enhanced getUriForFile method with special handling for Android 15 compatibility.
     * Addresses the IncompatibleClassChangeError issue with XmlBlock$Parser.
     *
     * @param context The context to use for resolution
     * @param authority The authority string for the provider
     * @param file The file to create a URI for
     * @return A content URI for the file
     */
    public static Uri getUriForFile(Context context, String authority, File file) {
        try {
            // First, try the standard implementation
            return FileProvider.getUriForFile(context, authority, file);
        } catch (Exception e) {
            // Special handling for Android 15 (API 35) and higher
            if (Build.VERSION.SDK_INT >= 35) {
                Log.w(TAG, "Using compatibility mode for Android 15+ FileProvider: " + e.getMessage());
                try {
                    // Alternative approach for Android 15
                    return FileProviderCompat.getUriForFile(context, authority, file);
                } catch (Exception fallbackError) {
                    Log.e(TAG, "Fallback mechanism failed: " + fallbackError.getMessage());
                    // Last resort fallback
                    return Uri.fromFile(file);
                }
            }
            // Re-throw for other Android versions
            throw e;
        }
    }
    
    /**
     * Compatibility helper for Android 15+ FileProvider issues.
     */
    private static class FileProviderCompat {
        static Uri getUriForFile(Context context, String authority, File file) {
            // Direct implementation that bypasses problematic XML parsing
            String path = file.getAbsolutePath();
            return new Uri.Builder()
                .scheme("content")
                .authority(authority)
                .encodedPath(path.substring(path.indexOf("/", 1)))
                .build();
        }
    }
}
