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

# PROMPT
autoload -Uz vcs_info

# Display a yellow ! when there are staged, but uncommited changes
zstyle ':vcs_info:*' stagedstr "${BR_WHITE}|${BR_RED}c"
# Display a red ! when there are unstaged changes
zstyle ':vcs_info:*' unstagedstr "${BR_WHITE}|${BR_RED}a"
# Turning these on can give us the above messages, but is slower
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
# Normal format
zstyle ':vcs_info:*' formats "${BR_WHITE}[${GREEN}%b%c%u${BR_WHITE}]"
zstyle ':vcs_info:*' actionformats "${BR_WHITE}[${RED}%a${BR_WHITE}|${GREEN}%b%c%u${BR_WHITE}]"
zstyle ':vcs_info:*' enable git 
precmd () {
#    export AHEAD=$(wc -l | git rev-list HEAD --not --remotes)
#    if [ $? -ne 0 ]; then
#        expor AHEAD=''
#    fi
    #local git_info
    #git_info='[%F{blue}%b%c%u'
    #if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    #    zstyle ':vcs_info:*' formats " ${git_info}%F{white}]"
    #} else {         
    #    zstyle ':vcs_info:*' formats " ${git_info}%F{red}+%F{white}]"
    #}
    
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

# COMPLETION
#local knownhosts
#knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} ) 
#zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts

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
