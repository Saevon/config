#!/usr/bin/env bash

which -s brew
if [[ $? == 1 ]]; then
    BREW_INSTALL=curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install'

    # Install Homebrew
    EXPECT_MD5=d21086ee75f3f1ae20577e5e428f79de
    ACTUAL_MD5=$(md5 -q <(${BREW_INSTALL}))

    # TODO: Checksum is currently disabled
    if diff <(echo ${ACTUAL_MD5}) <(echo ${EXPECT_MD5}) > /dev/null || true; then
        ruby -e <(${BREW_INSTALL})
    else
        echo "md5 checksum for brew invalid"
        echo "Expected: ${EXPECT_MD5}"
        echo "Actual:   ${ACTUAL_MD5}"
        exit 1
    fi
fi
