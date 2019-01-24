#!/usr/bin/env bash

# TODO: check if something is installed first

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
echo "INSTALLING Ripgrep
echo "==================="
echo ""
brew install ripgrep

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

# echo ""
# echo "==================="
# echo "INSTALLING HASKELL"
# echo "==================="
# echo ""
# brew install ghc

echo ""
echo "==================="
echo "INSTALLING HUB"
echo "==================="
echo ""
brew install hub

echo ""
echo "==================="
echo "INSTALLING TREE"
echo "==================="
echo ""
brew install tree

echo ""
echo "==================="
echo "INSTALLING JQ"
echo "==================="
echo ""
brew install jq

echo ""
echo "==================="
echo "INSTALLING NGROK"
echo "==================="
echo ""
brew cask install ngrok

echo ""
echo "==================="
echo "INSTALLING YARN"
echo "==================="
echo ""
brew install yarn


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
echo "ELM"
echo "http://elm-lang.org/install"
echo ""
echo "Spectacle"
echo "https://www.spectacleapp.com/"
echo ""
echo "Docker"
echo "https://hub.docker.com/editions/community/docker-ce-desktop-mac"
echo ""
echo "NVM"
echo "https://github.com/creationix/nvm#installation"
echo ""
echo "AERIAL SCREENSAVER"
echo "https://github.com/JohnCoates/Aerial"
echo ""
echo "ZOOM
echo "https://zoom.us/support/download?os=mac"
echo ""
echo "MENU METERS"
echo "https://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/"
echo ""
echo "TunnelBlick"
echo "https://tunnelblick.net/downloads.html"
echo ""
