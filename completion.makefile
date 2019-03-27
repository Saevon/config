# -*- Makefile for completion files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

TOP := $(dir $(lastword $(MAKEFILE_LIST)))

COMP_DIR ?= ${HOME}/.bash_completion.d
# COMPLETIONS ?= $(wildcard *.complete.bash)
COMPLETIONS ?= $(shell find ${PWD} -iname "*.complete.bash")
RESET_COMPLETIONS ?= $(shell find ${PWD} -iname "*.complete.bash" -exec basename {} \; )




# if [ "${HOME}/.bash_completion.d/git.complete.bash" -ef "git.complete.bash" ]; then echo '!!'; fi

.PHONY: FORCE
FORCE:

################
# Cleanup

.PHONY: reset-completion
reset-completion: ${PRE_COMP_RESET_DEP} $(addprefix REMOVE--,${RESET_COMPLETIONS}) ${POST_COMP_RESET_DEP}
	@# Remove the completion directory if its empty too
	@if [ $(find ${COMP_DIR} -maxdepth 0 -type d -empty) ]; then \
		rmdir ${COMP_DIR}; \
		rm ${HOME}/.bash_completion; \
	fi

REMOVE--%.complete.bash: FORCE
	@RM_FILE=${COMP_DIR}/$(@:REMOVE--%=%); \
	if [[ -f $${RM_FILE} || -L $${RM_FILE} ]]; then \
		rm -i $${RM_FILE} || true; \
	fi



################
# Setup
.PHONY: completion
completion: ${PRE_COMP_DEP} ${COMP_DIR} ${COMPLETIONS} ${POST_COMP_DEP}

%.complete.bash: FORCE
	@CPI="${CPI}" ${COPY} "$@" "${COMP_DIR}/$$(basename $@)"

${COMP_DIR}:
	@mkdir -p $@
