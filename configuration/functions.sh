#! /bin/bash


# **********************************
# helpers
# **********************************
function log() {
    echo "[*] $1"
}

function error() {
    echo "[!] $1"
    # echo "[!] $1" | tee -a error.log
}

# cheeky way to make an alias
ai='apt-get install -y'

# **********************************
# individual tasks
# **********************************
function install-etcher() {
    echo "install etcher"
}

function install-react-native() {
    echo "install react native stuff"
}

function install-chromium() {
    echo "install chrome"
    $ai chromium-browser
}

# function install-chrome() {
#     apt install google-chrome-stable
# }

function install-firefox() {
    echo "Install firefox"
    $ai firefox
}

function install-opera() {
    echo "install opera"
    $ai opera-stable
}


function install-vscode() {
    # Extensions:
    #   - eamodio.gitlens
    #   - ms-vscode.go
    #   - ms-python.python
    #   - mechatroner.rainbow-csv
    #   - oderwat.indent-rainbow
    #   - coenraads.bracket-pair-colorizer
    #   - timonwong.shellcheck
    #   - wayou.vscode-todo-highlight
    echo "install vsscode"
}

function install-virtualbox() {
    echo "install install-virtualbox"
}

function install-spotify() {
    echo "install spotify"
}

function install-go() {
    echo "setup go"
}

function install-python() {
    echo "setup pyenv & pipenv"

    # install any global pip tools (i.e. aws cli)
}

function install-node() {
    echo "setup NVM"
}

function install-vpn() {
    echo "install vpn stuff"
}

function install-dev-packages() {
    #   shellcheck - to make us not suck at Bash -  in future look into https://github.com/mvdan/sh shell formatters
    #   grip - markdown preview
    #   httpie - better than curl
    #   autojump - quickly move around command line
    echo "install misc "
    # TODO: set these up as arrays, so we can run tests against it easily?  a simple command -v would suffice
    $ai shellcheck \
        grip \
        vim \
        git \
        httpie \
        autojump
}

function install-misc-packages() {
    #   meld - file comparison
    #   okular - for pdf viewing
    #   fdupes/fslint - clear duplicate files
    echo "misc packages"
    $ai meld \
        okular \
        fdupes \
        fslint \
        rdesktop \
        kdeconnect \
        gwenview \
        libreoffice

}

function remove-default-packages() {
    echo "remove default packages"
}

# make sure all necessary tools & whatnot are setup
function setup() {
    echo "setup"
    apt-get update && apt-get -y upgrade
}

# ****************************************************
# ****************************************************
# Main
# ****************************************************
# ****************************************************
function main() {
    log "Here we go!!"
    setup

# browsers
    install-chrome
    install-firefox
    install-opera

# dev stuff
    install-python
    install-node
    install-go
    install-react-native
    install-dev-packages

# misc
    install-spotify
    install-virtualbox
    install-vpn
    install-etcher
    install-misc-packages
}
