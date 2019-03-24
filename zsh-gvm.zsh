#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install gvm for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

function install_gvm {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing GVM${CLEAR}"
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    install_go
}

function install_go {
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
    if (( $+commands[gvm] )); then
        echo -e "${CLEAR}${LIGHT_GREEN} Install Go ${CLEAR}"
        gvm install go1.11.4 -B
        gvm use go1.11.4 --default
        echo -e "${CLEAR}${LIGHT_GREEN}Installing required go packages${CLEAR}"
        go get -u github.com/alecthomas/gometalinter && gometalinter --install
        go get -u github.com/onsi/ginkgo/ginkgo
        go get -u github.com/onsi/gomega
        go get -u github.com/nsf/gocode
        go get -u golang.org/x/tools/cmd/goimports
        go get -u github.com/pengwynn/flint
        go get -u github.com/rogpeppe/godef
        go get -u github.com/dougm/goflymake
        # tools
        go get -u github.com/99designs/aws-vault
        go get -u github.com/minamijoyo/myaws/myaws
    fi
}

function load_gvm {
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
}

load_gvm

if (( ! $+commands[gvm] )); then
    install_gvm
fi
