#!/usr/bin/env bash

# http://brew.sh/
echo "==================="
echo "INSTALLING HOMEBREW"
echo "==================="
echo ""
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo "==================="
echo "INSTALLING CHEFDK"
echo "==================="
echo ""
brew install caskroom/cask/brew-cask
brew cask install chefdk
eval "$(chef shell-init bash)"


echo ""
echo "==================="
echo "INSTALLING VIRTUALBOX"
echo "==================="
echo ""
brew install caskroom/cask/brew-cask
brew cask install virtualbox

echo ""
echo "==================="
echo "INSTALLING VAGRANT"
echo "==================="
echo ""
brew install caskroom/cask/brew-cask
brew cask install vagrant
brew tap homebrew/completions && brew install vagrant-completion # Optional
