# Keep FileProvider and related classes
-keep class androidx.core.content.FileProvider { *; }
-keep class androidx.core.content.FileProvider$SimplePathStrategy { *; }
-keep class androidx.core.content.** { *; }

# Keep XML parser classes
-keep class android.content.res.XmlBlock { *; }
-keep class android.content.res.XmlBlock$Parser { *; }
-keep class android.content.res.XmlResourceParser { *; }
-keep class android.content.res.XmlResourceParserImpl { *; }
-keep class android.content.res.XmlBlock$ParserImpl { *; }

# Keep XML resource references
-keepclassmembers class **.R$* {
    public static <fields>;
}

# Keep FileProvider paths and annotations
-keepattributes *Annotation*
-keep class com.danihelgroup.carter.R$xml { *; }

# Additional rules for FileProvider
-keep class android.support.v4.content.FileProvider { *; }
-keep class android.support.v4.content.FileProvider$SimplePathStrategy { *; }
-dontwarn androidx.core.**
-keep class android.content.** { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep all classes in your app package
-keep class com.danihelgroup.carter.** { *; }

# Keep FileProvider configuration
-keepnames class androidx.core.content.FileProvider
-keepnames class android.support.v4.content.FileProvider
-keep class androidx.core.content.FileProvider$SimplePathStrategy { *; }

# Keep XML resources used by FileProvider
-keep public class com.danihelgroup.carter.R$xml {
    public static final int file_paths;
}

# Keep FileProvider related classes
-keep public class androidx.core.content.FileProvider {
    public <init>();
    public static android.net.Uri getUriForFile(android.content.Context, java.lang.String, java.io.File);
}

# Prevent interface implementation issues
-keep class * implements android.content.res.XmlResourceParser { *; }
-keep class * implements org.xmlpull.v1.XmlPullParser { *; }
-keep class * implements org.xmlpull.v1.XmlSerializer { *; }

# Keep XML parsing related classes
-keep class org.xmlpull.v1.** { *; }
-keep class android.util.Xml { *; }
-keep class android.util.Xml$Encoding { *; }