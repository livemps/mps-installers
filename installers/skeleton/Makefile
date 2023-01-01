# +++++ Configuration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Makefile Setup ---#
default: install
.PHONY: default help install uninstall status distrotest
# +++++ Environment checks ++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Early Shells 
DISTROTEST_DEBIAN := $(shell lsb_release -is)
DISTROTEST_ARCH := $(shell lsb_release -is)
# --- Check Distro (Auto)
ifeq ($(DISTROTEST_ARCH),Arch)
	MKEXT :=arch
else ifeq ($(DISTROTEST_DEBIAN),Debian)
	MKEXT :=debian
else
	MKEXT :=none
endif
# +++++ Help ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
help:
	@echo ""
	@echo "Usage (As root): "
	@echo ""
	@echo "  make [DISTRO=DISTRO] TARGET"
	@echo "      DISTRO:"
	@echo "         arch      : Arch Linux"
	@echo "         debian    : Debian Linux"
	@echo ""
	@echo "      TARGETS:"
	@echo "         help      : Help menu"
	@echo "         install   : Install components"
	@echo "         uninstall : Uninstall components"
	@echo "         status    : Current status"
	@echo ""
	@echo "  Example: make DISTRO=debian install "
	@echo ""
# +++++ Targets +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Test distro
distrotest:
ifeq ($(MKEXT),none)
	$(error DISTRO not found and auto detection failed!)
endif
# --- Default installers
install: distrotest
	@make --no-print-directory -f Makefile.$(MKEXT) install
uninstall: distrotest
	@make --no-print-directory -f Makefile.$(MKEXT) uninstall
status: distrotest
	@make --no-print-directory -f Makefile.$(MKEXT) status
