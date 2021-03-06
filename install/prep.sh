#!/bin/sh

# Clean any potential conflicts
printf "\033[1mResetting repository.\033[0m\n"
cd ~/utils
git reset HEAD --hard
printf "\n"

# Ensure we have the latest
printf "\033[1mPulling latest from GitHub.\033[0m\n"
git pull

# HACK ALERT
# Files seem to come down from Git with odd permissions. This code is my attempt to clean things up.
# all files get 644
find ~/utils -type f -exec chmod 644 {} \;
# all directories get 775
find ~/utils -type d -exec chmod 775 {} \;
# all shell scripts get 755
find ~/utils -name '*.sh' -exec chmod 755 {} \;

# Update the packaging tool
printf "\n\033[1mUpdating the Ubunutu Packaging Tool.\033[0m\n"
sudo apt update

# Wrap it up
printf "\n"
