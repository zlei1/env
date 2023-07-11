#!/bin/sh
set -e

update_apt() {
  sudo apt-get update -y
}

install_units() {
  sudo apt-get install curl -y
  sudo apt-get install wget -y
  sudo apt-get install exuberant-ctags -y

  _install_zsh

  _install_tmux

  sudo apt-get install silversearcher-ag
  _install_ack

  _install_fzf

  _install_vim

  _install_modern_tool
}

_install_zsh() {
  sudo apt install zsh -y
  chsh -s /bin/zsh # Change your Default Shell
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  cp ./.zshrc ~/
}

_install_tmux() {
  sudo apt-get install tmux -y
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s -f .tmux/.tmux.conf ~/
  cp ~/.tmux/.tmux.conf.local ~/
}

_install_ack() {
  sudo apt-get install ack-grep -y
  cp ./.ackrc ~/
}

_install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

_install_vim() {
  sudo apt-get install vim -y
  cp ./.vimrc ~/
  cp -rf ./.vim ~/
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim -c 'PluginInstall' -c 'qa!'
}

_install_modern_tool() {
  sudo apt install snapd
  sudo snap install procs
  sudo apt-get install tldr -y
  sudo apt-get install lsd -y
  sudo apt-get install bat -y
  sudo apt-get install du-dust -y
  sudo apt-get install duf -y
}

main() {
  update_apt

  install_units
}

main
