################################################################################
#
# rpi-armmem
#
################################################################################

RPI_ARMMEM_VERSION = a3277ce9505cadfb158a7a128196058f3cc9fc47
RPI_ARMMEM_SITE = $(call github,bavison,arm-mem,$(RPI_ARMMEM_VERSION))
CFLAGS = -fPIC -std=gnu99 -O2

define RPI_ARMMEM_BUILD_CMDS
	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" CFLAGS="$(CFLAGS)" all -C $(@D)
endef

define RPI_ARMMEM_INSTALL_TARGET_CMDS
	if [ -n "$(BR2_cortex_a7)" ]; then suffix="v7l"; else suffix="v6l"; fi; \
	$(INSTALL) -D -m 0755 $(@D)/libarmmem-$${suffix}.so $(TARGET_DIR)/usr/lib/libarmmem.so
endef

$(eval $(generic-package))

