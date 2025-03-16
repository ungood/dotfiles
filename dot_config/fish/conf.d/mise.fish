if command -q mise
    mise activate fish | source
else
    echo "mise is not installed"
end