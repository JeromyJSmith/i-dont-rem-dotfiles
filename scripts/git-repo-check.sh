#! /bin/bash
#
# inspiration links:
# https://gist.github.com/mzabriskie/6631607
# https://gist.github.com/lmj0011/1a8dd1e376234ac7bf0fba2748ecdd0f
# https://gist.github.com/gimbo/f1cc9f5c7a9b5e13dbb007acb0a993d4
# https://github.com/MaxWinterstein/check_git_pullstatus/blob/master/check_git_pullstatus.sh
#

# To fix recurring ssh passphrase questions, use https://askubuntu.com/questions/362280/enter-ssh-passphrase-once
# or similar, not an issue with the script

. /home/kquinn/dotfiles/boilerplate/bash_functions.sh
. /home/kquinn/dotfiles/log4bash/log4bash.sh

echo_blue() {
	echo -en "\033[0;36m"
	echo "$1"
	echo -en "\033[0m"
}

check_git_repo() {
	clean=0
	repo=$(basename $1)

	echo_blue "** Checking $repo..."

	inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
	if [ ! $inside_git_repo ]; then
		echo_blue "----> Not a Git repository"
		return 1
	fi

	# Appending $? assigns the variable to return value, $(command)$?
	#### Only works on already tracked files, not untracked ones
	all_staged=$(git diff-files --quiet --ignore-submodules --)$?
	all_tracked=$(git status | grep 'Untracked' -c)
	all_commited=$(git diff-index --cached --quiet HEAD --ignore-submodules --)$?
	
	if [ $all_staged -ne 0 ]; then
		log_warning "Need to handle unstaged files"
		clean=1
	fi

	if [ $all_tracked -ne 0 ]; then
		log_warning "Need to handle untracked files"
		clean=1
	fi

	if [ $all_commited -ne 0 ]; then
		log_warning "Need to commit files"
		clean=1
	fi

	#check pull
# TODO: Add option to handle branches aside from master and remotes that aren't origin
	no_origin=1
	git fetch origin &> /dev/null || no_origin=0

	if [ $no_origin -ne 0 ]; then
		if [ "$(git log HEAD..origin/master --oneline)" != "" ]; then
			log_warning "HEAD is behind origin/master, need to pull"
			clean=1
		fi
	else
		log_error "Origin branch doesn't exist, can't check pull"
	fi

	#check push
# TODO: use plumbing git commands not porcelain for info
	if [ $(git status | grep 'Your branch is ahead' -c) -ne 0 ]; then
		log_warning "Commits need to be pushed"
		clean=1
	fi

	if [ $clean -eq  0 ]; then
		log_success "Repo is clean, nothing to do"
	fi

}

git_summary() {
	# if check_num_args $# ne 1; then
	# 	log_error "Need a directory argument..."
	# 	exit 1
	# fi
	
	dir="$(readlink -fn "$1")"
	if [ !  -d "$dir" ]; then
		log_error "Not a directory..."
		exit 1
	fi
	
	cd $dir
	inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
	# check if given directory is git, run just there, otherwise recursively
	# --- what should we do if run from inside a git repo directory?
	# ------currently this returns as if its not git
	if [ "$inside_git_repo" ]; then
	# only check this directory
		root_dir="$(git rev-parse --show-toplevel)"

		if [ "$dir" != "$root_dir" ]; then
			echo_blue "Running from $dir for git root directory $root_dir..."
		else
			echo_blue "Running on $dir..."
		fi
		check_git_repo "$root_dir"
	else
	# Recursively check directories in this dir
		echo_blue "Running on directories under $dir..."
		for f in $dir/*; do
			# Only run on directories
			[ -d "${f}" ] || continue
			cd $f
			check_git_repo "$f"
		done
	fi
}


git_summary $@