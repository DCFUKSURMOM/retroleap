################################################################################
#
# FCEUNEXT
#
################################################################################
LIBRETRO_FCEUNEXT_VERSION = 204a5a1bba98dadea6ee3eb28cf74fa25089c161
LIBRETRO_FCEUNEXT_SITE = $(call github,libretro,fceu-next,$(LIBRETRO_FCEUNEXT_VERSION))

define LIBRETRO_FCEUNEXT_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/fceumm-code -f Makefile.libretro platform=unix
endef

define LIBRETRO_FCEUNEXT_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fceumm-code/fceumm_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fceunext_libretro.so
endef

$(eval $(generic-package))
