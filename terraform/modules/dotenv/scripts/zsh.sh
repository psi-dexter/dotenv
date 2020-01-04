
brew install zsh
CI=1 nohup sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & #|| echo "oh-my-zsh installed"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install font-inconsolata
brew cask install font-hasklig-nerd-font
brew tap sambadevi/powerlevel9k
brew install powerlevel9k