#############################################################
#
# libretro-swanstation
#
#############################################################

LIBRETRO_SWANSTATION_VERSION = 10af0c78ba0e3516e70f4ed7c6020827bdb2647e
LIBRETRO_SWANSTATION_SITE = https://github.com/libretro/swanstation.git
LIBRETRO_SWANSTATION_SITE_METHOD = git
LIBRETRO_SWANSTATION_LICENSE = GPLv3
LIBRETRO_SWANSTATION_LICENSE_FILES = LICENSE

define LIBRETRO_SWANSTATION_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/bin/* \
        $(TARGET_DIR)/usr/lib/
    $(INSTALL) -D -m 0755 $(@D)/swanstation_libretro.so \
        $(TARGET_DIR)/usr/lib/libretro/swanstation_libretro.so
endef

$(eval $(cmake-package))