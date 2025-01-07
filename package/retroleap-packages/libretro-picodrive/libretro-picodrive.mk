################################################################################
#
# PICODRIVE
#
################################################################################

LIBRETRO_PICODRIVE_VERSION = bb4b7bcddb9f2f218e88971cccc66edf6c7669f0
LIBRETRO_PICODRIVE_SITE = https://github.com/libretro/picodrive.git
LIBRETRO_PICODRIVE_SITE_METHOD = git
LIBRETRO_PICODRIVE_DEPENDENCIES = libpng retroarch
LIBRETRO_PICODRIVE_GIT_SUBMODULES=y

PICOPLATFORM=$(LIBRETRO_PLATFORM) armasm

define LIBRETRO_PICODRIVE_BUILD_CMDS
	$(MAKE) -C $(@D)/cpu/cyclone CONFIG_FILE=$(@D)/cpu/cyclone_config.h
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile.libretro
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO) -I $(@D)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C $(@D)/ -f Makefile.libretro platform="$(PICOPLATFORM)"
endef

define LIBRETRO_PICODRIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/picodrive_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/picodrive_libretro.so
endef

$(eval $(generic-package))
