# -*- Makefile for bash config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>


UNAME=$(shell uname)
SYS_BIN=/usr/local/bin
PWD_BIN=${PWD}/bin

# Include the profile, which has important variables
include paths
include ../variables.makefile


.PHONY: all
minimal: environment python-env completion
all: environment completion sys_bin usr_bin brew python haskell bashup gcc

.PHONY: environment
environment: ${USR_SCRIPT}
	@echo "Setting up system environment"

	@${COPY} "${PWD}/inputrc" "${HOME}/.inputrc"
	@${COPY} "${PWD}/editrc" "${HOME}/.editrc"

	@${COPY} "${PWD}/profile" "${HOME}/.profile"
	@${COPY} "${PWD}/paths" "${HOME}/.paths"
	@${COPY} "${PWD}/bashrc" "${HOME}/.bashrc"
	@${COPY} "${PWD}/bash_logout" "${HOME}/.bash_logout"
	@${COPY} "${PWD}/bash_profile" "${HOME}/.bash_profile"
	@${COPY} "${PWD}/bash_helpers" "${HOME}/.bash_helpers"
	@${COPY} "${PWD}/bash_aliases" "${HOME}/.bash_aliases"

ifeq ($(UNAME),Darwin)
	@chflags hidden ${USR_SCRIPT}
endif

	@mkdir -p ${MARKPATH}
	@mkdir -p ${USR_BIN}
	@mkdir -p ${USR_LIB}
	@mkdir -p ${PROJECT_HOME}

	@${COPY} "${PWD}/jump.bash" "${USR_SCRIPT}/jump.bash"
	@${COPY} "${PWD}/copy.bash" "${USR_SCRIPT}/copy.bash"
	@${COPY} "${PWD}/pauser.bash" "${USR_SCRIPT}/pauser.bash"
	@${COPY} "${PWD}/alias_completion.bash" "${USR_SCRIPT}/alias_completion.bash"
	@${COPY} "${PWD}/mac_switch_user.bash" "${USR_SCRIPT}/mac_switch_user.bash"
	@CP=cp CPI="${CP} -i" ${COPY} "${PWD}/pauser_template.bash" "${USR_SCRIPT}/pauser.custom.bash"


##########################
# User folder structure
${USR_SCRIPT}:
	@mkdir -p ${USR_SCRIPT}



########################
# Completions


# Extra work
PRE_COMP_DEPS=${HOME}/.bash_completion

include ../completion.makefile

# %.complete.bash: FORCE
# 	@${COPY} "${COMP_ADD_DIR}/$@" "${COMP_DIR}/$@"

${HOME}/.bash_completion: ${PWD}/bash_completion.bash
	@${COPY} $? $@ || true




#######################

.PHONY: sys_bin
sys_bin: sys_bin-main sys_bin-extra


.PHONY: sys_bin-main
sys_bin-main: CP=cp
sys_bin-main: CPI=cp -i
sys_bin-main:
	@echo "Copying system binaries to ${SYS_BIN}"
	sudo -v

ifeq ($(UNAME),Darwin)
	@sudo ${COPY} "${PWD_BIN}/as" "${SYS_BIN}/"
	@sudo ${COPY} "${PWD_BIN}/changeInput" "${SYS_BIN}/"
endif

	@sudo ${COPY} "${PWD_BIN}/ask" "${SYS_BIN}/"
	@sudo ${COPY} "${PWD_BIN}/cputhrottle" "${SYS_BIN}/"
	@sudo ${COPY} "${PWD_BIN}/sitedown" "${SYS_BIN}/"
	@sudo ${COPY} "${PWD_BIN}/try" "${SYS_BIN}/"


.PHONY: sys_bin-extra
sys_bin-extra: CP=cp
sys_bin-extra: CPI=cp -i
sys_bin-extra:
	@sudo ${COPY} "${PWD_BIN}/album_art" "${SYS_BIN}/"


.PHONY: usr_bin
usr_bin:
	@echo "Copying user binaries to ${USR_BIN}"

ifeq ($(UNAME),Darwin)
	@${COPY} "${PWD_BIN}/itunes.sh" "${USR_BIN}/itunes"
endif


.PHONY: python
python: python-env python-main python-extra

.PHONY: python-main
python-main: CP=cp
python-main: CPI=cp -i
python-main:
	@echo "Python Setup"

	# Adds to the python path so we can install in a user directory
	@#if [[ "$$(grep --count 'CUSTOM-GLOBAL-PYTHONPATH' /etc/profile)" -eq 1 ]]; then \
		if [[ "$$(grep --count 'CUSTOM-GLOBAL-PYTHONPATH-v1.1' /etc/profile)" -eq 0 ]]; then \
			>&2 echo "/etc/profile was already edited, but with an old version of CUSTOM-GLOBAL-PYTHONPATH, remove the old version"; \
			exit 1; \
		fi \
	else \
		cat python_profile | sudo tee -a /etc/profile >/dev/null; \
	fi

	@#sudo ${COPY} "pydistutils.cfg" "/Library/Python/2.7/site-packages/"

	@# Fixes the profile not being reloaded, and a python warning appearing
	@sudo -H -i easy_install pip
	@sudo ${COPY} ${PWD_BIN}/syspip ${SYS_BIN}/

	@syspip install virtualenv
	@syspip install virtualenvwrapper --ignore-installed six

.PHONY: python-env
python-env:
	@${COPY} "${PWD}/python_startup.py" "${USR_SCRIPT}/"


.PHONY: python-extra
python-extra: CP=cp
python-extra: CPI=cp -i
python-extra:
	@sysip install request
	@syspip install eyeD3

	# Imaging Library (PIL fork)
	@syspip install pillow

	# Audio library
	# @syspip install mutagen

	# Networking
	@syspip install bottle




#######################
# Haskell

.PHONY: haskell
haskell: haskell-env

# Config folder for haskell
${HOME}/.ghc/:
	@mkdir -p $@


.PHONY: haskell-main
haskell-main:
	@echo "Haskell Setup"

	@brew cask install haskell-platform
	@cabal install hlint --global


.PHONY: haskell-env
haskell-env: ${HOME}/.ghc/
	@mkdir -p "${HOME}/.ghc"
	@${COPY} "${PWD}/haskell-ghci.conf" "${HOME}/.ghc/"



#######################



ifeq ($(UNAME),Darwin)
.PHONY: brew
brew: brew-install brew-helpers brew-cmd brew-coding brew-sys-monit brew-net brew-media

.PHONY: brew-install
brew-install:
	@./install_brew.bash

# Brew Helpers
.PHONY: brew-helpers
brew-helpers:
	@brew install cask

# Simple Bash Commands
.PHONY: brew-cmd
brew-cmd:
	@brew install bash-completion
	@brew install ack
	@brew install rename
	@brew install watch

.PHONY: brew-gnu
OPTS=--with-default-names
brew-gnu:
	@brew install coreutils ${OPTS}
	# @brew install findutils ${OPTS}
	# @brew install gnu-sed ${OPTS}
	@brew install gawk ${OPTS}
	# @brew install grep ${OPTS}

	@brew install gnu-which


# Common things used for coding (languages)
.PHONY: brew-coding
brew-coding:
	@brew install go
	@brew install mongodb
	@brew install python3

# System Monitoring
.PHONY: brew-sys-monit
brew-sys-monit:
	@brew install stress
	@brew install blueutil

# Network
.PHONY: brew-net
brew-net:
	@brew install openssl
	brew link --force openssl
	@brew install wget
	@brew install ssh-copy-id
	@brew install nmap


.PHONY: brew-media
brew-media: brew-sound brew-video brew-image

# Sound editing
.PHONY: brew-sound
brew-sound:
	@brew install sox --with-lame
	@brew install lame
	@brew install sox

# Video Editing
.PHONY: brew-video
brew-video:
	@brew install ffmpeg --with-fdk-aac

# Image Editing
.PHONY: brew-image
brew-image:
	@brew install imagemagick

else
brew brew-%:
	@:
endif

# 	brew tap homebrew/dupes

# 	brew install readline
# 	brew link --force readline


# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf



.PHONY: gcc
gcc:
ifeq ($(shell uname),Darwin)
	@xcode-select --install
else
	@echo  2>&1 'Warning: gcc not installed'
endif

.PHONY: bashup
bashup: brew-install
	@echo 'This will change system files'
	@if [ "${FORCE}" == "true" ] || ./bin/ask 'Update Bash?' ; then\
		./bash_update.sh; \
	fi

# Resets the files that get linked for relinking
.PHONY: reset
reset: reset-environment reset-completion

.PHONY: reset-environment
reset-environment:
	@rm -i ${HOME}/.inputrc || true
	@rm -i ${HOME}/.editrc || true

	@rm -i ${HOME}/.profile || true
	@rm -i ${HOME}/.paths || true
	@rm -i ${HOME}/.bashrc || true
	@rm -i ${HOME}/.bash_logout || true
	@rm -i ${HOME}/.bash_profile || true
	@rm -i ${HOME}/.bash_helpers || true
	@rm -i ${HOME}/.bash_aliases || true

	@rm -i ${USR_SCRIPT}/jump.bash || true
	@rm -i ${USR_SCRIPT}/pauser.bash || true
	@rm -i ${USR_SCRIPT}/alias_completion.bash || true
	@rm -i ${USR_SCRIPT}/mac_switch_user.bash || true

	@rm -i ${USR_SCRIPT}/python_startup.py || true






