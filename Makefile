ARCHS = arm64e
INSTALL_TARGET_PROCESSES = Frichti

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FrichtiZalgoMode

FrichtiZalgoMode_FILES = Tweak.x
FrichtiZalgoMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
