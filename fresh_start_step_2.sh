#!/bin/sh

# Configure git
echo "Configuring git..."
git config --global user.name "Brant Wellman"                                                                                                                                                                                                                                                                            ─╯
git config --global user.email "brantwellman@gmail.com"
git config --global color.ui true
git config --global core.editor "code --wait"
git config --global core.excludesfile "/Users/brantwellman/.dotfiles/.gitignore_global"

# Check for Homebrew and install if it isn't present
if test ! $(which brew); then
  echo "Installing homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to your PATH
echo >> /Users/brantwellman/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/brantwellman/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew recipes
echo "Updating homebrew..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing from the Brewfile..."
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Start postgres
echo "Starting postgress through brew..."
brew services start postgresql@14

# Install nodejs plugin, install node latest, set global version to latest
echo "Installing node through brew..."
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# Install ruby plugin, install ruby latest, set global version to latest
echo "Installing ruby through brew..."
asdf plugin add ruby
asdf install ruby 3.3.5
asdf global ruby 3.3.5

# Install yarn plugin, install yarn latest, set global version to latest
echo "Installing yarn through brew..."
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest

# Configure gems to skip documentation installation step
echo "gem: --no-document" >> ~/.gemrc

# Update ruby gem manager and any installed gems
echo "Updating rubygems, bundler, and all installed gems..."
gem update --system
gem install bundler
gem update

# Intall ruby gems
echo "Installing rails..."
gem install rails

# Create coding diirectory
echo "Checking for and adding code_spaces diirectory if necessary..."

if ! [ -d "$HOME/code_spaces" ]; then
  mkdir $HOME/code_spaces
fi

# Create symlink to custom .railsrc file
ln -s ~/.dotfiles/.railsrc ~/.railsrc
