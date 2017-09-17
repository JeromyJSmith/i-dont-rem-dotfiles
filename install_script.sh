#! /bin/bash
. ~/dotfiles/functions.sh


# Can have section for root directory easy ones, then any in weird places we can specifically symlink?

dir=~/dotfiles
olddir=~/old_dotfiles
ignorefiles="README.md install_script.sh boilerplate_funcs"


echo "Create backup folder for any existing dotfiles.."
mkdir -p $olddir
echo "...done"

echo "Changing to $dir.."
cd $dir

echo "Moving any existing files in ~ to $olddir.."
for entry in $dir/*; do
  fname=$(basename $entry)
 
  if in_list "$ignorefiles" "$fname"; then
    echo "-> ignored $fname"
    continue
  fi
  if [[ -e ~/.$fname ]]; then
    echo "-> moving .$fname"
    mv ~/.$fname $olddir
  fi
  echo "-> create symlink for $fname"
  ln -s $entry ~/.$fname
done
echo "...done"
