#!/usr/bin/env bash

# Check if Homebrew is installed
command -v brew >/dev/null 2>&1 || { \
	echo >&2 "Installing Homebrew Now"; \
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
}

brew_check_if_installed () {
	if brew ls --versions $1 > /dev/null; then
		echo "$1 allready installed"
	else
		echo "$1 is not installed with brew"
		read -p "Install it? [yN] " -n 1 -r
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo
			echo "Installing $1"
			brew install $1
		fi
	fi
}

brew_cask_check_if_installed () {
	if brew cask ls --versions $1 > /dev/null; then
		echo "$1 allready installed"
	else
		echo "$1 is not installed with brew cask"
		read -p "Install it? [yN] " -n 1 -r
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo
			echo "Installing $1"
			brew cask install $1
		fi
	fi
}

brew_cask_check_if_installed obs

brew tap homebrew/cask-drivers
brew_cask_check_if_installed elgato-game-capture-hd
