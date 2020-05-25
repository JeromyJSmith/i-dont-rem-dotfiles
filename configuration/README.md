# Configuration

The most important utility of this repo is not, in fact, the ability to run once and have everything setup.
It's that tracking this information lets us have the record of what tools we use on a regular basis and
care enough about that we add them to this list, even if the installation fails we can run it manually and be
back on track.

## Windows

For those rare times we need Windows, `windows.md` holds the most important alterations & software we use.

## Laptop (Linux or Mac)

After trying for a while to use Ansible as our configuration management, it has reached a point
where I need to cut my losses and switch over to shell scripts. I've spent too much time fighting
odd errors from my limited understanding of Ansible and running it against localhost, and the whole
point of this was to save time by automation. Shell scripts I have a better understanding of and
know ways to test each piece individually with Docker. This will eventually get merged over into
my dotfiles repo, as it makes the most sense there. This task would be a whole lot easier if Snaps wouldn't cause random reboots/possible kernel panics.

### Organization

All functions are kept in `functions.sh` to consolidate all work and keep root and non-root functions that
make sense together nearby. Functions will be marked with `@root` or `@user`,. Installation can then be conducted
with two scripts, one run as root to setup all inital tools and libraries and the other as user for fine-grained work.

### Usage

Needs both scripts run, so `sudo bash linux-install.sh && post-install.sh`.

### Testing

Run `make build` to generate the Docker image necessary for testing.
Use the Makefile options to run a single function inside a Docker container, `make test-single function=<name>`. Snap is it's own container tool, so it is difficult to test those functions which rely on it. For now, assume the snap to be functioning correctly.


### Potential files

Many of these seem like they make more sense at root of dotfiles than in installation script, but eh.
- gvimrc  
- zshrc  
- vim  
- everything usefulin .config  
- crontab  
- gitconfig  
- gitignore  
- gitattributes  
- need more 'find' aliases/functions
- browser settings?

### Resources

- https://vimawesome.com/
- https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
- https://www.linkedin.com/pulse/20140606085733-79939846-my-bashrc-and-vimrc-files
- https://github.com/amix/vimrc
- https://github.com/briandoll/dotfiles
- https://stackoverflow.com/questions/4009412/how-to-use-arguments-from-previous-command#4010170
- https://www.itworld.com/article/2833199/it-management/3-ways-to-pimp-your-bash-console.html
- https://www.reddit.com/r/linux/comments/1t8i0z/programmers_in_rlinux_what_color_schemes_you_use/
- http://leocharre.com/articles/setting-ls_colors-colors-of-directory-listings-in-bash-terminal/
- https://www.linux.com/learn/bash-tips-linux-sysadmins
- https://stackoverflow.com/questions/9532499/check-whether-a-path-is-valid-in-python-without-creating-a-file-at-the-paths-ta
