# -*- Makefile for copying with links -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

CP ?= ln -s
CPI ?= ${CP} -i

export CP
export CPI

TOP := $(dir $(lastword $(MAKEFILE_LIST)))

COPY = ${TOP}/cpi.bash
export COPY

