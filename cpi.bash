#!/usr/bin/env bash

CPI=${CPI:-cp -i}

if [ ! "$1" -ef "$2" ]; then
	${CPI} $1 $2 || true
fi
