export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vi='vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
