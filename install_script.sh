#! /bin/bash
. ~/dotfiles/boilerplate/my_functions.sh


# Can have section for root directory easy ones, then any in weird places we can specifically symlink?

if [ $# -ne 0 ]; then
  TEST_RUN=1
  echo 'Running in Test mode...'
fi

dir=~/dotfiles
olddir=~/old_dotfiles
ignorefiles="README.md install_script.sh boilerplate"

if [ "$TEST_RUN" == "1" ]; then
  echo "Create backup folder for any existing dotfiles.."
  #mkdir -p $olddir
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
    fi
    echo "-> create symlink for $fname"
  done
  echo "...done"  
   exit 0
fi


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
