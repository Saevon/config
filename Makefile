# -*- makefile to copy over config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include variables.makefile

.PHONY: help
help:
	@echo "Saevon's Config Files:"
	@echo "  This creates symbolic links to this folder's config files"
	@echo "  For the current user (using the $$HOME variable, so change that"
	@echo "  if you wish to install for another user)"
	@echo ""
	@echo "Config Files:"
	@echo "  bash"
	@echo "  file-server"
	@echo "  fortunes"
	@echo "  git"
	@echo "  mac"
	@echo "  ssh"
	@echo "  vim"


# A list of all valid config file types, each one should correspond to a folder
# here, or a custom make command in this file
VALID = bash git vim mac fortunes ssh file-server

# A List of all valid commands that undo part/all of what they do
# VALID_RESET=$(addprefix reset-,${VALID})
VALID_RESET = reset-bash reset-git

.PHONY: all ${VALID}
all: ${VALID}

.PHONY: reset ${VALID_RESET}
reset: ${VALID_RESET}
	echo ${VALID_RESET}


# Wrapper around any config type creation, moves to the corresponding folder
# and runs the makefile there
${VALID}:
	@([[ "${VALID}" =~ $@ ]] \
		&& ((cd $@ && make HOME=${HOME}) || echo "Error while creating config type '$@'") \
		|| echo "Invalid config type: '$@'" \
	)

${VALID_RESET}:
	@([[ "${VALID_RESET}" =~ $@ ]] \
		&& ((cd $(@:reset-%=%) && make reset HOME=${HOME}) || echo "Error while resetting config type '$@'") \
		|| echo "Invalid config type: '$@'" \
	)
