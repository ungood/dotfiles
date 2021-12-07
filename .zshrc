# Profiles zsh, then you can run zprof to check the results.
zmodload zsh/zprof

# https://apple.stackexchange.com/questions/312795/zsh-paste-from-the-clipboard-a-command-takes-a-few-second-to-be-write-in-the-ter
export DISABLE_MAGIC_FUNCTIONS=true

# Clear some things (helpful when sourcing .zshrc again)
precmd_functions=()

# Setup some paths (TODO: make more dynamic)
DOTFILES="$HOME/.dotfiles"
AMAZON_ROOT="$HOME/.amazon"

# Load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle Tarrasch/zsh-autoenv # Useful auto-env support

# "z" command for going to recent dirs.
antigen bundle rupa/z

antigen bundle "ungood/zsh"
antigen theme "ungood/zsh" themes/ungood

# Amazon-specific stuff
if [[ -d $AMAZON_ROOT ]]; then
    echo "Applying Amazon Bundle"
    antigen bundle "$AMAZON_ROOT" zsh --no-local-clone
fi

# Host-specific overrides
if [[ -f "$HOME/.zshrc_local" ]]; then
    echo "Including .zshrc_local"
    source "$HOME/.zshrc_local"
fi

# This must be last to work properly.
antigen bundle zsh-users/zsh-syntax-highlighting

# Make it so
antigen apply
