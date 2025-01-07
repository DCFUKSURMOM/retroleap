################################################################################
#
# NESTOPIA
#
################################################################################
LIBRETRO_NESTOPIA_VERSION = 9762adc00668f3a2e1016f3ad07ff9cbf9d67459
LIBRETRO_NESTOPIA_SITE = $(call github,libretro,nestopia,$(LIBRETRO_NESTOPIA_VERSION))

define LIBRETRO_NESTOPIA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro/ platform="$(LIBRETRO_BOARD)"
endef

define LIBRETRO_NESTOPIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/nestopia_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/nestopia_libretro.so
endef

$(eval $(generic-package))
