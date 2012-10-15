if [[ -f $HOME/.zshrc_before ]]; then
  source $HOME/.zshrc_before
fi

export PAGER=less

setopt completealiases

# ALIASES
alias ls='ls --color'
alias mt='multitail'

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
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "${BR_GREEN}S"
zstyle ':vcs_info:*' unstagedstr "${BR_RED}U"
zstyle ':vcs_info:git*+set-message:*' hooks git-st
vcs_format="%m %c%u ${BR_WHITE}[${CYAN}%6.6i${WHITE}-${BLUE}%b${BR_WHITE}]"
zstyle ':vcs_info:*' formats "${vcs_format}"
zstyle ':vcs_info:*' actionformats "${BR_WHITE}(%a) ${vcs_format}"

function git-remote() {
    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    gitstatus=()

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${YELLOW}+${ahead}" )
        
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${YELLOW}-${behind}" )
       
        gitstatus="${(j:/:)gitstatus}"
    fi
}

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    if [[ "$TERM" != "cygwin" ]]; then
        git-remote
    fi
    hook_com[misc]=${gitstatus}
}

# Windows has a slower implementation of git, so
# this is a pared-down version of my git prompt for Cygwin
function fast-git() {
    local branch revision
    branch=$(git symbolic-ref HEAD 2>/dev/null)
    branch=${branch##refs/heads/}

    if [[ -n $branch ]]; then
        #git-remote #too slow :(
        revision=$(git rev-parse --verify HEAD 2>/dev/null)
        vcs_info_msg_0_="${gitstatus} ${BR_WHITE}[${BLUE}%6>>${revision}%>>${BR_WHITE}-${BR_CYAN}${branch}${BR_WHITE}]"
    else
        vcs_info_msg_0_=""
    fi
}

chpwd() {
    run_vcs_info="YES"
}

preexec() {
    if [[ "$1" =~ "^git" ]]; then
        run_vcs_info="YES"
    else
        run_vcs_info="NO"
    fi
}

precmd () {
    if [[ $run_vcs_info == "YES" ]]; then
        vcs_info
    fi

    if [[ -z $AMAZON ]]; then
        case "$TERM" in
            rxvt*|xterm*|cygwin)
                print -Pn "\e]2;%n@%m %~\a" # set screen title
            ;;
        esac
    fi
}

                                  
setopt prompt_subst

PROMPT='${YELLOW}%3~%(!.${RED}.${BLUE}> ${RESET}'
RPROMPT='${vcs_info_msg_0_}$RESET'

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

if [[ -f $HOME/.zshrc_after ]]; then
  source $HOME/.zshrc_after
fi

if [[ -d $HOME/bin ]]; then
    export PATH="$HOME/bin:$PATH"
fi
