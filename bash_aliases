#=======================================================
# Aliases
#=======================================================
alias showaliases="cat $HOME/.bash_aliases"
alias editaliases="vim $HOME/.bash_aliases"

#show ports
alias ports="netstat -tulanp"

# disk usage current directory
alias dirusage="du -ch | grep total"

# total disk usage
alias totalusage="df -hl --total | grep total"


alias mktarbz2="tar -jcvf"
alias mktargz="tar -zcvf"
# Find and run bing search script from history
#alias bingsearch="history | grep -e '^.[0-9]*...\/Documents.*\/search\/search.py$' -m 1"

alias diskspace='df -P -kHl'
alias cl='clear'
alias v='vim'
alias histg='history | grep'
alias ex='exit'
alias xopen='xdg-open'
alias glog='git log --oneline'
alias gstat='git status'
alias patchadd='git add --patch'
alias ..='cd ..'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias status='sudo systemctl status'
alias sudoprev='sudo $(history -p !!)'
#==========================================================
# Functions
#=========================================================

# mkdir then cd into it
mkcd() {
  mkdir $1
  cd $1
}

# performs cd and ls together
cs() {
  cd "$@" && ls
}

buildserve() {
  bundle exec jekyll build && bundle exec jekyll serve
}

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}
# find the common extract function online, super useful

