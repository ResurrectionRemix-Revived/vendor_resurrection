# Vanilla
# FOSS
ifeq ($(GAPPS),false)
    WITH_GMS := true
    PRODUCT_RR_EXTRAVERSION := FOSS-
# GAPPS
else ifeq ($(GAPPS),true)
    $(GAPPS will be included in the build)
    PRODUCT_RR_EXTRAVERSION = GAPPS-
    ifeq ($(TARGET_ARCH), arm64)
        $(warning including 64 bit gapps based on TARGET_ARCH)
        $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
    endif
    ifeq ($(TARGET_ARCH), arm)
        $(warning including 32 bit gapps based on TARGET_ARCH)
        $(call inherit-product, vendor/gapps/arm/arm-vendor.mk)
    endif
    ifeq ($(TARGET_ARCH),)
        $(warning TARGET_ARCH undefined, assuming arm64)
        $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
    endif
endif

# RR System Version
PRODUCT_VERSION = SEP26
RR_VERSION := RR-Rev-Q-$(PRODUCT_VERSION)-$(PRODUCT_RR_EXTRAVERSION)$(shell date +%Y%m%d)-$(RR_BUILD)
RR_BUILDTYPE = UNOFFICIAL
