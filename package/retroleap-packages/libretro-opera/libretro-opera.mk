################################################################################
#
# libretro-opera
#
################################################################################
LIBRETRO_OPERA_VERSION = 67a29e60a4d194b675c9272b21b61eaa022f3ba3
LIBRETRO_OPERA_SITE = $(call github,libretro,opera-libretro,$(LIBRETRO_OPERA_VERSION))

define LIBRETRO_OPERA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_OPERA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/opera_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/opera_libretro.so
endef

$(eval $(generic-package))
