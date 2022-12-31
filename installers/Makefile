# +++++ Configuration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Makefile Setup ---#
default: install
.PHONY: default help install uninstall status usertest distrotest
# --- MPS Setup ---#
INST ?= vim
define doJobs
	for target in $(INST) ; do make -C $$target/ $(1) ; done
endef
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
# # +++++ Targets +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
install:
	$(call doJobs,$@)
uninstall:
	$(call doJobs,$@)
status:
	$(call doJobs,$@)
