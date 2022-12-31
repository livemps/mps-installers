# +++++ Configuration +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- Makefile Setup ---#
default: help
.PHONY: default help bootstrap clean status
# --- Makefile Paths ---#
mkfile_path   := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_folder := $(dir     $(mkfile_path))
# --- MPS Config ---#
MPS_BIN  :=/usr/local/bin/mps
MPS_HOME :=~/mps
MPS_REPO :=$(mkfile_folder)
# +++++ Other +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- MPS Help ---#
help:
	@echo ""
	@echo "Usage: "
	@echo ""
	@echo "  make TARGET"
	@echo ""
	@echo "      TARGETS:"
	@echo "         help      : Help menu"
	@echo "         bootstrap : Install components"
	@echo "         clean     : Uninstall components"
	@echo "         status    : Current status"
	@echo ""
# +++++ Bootstrapping +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# --- MPS Executable script ---#
$(MPS_BIN):
	@echo "mkFile Folder   : $(mkfile_folder)"
	@echo "mkFile Absolute : $(mkfile_path)"
	@echo "Install dir     : $(dir $(MPS_BIN))"
	@echo '#!/bin/bash' 					| sudo tee $(MPS_BIN)
	@echo "export MPS_HOME="$(MPS_HOME) 	| sudo tee -a $(MPS_BIN)
	@echo "export MPS_REPO="$(MPS_REPO) 	| sudo tee -a $(MPS_BIN)
	@echo 'cd $$MPS_REPO' 					| sudo tee -a $(MPS_BIN)
	@echo 'make --no-print-directory $$*' 	| sudo tee -a $(MPS_BIN)
	@sudo chmod a+x $(MPS_BIN)
	@mps help
bootstrap: clean $(MPS_BIN)
clean:
	@if [ -f $(MPS_BIN) ] ; then \
		sudo rm -rf $(MPS_BIN) ; \
	fi
status:
	@if [ -f $(MPS_BIN) ] ; then \
		echo "Ready" ; \
	else \
		echo "Error" ; \
	fi
