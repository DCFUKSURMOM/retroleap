################################################################################
#
# LIBRETRO-CORE-INFO
#
################################################################################
LIBRETRO_CORE_INFO_VERSION = 42ea1e4f8b57da52c6c1d8c7d26ade1e9087e9f5
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/configs/.config/retroarch/cores
	$(INSTALL) -D $(@D)/*.info \
		$(TARGET_DIR)/configs/.config/retroarch/cores
endef

$(eval $(generic-package))
