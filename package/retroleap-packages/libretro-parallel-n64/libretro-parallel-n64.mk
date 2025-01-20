################################################################################
#
# parallel-n64
#
################################################################################
LIBRETRO_PARALLEL-N64_VERSION = e372c5e327dcd649e9d840ffc3d88480b6866eda
LIBRETRO_PARALLEL-N64_SITE = $(call github,libretro,parallel-n64,$(LIBRETRO_MUPEN64_VERSION))
LIBRETRO_PARALLEL-N64_DEPENDENCIES = rpi-userland

ifeq ($(BR2_cortex_a7),y)
	LIBRETRO_PARALLEL-N64_PLATFORM=rpi2
else
	LIBRETRO_PARALLEL-N64_PLATFORM=rpi
endif

define LIBRETRO_PARALLEL-N64_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix WITH_DYNAREC=arm
endef

define LIBRETRO_PARALLEL-N64_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/parallel_n64_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/parallel_n64_libretro.so
endef

$(eval $(generic-package))
