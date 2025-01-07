################################################################################
#
# FBNEO
#
################################################################################
LIBRETRO_FBNEO_VERSION = 27f594be691e7a7fbb9db9d4a5d0dc12219e4fa4
LIBRETRO_FBNEO_SITE = $(call github,libretro,FBNeo,$(LIBRETRO_FBNEO_VERSION))

define LIBRETRO_FBNEO_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f makefile.libretro platform="$(LIBRETRO_BOARD)"
endef

define LIBRETRO_FBA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fbneo_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fbneo_libretro.so
endef

$(eval $(generic-package))
