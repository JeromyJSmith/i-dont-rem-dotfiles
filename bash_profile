# # # # 
# Kevin's Hyperjs Bash Profile
#     - Why this is bash_profile and not bashrc https://github.com/zeit/hyper/issues/699
# # # #

echo "using .bash_profile"

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
