#=======================================================
# Aliases file
#=======================================================
alias showaliases="less $HOME/.bash_aliases"
alias editaliases="vim $HOME/.bash_aliases"
alias reloadrc="source ~/.bashrc"
alias reloadprofile="source ~/.bash_profile"

#=======================================================
# Services/ System info
#=======================================================
# # TODO: Review these since they are rarely used # # # # #
# alias start='sudo systemctl start'
# alias stop='sudo systemctl stop'
# alias status='sudo systemctl status'
# alias restart='sudo systemctl restart'
# alias reload='sudo systemctl reload'
# alias reload-or-restart='sudo systemctl reload-or-restart'
# alias boot-enable='sudo systemctl enable'
# alias boot-disable='sudo systemctl disable'
# alias is-enabled='sudo sytemctl is-enabled'
# alias is-active='sudo systemctl is-active'
# 
# alias python='echo "## alias ##"; python3'
# alias pip='echo "## alias ##"; pip3'
# alias diskspace='df -P -khl'
# alias fstypes='df -Th'
# alias rootdiskspace='sudo du -hsx /* | sort -rh | head -n 40'
# alias ports="netstat -tulanp"
# alias dirusage="du -ch | grep total"
# alias totalusage="df -hl --total | grep total"
# alias showpermssions='find . -maxdepth 1 -printf "%m:%f\n"'
# alias mykde_desktop_dissapeared="killall plasmashell; kstart plasmashell"

#=======================================================
# Movement/ Creation
#=======================================================
cs() {
  cd "$@" && ls
}

mkcd() {
  mkdir $1
  cd $1
}

alias ..='cd ..'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias mktarbz2="tar --owner=root --group=root -jcvf"
alias mktargz="tar --owner=root --group=root -zcvf"

extract() {
 if [ -f $1 ] ; then
         case $1 in
            *.tar.bz2)
                tar xvjf $1
                ;;
            *.tar.gz)
                tar xvzf $1
                ;;
            *tar.xz)
               tar xvf $1
               ;;
           *.tar)
               tar xvf $1
               ;;
           *.tbz2)
               tar xvjf $1
               ;;
           *.tgz)
               tar xvzf $1
               ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                unrar x $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *.7z)
                7z x $1
                ;;
            *.xz)
                unxz $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract"
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Because I'm a dangus
append() {
  cat $1 >> $2
}
#=======================================================
# History/ Command line
#=======================================================
alias cl='clear'
alias histg='history | grep'
alias sudoprev='sudo $(history -p !!)'
alias ld='ls -ld .??*'
alias llh='ls -lh'
alias lls='ls -ls'
alias lsh='ls -sh'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
nullify () {
    "$@" >& /dev/null
}
#==========================================================
# Virtualenv
#==========================================================
startenv() {
  . $1/bin/activate
}

#==========================================================
# Git
#==========================================================
alias g="git"
alias gl='git log --oneline'
alias gs='git status'
alias gpatchadd='git add --patch'
alias gds='git diff --cached'
alias gd='git diff'
alias gcherry='git cherry-pick'
alias scommit='git commit -s'
alias gc='git commit'
alias ga='git add'
alias gb='git branch'


#==========================================================
# No Obvious Group (Yet)
#==========================================================
buildserve() {
  bundle exec jekyll build && bundle exec jekyll serve
}

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

alias npmglobal="npm list -g --depth=0"

# ls, with chmod-like permissions and more.
# @param $1 The directory to ls
function lsp {
  LLS_PATH=$1
  ls -AHl $LLS_PATH | awk "{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/) \
                                *2^(8-i));if(k)printf(\"%0o \",k);print}"
}
alias xopen='xdg-open'
#TODO
# which vs whereis, which is better but needs easier to remember name
# https://github.com/paulirish/dotfiles/blob/master/.aliases
# When sudo can't find command
alias lostsudo='sudo -E env "PATH=$PATH"#'
makepopup() {
  if [ "$1" == "-h" ]; then
	echo "makepopup [ 'the message'] [duration (seconds)]"
  else
    /usr/bin/kdialog --title 'Your message' --passivepopup "$1" "$2"
  fi
}
alias viewtar='echo "**Use less if you need searching **" && tar -tvf'
alias cminicom='minicom -c on'
alias v='vim'
alias cminiusb='minicom -c on -D /dev/ttyUSB0'
alias rundocker='docker run --rm -it'
# ls -F (append indicator to entries)
alias macinfo="system_profiler SPSoftwareDataType"
alias localstack-up="TMPDIR=/private$TMPDIR docker-compose up"
# Alert for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
