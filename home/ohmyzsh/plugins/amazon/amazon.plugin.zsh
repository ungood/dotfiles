export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export BRAZIL_WORKSPACE_GITMODE=1
export BRAZIL_WORKSPACE_CR_TARGET_GROUPS=goldfish-dev

alias bb='brazil-build'
alias bba='brazil-build apollo-pkg'
alias bbb='brazil-build build'
alias bbc='brazil-build clean'
alias bbg='brazil-build generate'
alias bbr='brazil-build release'

alias bbba='bbb && bba'
alias bbcba='bbc && bbb && bba'

JUNIT_FORMAT="junitFormat.rb"
alias bbt='brazil-build test | $JUNIT_FORMAT'
function bbst() { brazil-build single-test -DtestClass="$1" | $JUNIT_FORMAT }

alias br-attach='brazil ws --attachenvironment --alias'
alias br-detach='brazil ws --detachenvironment --alias'

alias kinit="kinit -f -l 24h"

alias desktop='ssh jwwalker.desktop.amazon.com'

export PATH=/apollo/env/ruby193/bin:$PATH:/apollo/env/SDETools/bin

function activate() {
    sudo /apollo/bin/runCommand -a Activate -e $1
}

function git-add-desktop() {
    local ws=$1
    local package=$2
    git remote add desktop ssh://jwwalker@jwwalker.desktop.amazon.com:/user/jwwalker/projects/$1/src/$2
}

function putdot() {
    input_file=$1
    [ $# -eq 0 ] && { echo "Usage: $0 input_file"; return }

    tmp_file=$(mktemp)
    dot -Tpng "$input_file" > "$tmp_file"
    s3put "${input_file}"
    s3put --key "${input_file}.png" "$tmp_file"
}

