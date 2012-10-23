export PAGER=less
export EDITOR=vim
export P4EDITOR=vim

setopt completealiases

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
