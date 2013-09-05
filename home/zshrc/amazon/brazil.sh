export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export BRAZIL_WORKSPACE_GITMODE=1
export BRAZIL_WORKSPACE_CR_TARGET_GROUPS=goldfish-dev

JUNIT_FORMAT="/apollo/env/envImprovement/bin/junitFormat.rb"

alias bb='brazil-build'
alias bbb='brazil-build build'
alias bbr='brazil-build release'
alias bba='brazil-build apollo-pkg'
alias bbc='brazil-build clean'

alias bbba='bbb && bba'
alias bbcba='bbc && bbb && bba'

alias bbt='brazil-build test | $JUNIT_FORMAT'
function bbst() {
    brazil-build single-test -DtestClass="$1" | $JUNIT_FORMAT
}

alias br-attach='brazil ws --attachenvironment --alias'
alias br-use='brazil ws --use --package'
