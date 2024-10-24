#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zshell"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel 10K theme if we don't have it
if ! [ -d "$HOME/powerlevel10k" ]; then
  echo "Installing Powerlevel 10k OMZSH theme"

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo "source ~/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
fi

# Check for Homebrew and install if it isn't present
if test ! $(which brew); then
  echo "Installing homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Add asdf to .zshrc
if ! grep -Fx ". $(brew --prefix asdf)/libexec/asdf.sh" "$HOME/.dotfiles/.zshrc"; then
  echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> $HOME/.dotfiles/.zshrc
fi

# Add source zsh-autosuggestions
if ! grep -Fx "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" "$HOME/.dotfiles/.zshrc"; then
  echo -e "\nsource $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.dotfiles/.zshrc
fi

# Start postgres
brew services start postgresql@14

# TODO: Install node with asdf
# TODO: Install ruby with asdf

# TODO: Install yarn