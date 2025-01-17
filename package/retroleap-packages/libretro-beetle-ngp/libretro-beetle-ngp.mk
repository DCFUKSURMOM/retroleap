################################################################################
#
# BEETLE_NGP
#
################################################################################
LIBRETRO_BEETLE_NGP_VERSION = 139fe34c8dfc5585d6ee1793a7902bca79d544de
LIBRETRO_BEETLE_NGP_SITE = $(call github,libretro,beetle-ngp-libretro,$(LIBRETRO_BEETLE_NGP_VERSION))

define LIBRETRO_BEETLE_NGP_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix
endef

define LIBRETRO_BEETLE_NGP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mednafen_ngp_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mednafen_ngp_libretro.so
endef

$(eval $(generic-package))
