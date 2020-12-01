#!/bin/sh
set -e

HOME_PATH=$HOME

update_apt() {
  sudo apt-get update -y
}

install_units() {
  sudo apt-get install curl -y
  sudo apt-get install wget -y

  _install_zsh

  _install_tmux

  sudo apt-get install silversearcher-ag
  _install_ack

  _install_fzf

  sudo apt-get install exuberant-ctags -y
  _install_vim
}

_install_zsh() {
  sudo apt install zsh -y
  chsh -s /bin/zsh # Change your Default Shell
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME_PATH}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME_PATH}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  cp ./.zshrc "${HOME_PATH}/"
}

_install_tmux() {
  sudo apt-get install tmux -y
  ln -s -f ./.tmux/.tmux.conf "${HOME_PATH}/.tmux.conf"
  cp ./.tmux/.tmux.conf.local "${HOME_PATH}/"
}

_install_ack() {
  sudo apt-get install ack-grep -y
  cp ./.ackrc "${HOME_PATH}/"
}

_install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

_install_vim() {
  sudo apt-get install vim -y
  cp ./.vimrc "${HOME_PATH}/"
  cp -rf ./.vim "${HOME_PATH}/"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim -c 'PluginInstall' -c 'qa!'
}

main() {
  update_apt

  install_units
}

main
