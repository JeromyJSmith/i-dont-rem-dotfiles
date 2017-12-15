#! /bin/bash
. ~/dotfiles/boilerplate/bash_functions.sh


# Can have section for root directory easy ones, then any in weird places we can specifically symlink?
mock=0
dir=~/dotfiles
olddir=~/old_dotfiles
ignorefiles="README.md install_script.sh scripts scripts_deprecated log4bash tmp boilerplate cheat-sheets"

echo "__________________________________________"
echo "Running install script for Kevin's dotfiles!"
echo "__________________________________________"
echo ""

if [ "$#" -eq 0 ]; then
  echo "Running in test mode (only lists output)"
  mock=1
fi

# echo "Create backup folder for any existing dotfiles.."
# mkdir $olddir 2> /dev/null || echo "$olddir already exists, fail now to prevent overwrite." && exit 1
# echo "...done"

echo "Changing to $dir.."
cd $dir

if [ "$mock" -eq "1" ]; then
  echo "Moving any existing files in $HOME to $olddir.."
for entry in $dir/*; do
  fname=$(basename $entry)

  if in_list "$ignorefiles" "$fname"; then
    echo "-> ignored $fname"
    continue
  fi
  if [[ -e ~/.$fname ]]; then
    echo "-> moving .$fname"
  fi
  if [[ $fname == "ssh-config" ]]; then
    echo "Creating symlink for .ssh/config"
    mkdir ~/.ssh/ 2> /dev/null || true
  else
    echo "-> create symlink for $fname"
  fi
done

echo "Creating ${HOME}/bin..."
mkdir ~/bin 2> /dev/null || true

for script in $dir/scripts/*; do
  scriptname=$(basename $script)
  echo "-> (placeholder) creating symlink for $scriptname"
done
echo "...done"
fi
exit 0

########################################
# Real script
########################################
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
  if [[ $fname == "ssh-config" ]]; then
    echo "Creating symlink for .ssh/config"
    mkdir ~/.ssh/ || true
    mv ~/.ssh/config $olddir/ssh-config
    ln -s ssh-config ~/.ssh/config
  else
    echo "-> create symlink for $fname"
    ln -s $entry ~/.$fname
  fi
done

echo "Creating ${HOME}/bin..."
mkdir ~/bin || true

for script in $dir/scripts/*; do
  scriptname=$(basename $script)
  echo "-> (placeholder) creating symlink for $scriptname"
  # ln -s $script $HOME/bin/${scriptname}
done
echo "...done"
