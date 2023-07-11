export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vi="vim"
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias cat="bat"
alias du="dust"
alias df="duf"
alias man="tldr"
alias ping="gping"
alias ps="procs"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
