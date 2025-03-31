if status is-interactive
  export GREP_OPTIONS='--color=auto'
  export LESS="-iMFXR"
end

# pnpm - TODO: Fix this...
set -gx PNPM_HOME "/Users/jason.walker/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

