#! /bin/bash
# check personal site status codes every x number of minutes,
# sends me an email (just one!) of the logged info.

# check status codes
# log checks in file

RETURN_CODE=$(/usr/bin/curl -Isf whatisthis.space | /usr/bin/head -n 1)
NOW=$(/bin/date +"%c")
/bin/echo "Status on $NOW: $RETURN_CODE" >> /home/idontremember/Documents/dev/scripts/bash/site.log
/usr/bin/notify-send -t 1000 "Site check logged"
DAY=$(/bin/date +%A) # full weekday name
TIME=$(/bin/date +%R) # hour from 00..23 and min from 00..59

# if a certain time block on specified day, check top of log file message
FILE=/home/idontremember/Documents/dev/scripts/bash/site.log
LINE=$(/usr/bin/head -n 1 $FILE)


if [[ (($DAY == 'Friday') && (($TIME > 1200) && ($TIME < 1900)))  ]]; then 
  if [ $LINE != $(/bin/date +%b%d) ]; then
     /bin/cat $FILE | /usr/bin/mail -s "Site Log" quinn618@gmail.com
     # email sent, clear file, and update file header to curr day
     /bin/echo "$(/bin/date +%b%d)" > $FILE
  fi
fi
