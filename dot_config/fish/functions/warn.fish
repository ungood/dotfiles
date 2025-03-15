function warn --description "Emits a warning to stdout"
    echo "[WARN]" (set_color $fish_color_error) $argv
end