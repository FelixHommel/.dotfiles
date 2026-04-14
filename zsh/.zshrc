# Zsh stuff
## Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder

## Zsh settings
CASE_SENSITIVE="true"

## Zsh built-in plugins
plugins=(
    git-commit
    sudo
)
source $ZSH/oh-my-zsh.sh

# Aliases
## git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gbl="git branch -l"
alias gc="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias glog="git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(blue) %D%n%s%n'"
alias gl="git pull"
alias glr="git pull --rebase"
alias gp="git push"
alias grs="git restore"
alias grss="git reset --staged"
alias gst="git status"

## zed
alias zed="zeditor"

# Zplug
source $HOME/.zplug/init.zsh

## Install plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "MichaelAquilina/zsh-you-should-use"

## Load theme
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

## Install any uninstalled plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

## Load plugins
zplug load

# Exports and Setup of Other Programs
## Setup bob, so that nvim is available
if [[ -d "$HOME/.local/share/bob" ]]; then
    export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

## If nvim is available, configure it as default editor and man page viewer
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
    export MANPAGER="nvim +Man!"
fi

## Easy Bat Support (just like https://github.com/fdellwing/zsh-bat)
if command -v batcat >/dev/null 2>&1; then
    alias rcat="$(which cat)"
    alias cat="$(which batcat)"
elif command -v bat >/dev/null 2>&1; then
    alias rcat="$(which cat)"
    alias cat="$(which bat)"
fi

## Conda Setup
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/felix/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/felix/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/felix/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/felix/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## Set up Homebrew
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

## Set up VulkanSDK
if [[ -f "$HOME/VulkanSDK/1.4.335.0/setup-env.sh" ]]; then
    source "$HOME/VulkanSDK/1.4.335.0/setup-env.sh"
fi

## Set up vcpkg
__VCPKG_ROOT="$HOME/vcpkg"
if [[ -d "$__VCPKG_ROOT" ]]; then
	export VCPKG_ROOT="$__VCPKG_ROOT"
    export PATH="$__VCPKG_ROOT:$PATH"
    export CMAKE_TOOLCHAIN_FILE="$__VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
fi
unset __VCPKG_ROOT

## Set up uv
if [[ -x "$HOME/.local/bin/env" ]]; then
    . "$HOME/.local/bin/env"
fi

## Set up NodeJS Version Manager
export __NVM_DIR="$HOME/.nvm"
if [[ -d "$__NVM_DIR" ]]; then
    export NVM_DIR="$__NVM_DIR"
    [ -s "$__NVM_DIR/nvm.sh" ] && \. "$__NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$__NVM_DIR/bash_completion" ] && \. "$__NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
unset __NVM_DIR

## Set up Sdkman
# NOTE: THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

