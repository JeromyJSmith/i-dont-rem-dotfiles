#! /bin/bash
. ~/dotfiles/boilerplate/bash_functions.sh


# Can have section for root directory easy ones, then any in weird places we can specifically symlink?
mock=0
dir=~/dotfiles
olddir=~/old_dotfiles
ignorefiles="README.md install_script.sh scripts scripts_deprecated log4bash tmp boilerplate linux-cheat-sheet.md"

if [ "$#" -ne 0 ]; then
  echo "Running in test mode (only lists output)"
  mock=1
fi

echo "Create backup folder for any existing dotfiles.."
mkdir -p $olddir
echo "...done"

echo "Changing to $dir.."
cd $dir

if [ "$mock" -eq "1" ]; then
  echo "Moving any existing files in ~ to $olddir.."
  for entry in $dir/*; do
    fname=$(basename $entry)

    if in_list "$ignorefiles" "$fname"; then
      echo "-> ignored $fname"
      continue
    fi
    if [[ -e ~/.$fname ]]; then
      echo "-> moving .$fname"
      #mv ~/.$fname $olddir
    fi
    echo "-> create symlink for $fname"
    #ln -s $entry ~/.$fname
  done
  echo "...done"
  exit 0
fi

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
