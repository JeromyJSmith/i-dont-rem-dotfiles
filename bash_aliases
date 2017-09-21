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
alais is-active='sudo systemctl is-active'

alias diskspace='df -P -kHl'
alias rootdiskspace='sudo du -hsx /* | sort -rh | head -n 40'
alias ports="netstat -tulanp"
alias dirusage="du -ch | grep total"
alias totalusage="df -hl --total | grep total"

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
alias mktarbz2="tar -jcvf"
alias mktargz="tar -zcvf"

extract() {
  echo 'This would be nice to have'
}
#=======================================================
# History/ Command line 
#=======================================================
alias cl='clear'
alias histg='history | grep'
alias sudoprev='sudo $(history -p !!)'

#==========================================================
# Git
#==========================================================
alias glog='git log --oneline'
alias gstat='git status'
alias gpatchadd='git add --patch'


#==========================================================
# No Obvious Group (Yet)
#==========================================================
buildserve() {
  bundle exec jekyll build && bundle exec jekyll serve
}

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

alias xopen='xdg-open'

