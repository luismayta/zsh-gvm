#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install gvm for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

function install_gvm {
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
}

function load_gvm {
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
}

load_gvm

if (( ! $+commands["gvm"] )); then
    install_gvm
fi
