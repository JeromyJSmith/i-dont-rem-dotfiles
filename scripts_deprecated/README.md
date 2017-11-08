#PersonalScripts

<p>Directory to keep track of scripts I write for personal use.  At the moment none are automated with crontab, but I hope to think of something helpful that would use such a useful tool soon. </p>
<p>Currently all in bash, learning Python on the side though, so ideas
for fun scripts are starting to roll around in my head.</p>
<h3>Mouse Remapper: mouse.sh</h3>
<p><em>Left button on my wireless mouse stopped working completely, but I haven't gotten around to ordering a new one yet. For now I use xinput to switch the left and right keys functionality and use it with my left hand.<br> 
 Upgrades I'd like to make are to map the two side buttons to something useful,
 and to be able to automate whenever I plug in the dongle it runs.
 (Currently the id keeps changing, so I have to find a way to handle a variable id)</em></p>
<h5>UPDATE: v2 automatically finds the mouse id in the string output by xinput list, rather than having to manually input it</h5>
<br>
<h3>Site Status Check: site-check.sh</h3>
<p><em>Checks the status code of my personal site and logs the answer in a file.
 Set up to email me contents of log file.<br>
Upgrades might be to set it as a cronjob that runs every hour,
 instead of sending the contents of the log file actually parse information from it so email is quicker to evaluate,
 would be nice to either have a section or maybe seperate script that sends immediate notice if site is down.
 </em><p><br>
<h3>Wallpaper changer: wallpaper.sh</h3>
<p><em>Short script that randomly assigns a picture from my personal wallpaper folder. Takes any random file, so not robust if I add other file types besides images, but since it's for my personal machine it isn't a huge deal.</em></p>
<h3>Multi-Tab Searcher: search.py</h3>
<p><em>Opens a new window of chrome, then uses a passed in search engine, number of searches,and a word list to randomly search new words</em></p>
<h4>Ideas List</h4>
<ul>
  <li> Figure out how to fix cron so these scripts run on the schedules I want</li>
  <li>tar backups that remove elderly backups</li>
</ul>
