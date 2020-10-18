
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # -F adds asterik to executable files
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
alias diskspace='df -P -khl'
alias fstypes='df -Th'
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
  mkdir -p -- "$1"
  cd "$1"
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
# Put asterik on executable files
alias ld='ls -ld .??*'
alias llh='ls -lh'
alias lls='ls -ls'
alias lsh='ls -sh'
alias ll='ls -al'
alias la='ls -A'
alias l='ls -C'
nullify () {
    "$@" >& /dev/null
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
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias mergepush='git checkout master; git merge develop; git push; git checkout develop'

#==========================================================
# No Obvious Group (Yet)
#==========================================================
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
#TODO
# which vs whereis, which is better but needs easier to remember name
# https://github.com/paulirish/dotfiles/blob/master/.aliases
# When sudo can't find command
alias lostsudo='sudo -E env "PATH=$PATH"#'
alias viewtar='echo "**Use less if you need searching **" && tar -tvf'
alias v='vim'
alias wtfismyip='curl https://wtfismyip.com/json'
alias weather='curl wttr.in'
alias myip='curl https://wtfismyip.com/json'
featurebranch() {
    name=$1
    [ -z "$name" ] && return 1
    git checkout master && git pull && git checkout -b "${name}"
}


# Happybara
alias slsdev='sls --aws-profile happybara-dev'
alias slsprod='sls --aws-profile happybara-prod'
alias slspp='sls --aws-profile happybara-prod --stage prod'
alias fb='git checkout feature/base'

fdeploy() {
    dir=$1
    func=${2:-main}
    echo "[*] building $dir-$func"
    (cd $dir && slsdev deploy function -f $func)
}

