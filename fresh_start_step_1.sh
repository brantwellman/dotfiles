#!/bin/sh

echo "Setting up your Mac..."
echo "Installing Zsh and Powerlevel10K them"

# Check for Oh My Zsh and install if we don't have it
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zshell"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel 10K theme if we don't have it
if ! [ -d "$HOME/powerlevel10k" ]; then
  echo "Installing Powerlevel 10k OMZSH theme"

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo "source ~/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
fi

echo "Open new terminal window and complete Powerlevel10K configuration..."
echo "Next, run step 2: ./fresh_start_step_2.sh"
