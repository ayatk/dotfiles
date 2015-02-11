#!/usr/bin/env bash

xcode-select --install

echo
read -p "Please wait until CLI tools are installed and press enter"  < /dev/tty

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap caskroom/cask
brew tap caskroom/version
brew install brew-cask

brew cask install java
brew cask install adobe-air
brew cask install arduino
brew cask install atom
brew cask install dash
brew cask install dropbox
brew cask install evernote
brew cask install flash
brew cask install xquartz
brew cask install google-chrome
brew cask install google-drive
brew cask install minecraft
brew cask install skype
brew cask install sourcetree
brew cask install vagrant
brew cask install virtualbox
brew cask install kobito

brew install bash
brew install brew-pip
brew install brew-gem
brew install python
brew install python3
brew install git
brew install hub
brew install ruby
brew install fish
brew install zsh
brew install zsh-completions
brew install tmux
brew install sqlite
brew install htop
brew install cmake
brew install openssl
brew install vim
brew install maven
brew install node
brew install heroku

brew cleanup
brew cask cleanup
