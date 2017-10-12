#=======================================================
# Aliases file
#=======================================================
alias showaliases="less $HOME/.bash_aliases"
alias editaliases="vim $HOME/.bash_aliases"
alias reload_profile="source ~/.bashrc"

#=======================================================
# Services/ System info
#=======================================================
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias status='sudo systemctl status'
alias restart='sudo systemctl restart'
alias reload='sudo systemctl reload'
alias reload-or-restart='sudo systemctl reload-or-restart'
alias boot-enable='sudo systemctl enable'
alias boot-disable='sudo systemctl disable'
alias is-enabled='sudo sytemctl is-enabled'
alias is-active='sudo systemctl is-active'

alias diskspace='df -P -kHl'
alias rootdiskspace='sudo du -hsx /* | sort -rh | head -n 40'
alias ports="netstat -tulanp"
alias dirusage="du -ch | grep total"
alias totalusage="df -hl --total | grep total"
alias showpermssions='find . -maxdepth 1 -printf "%m:%f\n"'

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
alias mktarbz2="tar -jcvf"
alias mktargz="tar -zcvf"

extract() {
  echo 'This would be nice to have'
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
#==========================================================
# Virtualenv
#==========================================================
startenv() {
  . $1/bin/activate
}

#==========================================================
# Git
#==========================================================
alias glog='git log --oneline'
alias gstat='git status'
alias gpatchadd='git add --patch'
alias gdiff-staged='git diff --cached'
alias gdif='git diff'
alias gcpk='git cherry-pick'

#==========================================================
# No Obvious Group (Yet)
#==========================================================
buildserve() {
  bundle exec jekyll build && bundle exec jekyll serve
}

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

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
