if command -q tide
    tide configure --auto \
        --style=Lean \
        --prompt_colors='True color' \
        --show_time='12-hour format' \
        --lean_prompt_height='Two lines' \
        --prompt_connection=Solid \
        --prompt_connection_andor_frame_color=Light \
        --prompt_spacing=Sparse \
        --icons='Few icons' \
        --transient=No
else
    warn "tide is not installed"
end