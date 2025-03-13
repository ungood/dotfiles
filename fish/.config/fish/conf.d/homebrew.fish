if test (uname) = "Darwin"
    if test -e /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    else
        echo "Homebrew is not installed"
    end
end
