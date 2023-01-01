# +++++ Configuration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Makefile Setup ---#
default: install
.PHONY: default help install uninstall status usertest distrotest
# +++++ Environment checks ++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Early Shells 
DISTROTEST_DEBIAN 	:= $(shell lsb_release -is)
DISTROTEST_ARCH 	:= $(shell lsb_release -is)
LOGFILE				:=error.log
define printTask
	@echo -n $(2)
	@RET=$(shell make --no-print-directory -f Makefile.$(MKEXT) $(1)) \
			1>$(LOGFILE) 2>$(LOGFILE) ; echo $$?) ; \
		if [ $$RET -eq 0 ] ; then \
			echo $(3) ; \
		else \
			echo $(4) ; \
			cat $(LOGFILE) ; \
		fi
endef

# --- Check Distro (Auto)
ifeq ($(DISTROTEST_ARCH),Arch)
	MKEXT :=arch
else ifeq ($(DISTROTEST_DEBIAN),Debian)
	MKEXT :=debian
else
	MKEXT :=none
endif
# --- Test distro
distrotest:
ifeq ($(MKEXT),none)
	$(error DISTRO not found and auto detection failed!)
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
# # +++++ Targets +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
install: distrotest
	$(call printTask,$@,"Installing...","Done!","Error!")
uninstall: distrotest
	@echo -n "Removing..."
	@RET=$(shell make --no-print-directory -f Makefile.$(MKEXT) uninstall \
			1>$(LOGFILE) 2>$(LOGFILE) ; echo $$?) ; \
		if [ $$RET -eq 0 ] ; then \
			echo "Done!" ; \
		else \
			echo "Error!" ; \
			cat $$LOGFILE ; \
		fi
status: distrotest
	@echo -n "Status: "
	@RET=$(shell make --no-print-directory -f Makefile.$(MKEXT) status \
			1>$(LOGFILE) 2>$(LOGFILE) ; echo $$?) ; \
		if [ $$RET -eq 0 ] ; then \
			echo "OK!" ; \
		else \
			echo "Error!" ; \
			cat $$LOGFILE ; \
		fi
