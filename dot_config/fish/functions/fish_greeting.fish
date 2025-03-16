function fish_greeting
    if command -q neofetch
        echo
        neofetch
    else
        warn "neofetch is not installed"
    end
end