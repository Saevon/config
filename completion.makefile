# -*- Makefile for completion files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

COMP_DIR=${HOME}/.bash_completion.d
COMPLETIONS=$(wildcard *.complete.bash)

TOP := $(dir $(lastword $(MAKEFILE_LIST)))


# if [ "${HOME}/.bash_completion.d/git.complete.bash" -ef "git.complete.bash" ]; then echo '!!'; fi

.PHONY: FORCE
FORCE:

.PHONY: completion
completion: ${COMP_DIR} ${COMPLETIONS}

%.complete.bash: FORCE
	@${TOP}/cpi.bash "${PWD}/$@" "${COMP_DIR}/$@"

${COMP_DIR}:
	@mkdir -p $@
