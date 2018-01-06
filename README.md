# dotfiles
Easy way to keep dotfiles under version control and in turn never lose track of important commands/alterations/configs/etc.
It also gives me the ability to quickly make any Linux machine have my personal settings.
  
## Usage
- Clone under `$HOME`, to have `$HOME/dotfiles`
- Run the install script (*With anything as arguments, if no args it defaults to running the mock version for safety*) and you're all set!
  
#### Notes
- All files added to this directory should have dot removed, for easier git usage and also keeping install script simple.

- Why do I have Go files in my `scripts/` instead of using only scripting languages?  
  1. Sometimes it's nice to have a binary
  2. I need the practice
  3. Because I can
