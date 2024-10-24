# Create dir and immediately cd into it
mkcd () {
   mkdir "$1"
   cd "$1"
}

# path
alias     ..="cd .."
alias    ...="cd ../.."
alias   ....="cd ../../.."
alias  .....="cd ../../../.."
alias ......="cd ../../../../.."

# Navigation
cdcode () {
 cd ~
 cd "code_spaces"
}
alias dotfiles="cd $DOTFILES"

# git aliases
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias g="git"
alias ga="git add"
alias gapa="git add --patch"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gs="git status"
alias gl="git log"

# Rails aliases
alias be="bundle exec"
