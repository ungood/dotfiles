function warn --description "Emits a warning to stdout"
    echo -s (set_color $fish_color_error) "[WARN] " (set_color $fish_color_normal) $argv
end