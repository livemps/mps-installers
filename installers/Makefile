# +++++ Configuration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Makefile Setup ---#
default: install
.PHONY: default help install uninstall status usertest distrotest upgrade
# --- MPS Setup ---#
INST ?= mpsfolders
define doJobs
	@echo "# --- < $(1) > ---"  ; \
	for target in $(INST) ; do \
		echo "# ---- < $$target > ---"  ; \
		make --no-print-directory -C $$target/ $(1) ; \
		echo "# ---- </ $$target > ---" ;
	done ; \
	echo "# --- </ $(1) > ---" ;
endef
# +++++ Environment checks ++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Early Shells 
DISTROTEST_DEBIAN := $(shell lsb_release -is)
DISTROTEST_ARCH := $(shell lsb_release -is)
DISTRO 		 	?=none
# --- Check Distro (Auto)
ifeq ($(DISTRO),Arch)
	MKEXT :=arch
else ifeq ($(DISTRO),Debian)
	MKEXT :=debian
else
	ifeq ($(DISTROTEST_ARCH),Arch)
		MKEXT :=arch
	else ifeq ($(DISTROTEST_DEBIAN),Debian)
		MKEXT :=debian
	else
		MKEXT :=none
	endif
endif
# --- Test distro
upgrade:
ifeq ($(MKEXT),arch)
	echo "Yes" | sudo pacman --noconfirm -Syy \
	&& echo "YES" | sudo pacman --noconfirm -Syu
else ifeq ($(MKEXT),debian)
	sudo apt update --yes && sudo apt upgrade --yes
endif
# --- Test distro
distrotest:
ifeq ($(MKEXT),none)
	$(error DISTRO not found and auto detection failed!)
endif
# +++++ Help ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
help:
	@echo ""
	@echo "Usage : "
	@echo ""
	@echo "  make [DISTRO=DISTRO] [INST=Components] TARGET"
	@echo "      DISTRO:"
	@echo "         arch       : Arch Linux"
	@echo "         debian     : Debian Linux"
	@echo ""
	@echo "      TARGETS:"
	@echo "         help       : Help menu"
	@echo "         install    : Install components"
	@echo "         uninstall  : Uninstall components"
	@echo "         status     : Current status"
	@echo ""
	@echo "      COMPONENTS:"
	@echo "         mpsfolders : default dotfiles and home folders"
	@echo "         skeleton   : template files"
	@echo "         vim        : vim + neovim + config + plugins"
	@echo ""
	@echo "  Example: make DISTRO=debian INST="vim mpsfolders" install"
	@echo ""
# # +++++ Targets +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
install: distrotest upgrade
	$(call doJobs,$@)
uninstall: distrotest upgrade
	$(call doJobs,$@)
status:
	$(call doJobs,$@)
docker-clean: distrotest
	-docker container rm mps-min-$(MKEXT)
	-docker rmi $(docker images -a -f 'dangling=true' -q)
	-docker rmi mps-min-$(MKEXT)
docker-build: distrotest docker-clean
	docker build -t mps-min-$(MKEXT) . -f Dockerfile.$(MKEXT)
	docker create --name mps-min-$(MKEXT) mps-min-$(MKEXT)
docker-stop: distrotest
	-docker container stop mps-min-$(MKEXT)
docker-start: distrotest docker-stop docker-build
	-docker container rm mps-min-$(MKEXT)
	docker run -it --name mps-min-$(MKEXT) mps-min-$(MKEXT)	
