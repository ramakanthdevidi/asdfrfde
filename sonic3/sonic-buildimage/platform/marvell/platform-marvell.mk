# Marvell Platform modules

AC5X_RD98DX35xx_PLATFORM_MODULE_VERSION = 1.0
AC5X_RD98DX35xxCN9131_PLATFORM_MODULE_VERSION = 1.0
FALCON_PLATFORM_MODULE_VERSION = 1.0

ifeq ($(CONFIGURED_ARCH),arm64)

AC5X_RD98DX35xx_PLATFORM = sonic-platform-rd98dx35xx_$(AC5X_RD98DX35xx_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(AC5X_RD98DX35xx_PLATFORM)_SRC_PATH = $(PLATFORM_PATH)/sonic-platform-marvell
$(AC5X_RD98DX35xx_PLATFORM)_DEPENDS += $(LINUX_HEADERS) $(LINUX_HEADERS_COMMON)
$(AC5X_RD98DX35xx_PLATFORM)_PLATFORM = arm64-marvell_rd98DX35xx-r0
SONIC_DPKG_DEBS += $(AC5X_RD98DX35xx_PLATFORM)

AC5X_RD98DX35xxCN9131_PLATFORM = sonic-platform-rd98dx35xx-cn9131_$(AC5X_RD98DX35xxCN9131_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(AC5X_RD98DX35xxCN9131_PLATFORM)_PLATFORM = arm64-marvell_rd98DX35xx_cn9131-r0
$(eval $(call add_extra_package,$(AC5X_RD98DX35xx_PLATFORM),$(AC5X_RD98DX35xxCN9131_PLATFORM)))

else ifeq ($(CONFIGURED_ARCH),amd64)

AC5X_RD98DX35xx_PLATFORM = sonic-platform-rd98dx35xx-x86_$(AC5X_RD98DX35xx_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(AC5X_RD98DX35xx_PLATFORM)_SRC_PATH = $(PLATFORM_PATH)/sonic-platform-marvell
$(AC5X_RD98DX35xx_PLATFORM)_DEPENDS += $(LINUX_HEADERS) $(LINUX_HEADERS_COMMON)
$(AC5X_RD98DX35xx_PLATFORM)_PLATFORM = x86_64-marvell_rd98DX35xx-r0
SONIC_DPKG_DEBS += $(AC5X_RD98DX35xx_PLATFORM)

FALCON_DB98CX8580_32CD_PLATFORM = sonic-platform-db98cx8580-32cd_$(FALCON_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(FALCON_DB98CX8580_32CD_PLATFORM)_PLATFORM = x86_64-marvell_db98cx8580_32cd-r0
$(eval $(call add_extra_package,$(AC5X_RD98DX35xx_PLATFORM),$(FALCON_DB98CX8580_32CD_PLATFORM)))

FALCON_DB98CX8540_16CD_PLATFORM = sonic-platform-db98cx8540-16cd_$(FALCON_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(FALCON_DB98CX8540_16CD_PLATFORM)_PLATFORM = x86_64-marvell_db98cx8540_16cd-r0
$(eval $(call add_extra_package,$(AC5X_RD98DX35xx_PLATFORM),$(FALCON_DB98CX8540_16CD_PLATFORM)))

FALCON_DB98CX8514_10CC_PLATFORM = sonic-platform-db98cx8514-10cc_$(FALCON_PLATFORM_MODULE_VERSION)_$(CONFIGURED_ARCH).deb
$(FALCON_DB98CX8514_10CC_PLATFORM)_PLATFORM = x86_64-marvell_db98cx8514_10cc-r0
$(eval $(call add_extra_package,$(AC5X_RD98DX35xx_PLATFORM),$(FALCON_DB98CX8514_10CC_PLATFORM)))

endif