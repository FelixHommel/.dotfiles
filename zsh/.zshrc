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

export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export PATH="$PATH:/opt/nvim-linux64/bin"
export EDITOR="nvim"
export NVCC_PREPEND_FLAGS="-ccbin /usr/bin/clang++"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
