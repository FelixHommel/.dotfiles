# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder

# zsh settings
CASE_SENSITIVE="true"

# zsh built-in plugins
plugins=(
    git-commit
    sudo
)

source $ZSH/oh-my-zsh.sh

## exports ##
export EDITOR="nvim"

## aliases ##
# git
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

# zed
alias zed="zeditor"

# bat support
# just like https://github.com/fdellwing/zsh-bat just more lightweight
if command -v batcat >/dev/null 2>&1; then
    alias rcat="$(which cat)"
    alias cat="$(which batcat)"
elif command -c bat >/dev/null 2>&1; then
    alias rcat="$(which cat)"
    alias cat="$(which bat)"
fi

## zplug ##
source $HOME/.zplug/init.zsh

# Install plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "MichaelAquilina/zsh-you-should-use"

# Load theme
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# headline theme needs to be installed as plugin and activated after zplug load
# zplug "Moarram/headline", from:github, as:plugin

# Install any uninstalled plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins
zplug load

# Uncomment when using headline
# source $HOME/.zplug/repos/Moarram/headline/headline.zsh-theme

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
