function warn --description "Emits a warning to stdout"
    echo -s (set_color $fish_color_error) (set_color $fish_color_normal) $argv
end