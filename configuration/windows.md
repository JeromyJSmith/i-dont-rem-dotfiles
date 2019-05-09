# Windows Setup

- First, make sure we can use the USB adapter to get WiFi.  Find the USB device in 'Device Manager'.
    Currently called 'Remote Download Wireless Adapter'. After double-clicking, run 'Update Driver..' and 'Search Automatically'. 
    Upon completion it should reboot and need to be connected to the local network.

- Now enable remote access so that we can do everything from here over a remote connection.
    - In 'Settings' find 'Remote Desktop'.  Enable it.  https://www.itworld.com/article/2988289/linux/how-to-install-and-use-rdesktop-the-remote-desktop-client-for-linux.html

- Disable the popups asking if you really want to run an executable.
    - https://articulate.com/support/article/how-to-turn-user-account-control-on-or-off-in-windows-10

- Acquire status bars & tools for system load https://github.com/ArcadeRenegade/SidebarDiagnostics.

- Delete some of the crappy apps like Candy Crush that are preloaded.
    - TODO: find a more automated way to do this so we don't waste time manually ripping them out.

- Setup browsers to match our regular extensions & privacy settings.

- Some inspiration: https://daverupert.com/2018/04/developing-on-windows-with-wsl-and-visual-studio-code/

- Intstall Windows subsystem for Linux
  - Since this is Linux, follow many of the normal steps from the functions file, especially installing `nvm`, `goenv`, and `pyenv`.

- Setup up Docker for Windows with the Linux subsystem
  - https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
  - Chose to go with Docker For Windows, despite not allowing other VMs, cuz we already have a Linux laptop & the Windows Bash Subsytem
  - When setting resources, keep in mind it acts like a VM so if you give it 6 GB of RAM, it will sequester that for it's own use; not take as needed.

- Hover activation of windows, `Control Panel-> Ease of Access Center-> Make the mouse easier to use`. Select `activate a window by hover...`

- Disable system beep (the annoying chime when tab completing in terminal), destroy the 'Message Nudge' and the 'Default Beep'.  Ended up needing to set stuff
    in `~/.inputrc` and also `~/.vimrc` and then opening a new terminal to get rid of the fucking noise.  Google will hopefully have a better solution than that later.

Software:
    - Firefox
    - Steam
    - Corona
    - Docker
    - Windows Ubuntu/Bash Subsystem
    - OWASP ZAP
        - Java 8+ (Make sure to download correct version of Java, there is a web only version that is tricky)
    - Wireshark


