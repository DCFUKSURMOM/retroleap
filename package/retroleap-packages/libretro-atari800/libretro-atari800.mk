################################################################################
#
# ATARI800
#
################################################################################
LIBRETRO_ATARI800_VERSION = 6a18cb23cc4a7cecabd9b16143d2d7332ae8d44b
LIBRETRO_ATARI800_SITE = $(call github,libretro,libretro-atari800,$(LIBRETRO_ATARI800_VERSION))
LIBRETRO_ATARI800_TARGET = atari800_libretro.so
 define LIBRETRO_ATARI800_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef
define LIBRETRO_ATARI800_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(LIBRETRO_ATARI800_TARGET) \
		$(TARGET_DIR)/usr/lib/libretro/$(LIBRETRO_ATARI800_TARGET)
endef
 $(eval $(generic-package))
