LIBSAIBCM_XGS_VERSION = 10.1.42.0
LIBSAIBCM_DNX_VERSION = 11.2.7.1
LIBSAIBCM_XGS_BRANCH_NAME = SAI_10.1.0_GA
LIBSAIBCM_DNX_BRANCH_NAME = SAI_11.2.0_GA
LIBSAIBCM_XGS_URL_PREFIX = "https://sonicstorage.blob.core.windows.net/public/sai/sai-broadcom/$(LIBSAIBCM_XGS_BRANCH_NAME)/$(LIBSAIBCM_XGS_VERSION)/xgs"
LIBSAIBCM_DNX_URL_PREFIX = "https://sonicstorage.blob.core.windows.net/public/sai/sai-broadcom/$(LIBSAIBCM_DNX_BRANCH_NAME)/$(LIBSAIBCM_DNX_VERSION)/dnx"

BRCM_XGS_SAI = libsaibcm_$(LIBSAIBCM_XGS_VERSION)_amd64.deb
$(BRCM_XGS_SAI)_URL = "$(LIBSAIBCM_XGS_URL_PREFIX)/$(BRCM_XGS_SAI)"
BRCM_XGS_SAI_DEV = libsaibcm-dev_$(LIBSAIBCM_XGS_VERSION)_amd64.deb
$(eval $(call add_derived_package,$(BRCM_XGS_SAI),$(BRCM_XGS_SAI_DEV)))
$(BRCM_XGS_SAI_DEV)_URL = "$(LIBSAIBCM_XGS_URL_PREFIX)/$(BRCM_XGS_SAI_DEV)"

# SAI module for DNX Asic family
BRCM_DNX_SAI = libsaibcm_dnx_$(LIBSAIBCM_DNX_VERSION)_amd64.deb
$(BRCM_DNX_SAI)_URL = "$(LIBSAIBCM_DNX_URL_PREFIX)/$(BRCM_DNX_SAI)"

SONIC_ONLINE_DEBS += $(BRCM_XGS_SAI)
SONIC_ONLINE_DEBS += $(BRCM_DNX_SAI)
$(BRCM_XGS_SAI_DEV)_DEPENDS += $(BRCM_XGS_SAI)

$(BRCM_XGS_SAI)_SKIP_VERSION=y
$(BRCM_XGS_SAI_DEV)_SKIP_VERSION=y
$(BRCM_DNX_SAI)_SKIP_VERSION=y

$(eval $(call add_conflict_package,$(BRCM_XGS_SAI_DEV),$(LIBSAIVS_DEV)))