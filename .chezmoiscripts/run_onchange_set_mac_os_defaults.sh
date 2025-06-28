#!/bin/bash

# Configures various Mac OS default to my peferences.
# A list of Mac OS defaults can be found at https://macos-defaults.com/

echo "Configuring MacOS defaults - requesting admin password"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# General System

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "30" 
defaults write com.apple.dock "autohide" -bool "true"

killall Dock

# Safari
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"

killall Safari

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
# search the current folder by default
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# no delay when hovering the toolbar title
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show the /Volumes folder
sudo chflags nohidden /Volumess

killall Finder

# Mouse (Requires a restart to take effect)
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Keyboard

# Fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "Completed configuring MacOS. Restart required for some changes"