# Find the directory this file exists in.
ZSHRC=$(readlink "$HOME/.zshrc")
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
    temp_file=/tmp/oh-my-zsh-master.zip
    temp_dir=/tmp/oh-my-zsh
    curl -Lk https://github.com/robbyrussell/oh-my-zsh/archive/master.zip > $temp_file
    unzip $temp_file -d $temp_dir
    mv "$temp_dir/oh-my-zsh-master" "$ZSH"
fi

# oh-my-zsh settings
ZSH_CUSTOM="$DOTFILES/ohmyzsh"
ZSH_THEME="ungood"
COMPLETION_WAITING_DOTS="false"
plugins=(git tmux)
if [ -d "/apollo" ]; then
    plugins+=amazon
fi

source $ZSH/oh-my-zsh.sh

if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi
