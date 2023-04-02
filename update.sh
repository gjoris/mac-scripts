#!/bin/bash
# This update script will update your Mac computer
# It updates:
# - HomeBrew + installed packages
# - Node to latest LTS
# - All global Node packages
# - PIP to latest version
# - All PIP packages
# - MacOS
# - Applications installed via the Mac App Store
#
# Requirements:
# `brew install nvm python mas`
echo "Welcome to the update script."
echo "Updating HomeBrew ..."
brew doctor
brew update && brew upgrade
brew cleanup -s
brew bundle --force dump && brew bundle --force cleanup
echo "Updating HomeBrew done."
echo "Updating Node ..."
#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm install --lts
npm update -g 
echo "Updating Node done."
echo "Updating all Python packages ..."
pip install --upgrade pip
pip list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip install -U 
echo "Updating Python packages done."
echo "Updating MacOS ..."
sudo softwareupdate -i -a
echo "Updating MacOS done."
echo "Updating Mac App Store apps ..."
mas outdated
mas upgrade
echo "Updating Mac App Store apps done."
echo "Update script completed."