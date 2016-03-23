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
echo "INSTALLING VAGRANT COMPLETIONS"
echo "==================="
echo ""
brew tap homebrew/completions && brew install vagrant-completion # Optional

echo ""
echo "==================="
echo "INSTALLING SILVER SEARCHER"
echo "==================="
echo ""
brew install the_silver_searcher

echo ""
echo "==================="
echo "Manual Installations needed"
echo "==================="
echo ""
echo "VAGRANT"
echo "install from https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.dmg"
echo ""
echo "GOLANG"
echo "install from https://golang.org/dl/"
echo ""
echo "GOOGLE DRIVE"
echo "https://tools.google.com/dlpage/drive"
