# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# $Id: Android.mk 216 2015-05-18 15:28:41Z oparviai $

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# *** Remember: Change -O0 into -O2 in add-applications.mk ***

LOCAL_MODULE    := soundtouch
LOCAL_SRC_FILES := soundtouch-jni.cpp soundtouch/src/SoundTouch/AAFilter.cpp  soundtouch/src/SoundTouch/FIFOSampleBuffer.cpp \
                soundtouch/src/SoundTouch/FIRFilter.cpp soundtouch/src/SoundTouch/cpu_detect_x86.cpp \
                soundtouch/src/SoundTouch/sse_optimized.cpp soundtouch/src/SoundStretch/WavFile.cpp \
                soundtouch/src/SoundTouch/RateTransposer.cpp soundtouch/src/SoundTouch/SoundTouch.cpp \
                soundtouch/src/SoundTouch/InterpolateCubic.cpp soundtouch/src/SoundTouch/InterpolateLinear.cpp \
                soundtouch/src/SoundTouch/InterpolateShannon.cpp soundtouch/src/SoundTouch/TDStretch.cpp \
                soundtouch/src/SoundTouch/BPMDetect.cpp soundtouch/src/SoundTouch/PeakFinder.cpp

# for native audio
LOCAL_SHARED_LIBRARIES += -lgcc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/soundtouch/include
# --whole-archive -lgcc 
# for logging
LOCAL_LDLIBS    += -llog
# for native asset manager
#LOCAL_LDLIBS    += -landroid

# Custom Flags: 
# -fvisibility=hidden : don't export all symbols
LOCAL_CFLAGS += -fvisibility=hidden -I soundtouch/source/../include -fdata-sections -ffunction-sections

# OpenMP mode : enable these flags to enable using OpenMP for parallel computation 
#LOCAL_CFLAGS += -fopenmp
#LOCAL_LDFLAGS += -fopenmp


# Use ARM instruction set instead of Thumb for improved calculation performance in ARM CPUs	
LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
