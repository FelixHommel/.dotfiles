# oh-my-zsh settings
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

CASE_SENSITIVE="true"
source $ZSH/oh-my-zsh.sh

# zplug settings
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "so-fancy/diff-so-fancy", as:command, use:bin/git-dsf

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# CUDA settings
export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# exports / aliases
export LANG=en_US.UTF-8
export PATH="$PATH:/opt/nvim-linux64/bin"
export EDITOR="nvim"
export NVCC_PREPEND_FLAGS="-ccbin /usr/bin/clang++"
export ZED_ALLOW_EMULATED_GPU=1

alias zed="WAYLAND_DISPLAY='' zed"
alias gLog='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
