################################################################################
#
# MPV
#
################################################################################
LIBRETRO_MPV_VERSION = 99f7fe4fd43d68da45006301829eaf37c7edbcc2
LIBRETRO_MPV_SITE = $(call github,libretro,libretro-mpv,$(LIBRETRO_MPV_VERSION))
LIBRETRO_MPV_DEPENDENCIES = mpv

define LIBRETRO_MPV_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D) -f Makefile platform="$(LIBRETRO_BOARD)"
endef

define LIBRETRO_MPV_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mpv_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mpv_libretro.so
endef

$(eval $(generic-package))
