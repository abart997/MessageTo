include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = MessageTo
MessageTo_FILES = Tweak.xm
MessageTo_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
