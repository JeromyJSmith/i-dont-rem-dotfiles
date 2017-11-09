# scripts
Scripts I use as a part of my dotfiles, copied to ~/bin/ for easy use

### eye_saver.sh
- Reminder to look away from your screen every so often to stay healthy in the long term

### git-repo-check.sh & git-check
- Runs through given directory ( or if not a git repo any git repos it finds inside it) and checks their status,
including needing to pull/push, whether we have unstaged files, and whether we have untracked files to handle.
- Bash implementation is done and in use, rewriting in C both for practice and to have a single executable and not worry
about the location of the color logging/boilerplate functions files I source.

### disk-usage
- Needs more fleshing out, but meant to be a more indepth look into usage of the various root folders

## Ideas
- trello-quick-add
- docker-wrapper
- file-starter
