# -*- makefile to copy over config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>


.PHONY: help
help:
	@echo "Saevon's Config Files:"
	@echo "  This creates symbolic links to this folder's config files"
	@echo "  For the current user (using the $HOME variable, so change that"
	@echo "  if you wish to install for another user)"
	@echo ""
	@echo "Config Files:"
	@echo "  django"
	@echo "  vim"



# A list of all valid config file types, each one should correspond to a folder
# here, or a custom make command in this file
VALID="django vim"

.PHONY: all
all: ${VALID}

# Wrapper around any config type creation, moves to the corresponding folder
# and runs the makefile there
%:
	@([[ ${VALID} =~ $@ ]] \
		&& ((cd c$@ && make HOME=${HOME}) || echo "Error while creating config type '$@'") \
		|| echo "Invalid config type: '$@'" \
	)
