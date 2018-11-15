
# Path to your oh-my-zsh installation.
export ZSH="/Users/affan/.oh-my-zsh"

ZSH_THEME="robbyrussell"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh
plugins=(
  git
  osx
  brew
  web-search
  zsh-syntax-highlighting
)

alias weather="curl www.wttr.in"

