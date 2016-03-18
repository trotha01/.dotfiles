#!/usr/bin/env bash


# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Move dock to the right
defaults write com.apple.Dock orientation -string right

# Reset all the settings above
function osx_reset() {
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool true
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool true
    defaults write com.apple.Dock orientation -string bottom

    launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
}

