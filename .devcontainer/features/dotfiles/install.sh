#!/bin/bash
set -e

apt-get update

# Apply dotfiles if present
if [ -d "/home/dev/.dotfiles" ]; then
  sudo /home/dev/.dotfiles/scripts/setup-profile.sh dev true devcontainer
else
  echo "No dotfiles directory found"
fi
