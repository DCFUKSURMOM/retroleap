################################################################################
#
# RETROARCH-ASSETS
#
################################################################################
RETROARCH_ASSETS_DEPENDS = retroarch

define RETROARCH_ASSETS_INSTALL_TARGET_CMDS
	echo This is hacky AF but it seems to work...
	wget --directory-prefix=$(@D)/ https://github.com/libretro/retroarch-assets/releases/download/Latest/assets.7z
	7z x $(@D)/assets.7z -o$(TARGET_DIR)/configs/.config/retroarch/assets
endef

$(eval $(generic-package))
