# # # # 
# Kevin's Hyperjs Bash Profile
#     - Why this is bash_profile and not bashrc https://github.com/zeit/hyper/issues/699
# # # #


if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

if [ -f ~/.propeller_aliases ]; then
	source ~/.propeller_aliases
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Access 'mongo' command
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
