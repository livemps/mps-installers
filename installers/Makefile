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
		echo "# ---- </ $$target > ---" ; \
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
	@echo "         Arch            : Arch Linux"
	@echo "         Debian          : Debian Linux"
	@echo ""
	@echo "      DEFAULT TARGETS:"
	@echo "         help            : Help menu"
	@echo "         install         : Install components"
	@echo "         uninstall       : Uninstall components"
	@echo "         status          : Current status"
	@echo ""
	@echo "      META TARGETS:"
	@echo "         term-min        : (essentials,homedir)"
	@echo "         term-std        : term-min + (fonts vim)"
	@echo "         term-max        : term-std + (texlive)"
	@echo "         dsk-min         : (dsk-x dsk-essentials)"
	@echo "         dsk-std         : dsk-min + (dsk-i3)"
	@echo "         dsk-max         : dsk-std + (dsk-tools)"
	@echo ""
	@echo "      TERMINAL-INSTALLERS:"
	@echo "         term-essentials : curl,wget,zip,etc."
	@echo "         term-homedir    : essential mps folders"
	@echo "         term-fonts      : Some nerdfonts"
	@echo "         term-vim        : vim, neovim"
	@echo ""
	@echo "      DESKTOP-INSTALLERS :"
	@echo "         dsk-essentials  : kitty,pavucontrol,etc."
	@echo "         dsk-i3          : i3 window manager"
	@echo "         dsk-dwm         : dwm window manager"
	@echo "         dsk-tools       : firefox,thunderbird,etc."
	@echo ""
	@echo "  Examples :"
	@echo "    META   : make term-min"
	@echo "    INST   : make INST="term-essentials term-homedir" install"
	@echo "    DISTRO : make DISTRO=Debian INST="term-essentials" install"
	@echo ""
# +++++ Default Targets +++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
install: distrotest upgrade
	$(call doJobs,$@)
uninstall: distrotest upgrade
	$(call doJobs,$@)
status:
	$(call doJobs,$@)
# +++++ Meta Targets ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
term-min: distrotest upgrade
	@make INST="term-essentials term-homedir"
term-std: distrotest upgrade term-min
	@make INST="term-fonts term-vim"
term-max: distrotest upgrade term-std
dsk-min: distrotest upgrade term-min
	@make INST="dsk-x dsk-essentials"
dsk-std: distrotest upgrade dsk-min
	@make INST="dsk-i3 dsk-dwm"
dsk-max: distrotest upgrade dsk-std
	@make INST="dsk-tools"
# +++++ Docker Targets ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
docker-clean: distrotest
	-docker container rm mps-min-$(MKEXT)
	-docker rmi $(docker images -a -f 'dangling=true' -q)
	-docker rmi mps-min-$(MKEXT)
docker-build: distrotest docker-clean
	docker build --force-rm -t mps-min-$(MKEXT) . -f Dockerfile.$(MKEXT)
	docker create --name mps-min-$(MKEXT) mps-min-$(MKEXT)
docker-stop: distrotest
	-docker container stop mps-min-$(MKEXT)
docker-start: distrotest docker-stop docker-build
	-docker container rm mps-min-$(MKEXT)
	docker run -it --name mps-min-$(MKEXT) mps-min-$(MKEXT)

