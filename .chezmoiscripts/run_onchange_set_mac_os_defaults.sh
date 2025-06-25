#!/bin/bash

# Configures various Mac OS default to my peferences.
# A list of Mac OS defaults can be found at https://macos-defaults.com/

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

killall Finder

# Mouse (Requires a restart to take effect)
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"