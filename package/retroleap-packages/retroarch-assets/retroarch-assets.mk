################################################################################
#
# retroarch-assets
#
################################################################################

RETROARCH_ASSETS_VERSION = master
RETROARCH_ASSETS_SITE = $(call github,libretro,retroarch-assets,$(RETROARCH_ASSETS_VERSION))
RETROARCH_ASSETS_LICENSE = GPL-3.0
RETROARCH_ASSETS_LICENSE_FILES = COPYING

define RETROARCH_ASSETS_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/configs/.config/retroarch/assets
    rm -r $(@D)/Makefile
    rm -r $(@D)/configure
    cp -r $(@D)/* $(TARGET_DIR)/configs/.config/retroarch/assets/
endef

$(eval $(generic-package))