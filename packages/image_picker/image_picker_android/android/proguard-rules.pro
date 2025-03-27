# Keep FileProvider and related classes from being optimized or obfuscated
-keep class androidx.core.content.FileProvider { *; }
-keep class androidx.core.content.FileProvider$SimplePathStrategy { *; }
-keep class android.content.res.XmlBlock$Parser { *; }
-keep class androidx.core.content.** { *; }

# Keep the interfaces used by FileProvider
-keep interface I7.a { *; }
-keep class * implements I7.a { *; }

# Prevent ProGuard from stripping interface information
-keepattributes *Annotation*,InnerClasses,Signature,EnclosingMethod

# Preserve all native method names and the names of their classes
-keepclasseswithmembernames class * {
    native <methods>;
}

# Don't process paths that might cause problems
-keeppackagenames org.xmlpull.v1.**
-keep class org.xmlpull.** { *; }
-keep class android.content.res.** { *; }

# Android 15 specific compatibility fixes
-keep class android.content.res.XmlBlock { *; }
-keep class android.content.res.XmlBlock$ParserImpl { *; }

# Keep XML resource parser implementation
-keep class android.content.res.XmlResourceParser { *; }
-keep class android.content.res.AssetManager { *; }

# Keep android.util.Xml related classes
-keep class android.util.Xml { *; }
-keep class android.util.Xml$Encoding { *; }

# Keep specific methods in FileProvider
-keepclassmembers class androidx.core.content.FileProvider {
    public static android.net.Uri getUriForFile(android.content.Context, java.lang.String, java.io.File);
    static androidx.core.content.FileProvider$SimplePathStrategy parsePathStrategy(android.content.Context, java.lang.String);
}

# Fix for R8 optimization that can break FileProvider
-keepclassmembers class android.content.res.Resources {
    public android.content.res.XmlResourceParser loadXmlResourceParser(int, java.lang.String);
}

# Prevent name obfuscation for classes referenced via XML
-keepnames class androidx.core.content.FileProvider
-keepnames class io.flutter.plugins.imagepicker.ImagePickerFileProvider

# Keep XML parser classes
-keep class android.content.res.XmlBlock { *; }
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