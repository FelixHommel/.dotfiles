export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="headline"

plugins=(
    git
    git-commit
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-bat
    you-should-use
)

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"

CASE_SENSITIVE="true"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export PATH="$PATH:/opt/nvim-linux64/bin"
export EDITOR='nvim'
