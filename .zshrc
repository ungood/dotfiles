# Clear some things
precmd_functions=()

# Setup some directories (TODO: make more dynamic)
DOTFILES="$HOME/.dotfiles"

# Load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle "$DOTFILES/zsh"

antigen theme "$DOTFILES/zsh/themes" ungood

# Amazon-specific stuff
[[ $(hostname) =~ "amazon\.com" ]] && antigen bundle "$DOTFILES/amazon"

# Make it so
antigen apply

# Host-specific overrides
[[ -f "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"
