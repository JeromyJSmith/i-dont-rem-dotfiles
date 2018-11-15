#! /bin/bash


# **********************************
# helpers
# **********************************
function add_to_sources() {
    repo=$1
    filename=$2
    echo "$repo" >> /etc/apt/sources.list.d/"$filename".list
}

function ilog() {
    log "installing $1..."
}

function log() {
    echo "[*] $1"
}

function error() {
    echo "[!] $1"
    # echo "[!] $1" | tee -a error.log
}

# cheeky way to make an alias
ai='apt-get install -y'
ar='apt-get remove -y'
# TODO: find out why snaps are causing kernel panics
si='snap install'
update='apt-get update'

# **********************************
# individual tasks
# **********************************
# @root
function install-etcher() {
    # https://github.com/balena-io/etcher
    # TODO: check again in a bit, looks like issue on their end
    ilog "Etcher"
    add_to_sources "deb https://deb.etcher.io stable etcher" etcher
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
    $update
    apt-get install etcher-electron
}

# @root
function install-arduino() {
    ilog "Arduino"
    $ai libcanberra-gtk-module \
        arduino
}

# @root
function install-dropbox() {
    ilog "Dropbox"
}

# @root
function install-react-native() {
    echo "install react native stuff"
}

# @root
function install-chromium() {
    ilog "Chromium"
    # $ai chromium-browser
    $si chromium
}

# @root
# function install-chrome() {
#     apt install google-chrome-stable
# }

# @root
function install-firefox() {
    ilog "Firefox"
    $ai firefox
}

# @root
function install-opera() {
    ilog "Opera"
    # $ai opera-stable
    $si opera
}

# @root
function install-vscode() {
    # process borrowed from https://github.com/gantsign/ansible-role-visual-studio-code/blob/master/tasks/install-apt.yml
    # Extensions:
    #   - eamodio.gitlens
    #   - ms-vscode.go
    #   - ms-python.python
    #   - mechatroner.rainbow-csv
    #   - oderwat.indent-rainbow
    #   - coenraads.bracket-pair-colorizer
    #   - timonwong.shellcheck
    #   - wayou.vscode-todo-highlight
    ilog "vscode"
    $si vscode --classic
    #$ai gconf2 libasound2 libgtk2.0-0 libxss1
    # add_to_sources "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" vscode
    # $(curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg)
    # apt-key add microsoft.gpg
    # $update
    # $ai code

    # vsfile=vscode.deb
    # wget -O "$vsfile" https://go.microsoft.com/fwlink/?LinkID=760868
    # dpkg -i "$vsfile"
    # $ai install -f
    # rm "$vsfile"
}

# @user
function finish-vscode() {
    str_extensions="eamodio.gitlens,\
ms-vscode.go,\
ms-python.python,\
mechatroner.rainbow-csv,\
oderwat.indent-rainbow,\
coenraads.bracket-pair-colorizer,\
timonwong.shellcheck,\
wayout.vscode-todo-highlight,\
minhthai.vscode-todo-parser"
    IFS=, read -r -a extensions <<< "$str_extensions"
    for ext in "${extensions[@]}"; do
        ilog "vscode extension $ext"
        code --log info --install-extension --force "$ext"
    done
}

# @root
function install-virtualbox() {
    ilog "Virtualbox"
    $ai virtualbox
    $update
    $ai dkms
}

# @root 
function install-vagrant() {
    ilog "Vagrant"
}

# @root
function install-docker() {
    ilog "Docker"
}

# @root
function install-spotify() {
    ilog "Spotify"
    $si spotify
}

# @root
function install-slack() {
    ilog "Slack"
    $si
}

# @root
function install-go() {
    # https://www.digitalocean.com/community/tutorials/how-to-install-go-on-ubuntu-18-04
    ilog "Go"
    # Can either use package version or from releases page to be more up to date
    $ai golang-go
    # setup Go env variables
}

# @root
function install-python() {
    ilog "Python"
    # install pyenv
    # install pipenv
}

# @user
function finish-python() {
    log "Finish Python setup"
    # install any global pip tools (i.e. aws cli)
}

# @root
function install-node() {
    ilog "Node"
    # https://github.com/creationix/nvm
    # install nvm
    # install a newish version of node
}

# @root
function install-java() {
    ilog "Java"
    # for the occasional time it is useful and learning other JVM languages
}

# @root
function install-vpn() {
    ilog "Wisc VPN"
    $ai openconnect \
        network-manager-openconnect \
        network-manager-openconnect-gnome
}

# @root
function install-dev-packages() {
    #   shelcheck - to make us not suck at Bash -  in future look into https://github.com/mvdan/sh formatters
    #   grip - markdown preview
    #   httpie - better than curl
    #   autojump - quickly move around command line
    #   yakuake - best tool ever, drop down command line
    #   zenity - graphical dialog boxes for shell scripts
    #   libncurses - for interesting graphical curses stuff
    ilog "Dev packages"
    # TODO: set these up as arrays, so we can run tests against it easily?  a simple command -v would suffice
    $ai shellcheck \
        grip \
        vim \
        git \
        tmux \
        httpie \
        autojump \
        yakuake \
        strace \
        nmap \
        tcpdump \
        zenity \
        libncurses5-dev \
        libncursesw5-dev

}

# @root
function install-timeshift() {
    # https://itsfoss.com/backup-restore-linux-timeshift/
    ilog "Timeshift"
    apt-add-repository 'ppa:teejee2008/ppa'
    $update
    $ai timeshift
}

# @root
function install-misc-packages() {
    #   meld - file comparison
    #   okular - for pdf viewing
    #   fdupes/fslint - clear duplicate files
    #   cowsay/figlet/sl - fun
    #   zip,etc. - getting everything extracted
    #   ncdu - understand where space is
    #   wunderlisttux - desktop version of app we use
    #   recordmydesktop - captures video of a linux session
    ilog "Misc packages"
    $ai meld \
        okular \
        fdupes \
        fslint \
        rdesktop \
        kdeconnect \
        gwenview \
        libreoffice \
        wget \
        curl \
        cowsay \
        figlet \
        sl \
        ncdu \
        less \
        zip unzip tar rar unrar p7zip p7zip-full \
        make \
        gparted \
        wunderlisttux \
        recordmydesktop



}

# @root
function remove-default-packages() {
    log "remove default packages"
    # mostly games & unused software
    $ar aisleriot \
        gnome-accessibility-themes \
        gnome-online-accounts \
        gnome-calendar \
        gnome-contacts \
        gnome-documents \
        gnome-mines \
        gnome-mahjongg \
        gnome-maps \
        gnome-music \
        gnome-orca \
        gnome-photos \
        gnome-sudoku \
        gnome-weather \
        kwalletmanager \
        libpam-kwallet5 \
        rhythmbox \
        rhythmbox-data \
        rhythmbox-plugin-magnatune \
        rhythmbox-plugin-zeitgeist \
        rhythmbox-plugins \
        kmail 
}

# @root
# make sure all necessary tools & whatnot are setup
# TODO: make sure Dockerfile and this setup have the same contents
function setup() {
    log "SETUP"
    $update && apt-get -y upgrade
    # setup for snap installation
    # - for 18.04, already installed and ready to go on real machine but not Docker image
    $ai snapd build-essential apt-transport-https net-tools
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
