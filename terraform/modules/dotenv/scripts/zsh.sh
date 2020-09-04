
brew install zsh
CI=1 nohup sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & #|| echo "oh-my-zsh installed"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install font-inconsolata
brew cask install font-hasklig-nerd-font
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#sed -i "s/robbyrussell/powerlevel10k\/powerlevel10k/g" /root/.zshrc
