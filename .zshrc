setopt completealiases

# ALIASES
alias ls='ls --color'
alias rm='rm -I'

# COLOR VARIABLES
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BLACK; do
    eval BR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
done
RESET="%{$reset_color%}"

# VIRTUALENV
export PIP_REQUIRE_VIRTUALENV=true
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.envs
    export PROJECT_HOME=$HOME/projects
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh
fi


# PROMPT
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# Display a yellow ! when there are staged, but uncommited changes
zstyle ':vcs_info:*' stagedstr "${BR_WHITE}|${BR_RED}c"
# Display a red ! when there are unstaged changes
zstyle ':vcs_info:*' unstagedstr "${BR_WHITE}|${BR_RED}a"
# Turning these on can give us the above messages, but is slower
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
# Normal format
zstyle ':vcs_info:*' formats "(%s) %12.12i %c%u %b%m" # hash, changes, branch, misc
#zstyle ':vcs_info:*' formats "${BR_WHITE}[${GREEN}%b%c%u${BR_WHITE}]"
#zstyle ':vcs_info:*' actionformats "${BR_WHITE}[${RED}%a${BR_WHITE}|${GREEN}%b%c%u${BR_WHITE}]"

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )

        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )

        hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
    fi
}

precmd () {
    vcs_info

    case "$TERM" in
        rxvt*|xterm*|cygwin)
            print -Pn "\e]2;%n@%m %~\a" # set screen title
        ;;
    esac
}    
                                  
setopt prompt_subst

PROMPT='${YELLOW}%1~%(!.${RED}.${BLUE}> ${RESET}'
RPROMPT='${vcs_info_msg_0_} ${BR_WHITE}[${CYAN}%@${BR_WHITE}]$RESET'

# BIND SPECIAL KEYS
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

if [[ -f $HOME/.zshrc_local ]]; then
  source $HOME/.zshrc_local
fi
