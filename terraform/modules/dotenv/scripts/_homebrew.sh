xcode-select --install || echo "already installed"
CI=1 nohup /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &
brew update-reset