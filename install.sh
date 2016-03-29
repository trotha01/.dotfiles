#!/usr/bin/env bash

# http://brew.sh/
echo "==================="
echo "INSTALLING HOMEBREW"
echo "==================="
echo ""
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo "==================="
echo "UPDATING HOMEBREW"
echo "==================="
echo ""
brew update

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
echo "INSTALLING FZF"
echo "==================="
echo ""
brew install fzf
# Install shell extensions
/usr/local/opt/fzf/install

echo ""
echo "==================="
echo "INSTALLING AUTOJUMP"
echo "==================="
echo ""
brew install autojump

echo ""
echo "==================="
echo "INSTALLING PIP"
echo "==================="
echo ""
curl -s https://bootstrap.pypa.io/get-pip.py > get-pip.py
sudo python get-pip.py
rm -rf get-pip.py

echo ""
echo "==================="
echo "INSTALLING VIRTUALENV"
echo "==================="
echo ""
sudo pip install virtualenv

echo ""
echo "==================="
echo "INSTALLING NODEJS"
echo "==================="
echo ""
brew install nodejs

echo ""
echo "==================="
echo "INSTALLING HASKELL"
echo "==================="
echo ""
brew install ghc

echo ""
echo "==================="
echo "INSTALLING HUB"
echo "==================="
echo ""
brew install hub



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
echo ""
echo "SEQUEL PRO"
echo "http://www.sequelpro.com/download"
echo ""
echo "VISUAL STUDIO"
echo "https://code.visualstudio.com/Updates"
echo ""
echo "SCREEN HERO"
echo "http://screenhero.com/download.html"
echo ""
echo "ELM"
echo "http://elm-lang.org/install"
echo ""



