#!/usr/bin/env bash

which -s brew
if [[ $? == 1 ]]; then
    ruby -e "$(curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install')"
fi
