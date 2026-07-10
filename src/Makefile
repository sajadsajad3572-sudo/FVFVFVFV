export THEOS=/var/mobile/theos

ARCHS = arm64
TARGET = iphone:clang:11.2:9.0
GO_EASY_ON_ME = 1

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = zergete

zergete_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
zergete_CFLAGS = -fobjc-arc #-w #-Wno-deprecated -Wno-deprecated-declarations

zergete_FILES = ESP.mm Guge.mm ESPPPP.mm $(wildcard JHPP/*.m) $(wildcard JHDragView/*.m) $(wildcard HUD/*.m) $(wildcard SCLAlertView/*.m) $(wildcard AFNetworking/*.m) $(wildcard AES/*.m)

zergete_LIBRARIES += substrate
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 ShadowTrackerExtra || :"
