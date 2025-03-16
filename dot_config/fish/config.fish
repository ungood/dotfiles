if status is-interactive
  export GREP_OPTIONS='--color=auto'
  export LESS="-iMFXR"
end

# Disable fish_greeting
set -g fish_greeting

# pnpm
set -gx PNPM_HOME "/Users/jason.walker/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

