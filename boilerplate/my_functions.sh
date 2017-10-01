# Include this in other scripts by either exporting every function (dumb), 
# ORRR source it ( at top of new script '. /path/to/functions')


#usage: consoleLog 'Hello World'
consoleLog() {
  echo '['$(date +'%a %Y-%m-%d %H:%M:%S %z')']' $1
}

#usage:
# echoes the message if $DEBUG_SHELL is 1, if DEBUG_LOG_FILE is defined it uses that
debugLog() {
  if [[ "$DEBUG_SHELL" == "1" ]]; then
    if [[ ! -z "$DEBUG_LOG_FILE"  ]]; then
      echo "$1" >> $DEBUG_LOG_FILE
    else
      echo "$1"
    fi
  fi   
}


#usage: 
#setValue 'Enter something' 'defaultValue'
#VAR=$NEW_VALUE
setValue() {
  read -p "$1 ("$2"): " NEW_VALUE
  if [ -z $NEW_VALUE ]; then
      NEW_VALUE=$2
  fi
}

#usage:
# in_list "10 11 12" "2" or 'in_list "$my_list" "$my_item"'
in_list() {
  list="$1"
  item="$2"
  if [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]] ; then
    # yes, list include item
    result=0
  else
    result=1
  fi
  return $result
}


# Possible additions https://github.com/adamatan/bash-boilerplate/blob/master/boilerplate.sh
