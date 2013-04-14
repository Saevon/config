#!/bin/bash

global="git config --global"

${global} user.name "Serghei Filippov"
${global} user.email "blastowind@gmail.com"

${global} core.editor "vim"
${global} bash.showDirtyState "1"
${global} merge.tool "opendiff"
