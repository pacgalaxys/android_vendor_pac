# Check for target product
ifeq (pac_p970,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pac/overlay/aokp/common

# PAC device overlay
$(shell cp -f vendor/pac/prebuilt/common/bootanimation_framework/android-logo-mask_lg-hdpi.png frameworks/base/core/res/assets/images/android-logo-mask.png)

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/pac/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

# include ParanoidAndroid common configuration
include vendor/pac/config/pac_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/p970/cm.mk)

PRODUCT_NAME := pac_p970

endif