# Custom apns must come before cdma.mk is included
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := l1m

TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/l1m/device_l1m.mk)

# Device naming
PRODUCT_DEVICE := l1m
PRODUCT_NAME := cm_l1m
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-MS870
PRODUCT_MANUFACTURER := lge

CDMA_CARRIER_ALPHA := MetroPCS
CDMA_CARRIER_NUMERIC := 311660

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="lge/l1m_MPCS_US/l1m:4.1.2/JZO54K/MS77010f.1360114527:user/release-keys" \
    PRIVATE_BUILD_DESC="l1m_MPCS_US-user 4.1.2 JZO54K MS77010f.1360114527 release-keys"
