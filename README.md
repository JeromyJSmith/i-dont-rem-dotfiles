# dotfiles

Easy way to keep dotfiles under version control and in turn never lose track of important commands/alterations/configs/etc.
It also gives me the ability to quickly make any Linux machine have my personal settings. With the additon of laptop configuration,
I can store everything important about my systems in a single repo.

## Usage

-   Clone under `$HOME`, to have `$HOME/dotfiles`
-   Run the install script (_With anything as arguments, if no args it defaults to running the mock version for safety_) and you're all set!

## Laptop configuration

Everything under `configuration/`. See README in directory for more details.

#### Notes

-   All files added to this directory should have dot removed, for easier git usage and also keeping install script simple.

-   Why do I have Go files in my `scripts/` instead of using only scripting languages?
    1. Sometimes it's nice to have a binary
    2. I need the practice
    3. Because I can
