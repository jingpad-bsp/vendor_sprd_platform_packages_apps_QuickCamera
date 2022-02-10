LOCAL_PATH:= $(call my-dir)

# To make sure developers using mm can build this
ifneq ($(strip $(ONE_SHOT_MAKEFILE)),)
PRODUCT_USE_CAM_QUICKCAM := true
endif


ifeq ($(strip $(PRODUCT_USE_CAM_QUICKCAM)),false)
else


include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := QuickCamera
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_STATIC_JAVA_LIBRARIES += android-ex-camera2-portability

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif

