# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# ========================================================================================
# RunAnywhere AI LLM Sample App - ProGuard Configuration
# ========================================================================================

# Keep line numbers for debugging
-keepattributes SourceFile,LineNumberTable,*Annotation*,Signature,InnerClasses,EnclosingMethod

# ========================================================================================
# LLM Framework Rules - Keep all LLM service implementations
# ========================================================================================

# Keep all LLM service classes and their methods
-keep class com.runanywhere.runanywhereai.llm.frameworks.** { *; }
-keep interface com.runanywhere.runanywhereai.llm.LLMService { *; }
-keep class com.runanywhere.runanywhereai.llm.** { *; }

# Keep UnifiedLLMManager
-keep class com.runanywhere.runanywhereai.manager.UnifiedLLMManager { *; }

# ========================================================================================
# Data Models and DTOs
# ========================================================================================

# Keep all data classes used for serialization/deserialization
-keep @kotlinx.serialization.Serializable class ** { *; }
-keep class com.runanywhere.runanywhereai.data.** { *; }

# Keep Room database entities and DAOs
-keep class com.runanywhere.runanywhereai.data.database.** { *; }
-keep @androidx.room.Entity class ** { *; }
-keep @androidx.room.Database class ** { *; }
-keep @androidx.room.Dao class ** { *; }

# ========================================================================================
# Native Libraries and JNI
# ========================================================================================

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep classes that are used by native code
-keep class * {
    native <methods>;
}

# ========================================================================================
# TensorFlow Lite
# ========================================================================================

# Keep TensorFlow Lite classes
-keep class org.tensorflow.lite.** { *; }
-keep class org.tensorflow.lite.support.** { *; }
-dontwarn org.tensorflow.lite.**

# ========================================================================================
# ONNX Runtime
# ========================================================================================

# Keep ONNX Runtime classes
-keep class ai.onnxruntime.** { *; }
-dontwarn ai.onnxruntime.**

# ========================================================================================
# MediaPipe
# ========================================================================================

# Keep MediaPipe classes
-keep class com.google.mediapipe.** { *; }
-dontwarn com.google.mediapipe.**

# ========================================================================================
# Llama.cpp (via JNI)
# ========================================================================================

# Keep llama.cpp JNI interfaces
-keep class ai.djl.llama.jni.** { *; }
-dontwarn ai.djl.llama.jni.**

# ========================================================================================
# ExecuTorch
# ========================================================================================

# Keep ExecuTorch classes when available
-keep class org.pytorch.executorch.** { *; }
-dontwarn org.pytorch.executorch.**

# ========================================================================================
# MLC-LLM
# ========================================================================================

# Keep MLC-LLM classes
-keep class ai.mlc.mlcllm.** { *; }
-dontwarn ai.mlc.mlcllm.**

# ========================================================================================
# picoLLM
# ========================================================================================

# Keep picoLLM classes when available
-keep class ai.picovoice.picollm.** { *; }
-dontwarn ai.picovoice.picollm.**

# ========================================================================================
# Android AI Core
# ========================================================================================

# Keep Android AI Core classes
-keep class com.google.android.aicore.** { *; }
-dontwarn com.google.android.aicore.**

# ========================================================================================
# Kotlin Coroutines
# ========================================================================================

# Keep coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-dontwarn kotlinx.coroutines.**

# ========================================================================================
# Compose and UI
# ========================================================================================

# Keep Compose runtime classes
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**

# Keep ViewModel classes
-keep class androidx.lifecycle.ViewModel { *; }
-keep class * extends androidx.lifecycle.ViewModel { *; }

# ========================================================================================
# Hilt/Dagger
# ========================================================================================

# Keep Hilt generated classes
-keep class dagger.hilt.** { *; }
-keep class * extends dagger.hilt.android.internal.managers.ApplicationComponentManager { *; }
-keep class **_HiltModules { *; }
-keep class **_HiltComponents { *; }
-keep class **_Factory { *; }
-keep class **_MembersInjector { *; }

# ========================================================================================
# Security and Encryption
# ========================================================================================

# Keep encryption classes
-keep class com.runanywhere.runanywhereai.security.** { *; }
-keep class androidx.security.crypto.** { *; }

# Keep Android Keystore classes
-keep class android.security.keystore.** { *; }
-dontwarn android.security.keystore.**

# ========================================================================================
# JSON and Serialization
# ========================================================================================

# Keep JSON classes
-keep class org.json.** { *; }
-dontwarn org.json.**

# Keep Gson classes if used
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# ========================================================================================
# Model Files and Assets
# ========================================================================================

# Keep model files in assets
-keepresourcefiles assets/models/**
-keepresourcefiles assets/tokenizers/**

# Don't obfuscate model loading code
-keep class com.runanywhere.runanywhereai.data.repository.ModelRepository { *; }

# ========================================================================================
# Performance and Monitoring
# ========================================================================================

# Keep performance monitoring classes
-keep class com.runanywhere.runanywhereai.monitoring.** { *; }

# ========================================================================================
# Reflection
# ========================================================================================

# Keep classes that use reflection
-keepattributes *Annotation*
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ========================================================================================
# Common Android Rules
# ========================================================================================

# Keep custom views
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# Keep Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# ========================================================================================
# Warnings to Ignore
# ========================================================================================

# Ignore warnings for optional dependencies
-dontwarn java.awt.**
-dontwarn javax.swing.**
-dontwarn sun.misc.**
-dontwarn java.lang.management.**
-dontwarn org.slf4j.**
-dontwarn ch.qos.logback.**

# Ignore warnings for reflection-based libraries
-dontwarn kotlin.reflect.**
-dontwarn org.jetbrains.annotations.**

# ========================================================================================
# Debug Information (Comment out for release builds)
# ========================================================================================

# Keep debug information for crash reporting
-keepattributes SourceFile,LineNumberTable

# Print configuration for debugging (remove in final release)
#-printconfiguration proguard-config.txt
#-printusage proguard-usage.txt
#-printmapping proguard-mapping.txt
