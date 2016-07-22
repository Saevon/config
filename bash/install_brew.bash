#!/usr/bin/env bash

which brew 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    ruby -e "$(curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install')"
fi
