# Find the directory this file exists in.
ZSHRC=$(readlink -f "$HOME/.zshrc")
DOTFILES=$(dirname "$ZSHRC")

# initialize env improvement, if it is installed.
ENV_IMPROVEMENT_ROOT=/apollo/env/envImprovement
if [ -d $ENV_IMPROVEMENT_ROOT ]; then
    AUTO_TITLE_SCREENS="NO"
    source $ENV_IMPROVEMENT_ROOT/dotfiles/zshrc
fi

ZSH=$HOME/.oh-my-zsh

# install oh-my-zsh if it does not exist
if [ ! -d $ZSH ]; then
    curl -Lk https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# oh-my-zsh settings
ZSH_CUSTOM="$DOTFILES/ohmyzsh"
ZSH_THEME="ungood"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux)
if [ -d "/apollo" ]; then
    plugins+=amazon
fi

# tmux plugin settings
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

source $ZSH/oh-my-zsh.sh

if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi
