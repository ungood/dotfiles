# Profiles zsh, then you can run zprof to check the results.
zmodload zsh/zprof

# https://github.com/snkinard/dotfiles/issues/9
setopt INTERACTIVE_COMMENTS

# https://apple.stackexchange.com/questions/312795/zsh-paste-from-the-clipboard-a-command-takes-a-few-second-to-be-write-in-the-ter
export DISABLE_MAGIC_FUNCTIONS=true

# Clear some things (helpful when sourcing .zshrc again)
precmd_functions=()

# Setup some paths
DOTFILES="$HOME/.dotfiles"
WORK_DOTFILES="$HOME/.cruise"

# Load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git

antigen bundle kiurchv/asdf.plugin.zsh

# "z" command for going to recent dirs.
antigen bundle rupa/z

antigen bundle "ungood/zsh"
antigen theme "ungood/zsh" themes/ungood

# Customize the shell with my work-specific bundle.
if [[ -d $WORK_DOTFILES ]]; then
    echo "Applying work bundle from $WORK_DOTFILES"
    antigen bundle "$WORK_DOTFILES" antigen --no-local-clone
fi

# This must be last to work properly.
antigen bundle zsh-users/zsh-syntax-highlighting

# Make it so
antigen apply

# Host-specific overrides
if [[ -f "$HOME/.zshrc_local" ]]; then
    echo "Including .zshrc_local"
    source "$HOME/.zshrc_local"
fi

## Anything below this line was probably put here automatically by something and should be moved to antigen.
