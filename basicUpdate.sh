#!/bin/bash
# This update script will update your Mac computer
# It updates:
# - HomeBrew + installed packages
# - MacOS
# - Applications installed via the Mac App Store
#
# Requirements:
# `brew install mas`
echo "Welcome to the update script."
echo "Updating HomeBrew ..."
brew doctor
brew update && brew upgrade
brew cleanup -s
brew bundle --force dump && brew bundle --force cleanup
echo "Updating HomeBrew done."
echo "Updating MacOS ..."
sudo softwareupdate -i -a
echo "Updating MacOS done."
echo "Updating Mac App Store apps ..."
mas outdated
mas upgrade
echo "Updating Mac App Store apps done."
echo "Update script completed."