# Check for target product
ifeq (pac_shooter,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pac/overlay/aokp/common

# PAC device overlay
$(shell cp -f vendor/pac/prebuilt/common/bootanimation_framework/android-logo-mask_htc-hdpi.png frameworks/base/core/res/assets/images/android-logo-mask.png)

# PAC boot logo
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/common/bootlogo/pac_logo_480x854.rle:root/logo.rle

# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

# Hardware info for Settings>About Phone>Hardware info
PRODUCT_PROPERTY_OVERRIDES += \
    ro.device.chipset=Qualcomm MSM8660 \
    ro.device.gpu=Adreno 220 \
    ro.device.front_cam=1.3 MP, 720p video (1280x720 @ 30fps) \
    ro.device.rear_cam=5 MP, 720p video (1280x720 @ 30fps) \
    ro.device.screen_res=540x960

# include ParanoidAndroid common configuration
include vendor/pac/config/pac_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/shooter/cm.mk)

PRODUCT_NAME := pac_shooter

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/pac/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/pac/tools/addprojects.py $(PRODUCT_NAME))

endif
