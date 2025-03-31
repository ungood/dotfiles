if command -q mise
    mise activate fish | source
else
    warn "mise is not installed"
end