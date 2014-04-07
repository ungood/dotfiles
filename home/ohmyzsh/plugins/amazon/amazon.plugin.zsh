export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export BRAZIL_WORKSPACE_GITMODE=1
export BRAZIL_WORKSPACE_CR_TARGET_GROUPS=goldfish-dev

alias bb='brazil-build'
alias bbb='brazil-build build'
alias bbr='brazil-build release'
alias bba='brazil-build apollo-pkg'
alias bbc='brazil-build clean'

alias bbba='bbb && bba'
alias bbcba='bbc && bbb && bba'

JUNIT_FORMAT="/apollo/env/envImprovement/bin/junitFormat.rb"
alias bbt='brazil-build test | $JUNIT_FORMAT'
function bbst() { brazil-build single-test -DtestClass="$1" | $JUNIT_FORMAT }

alias br-attach='brazil ws --attachenvironment --alias'
alias br-detach='brazil ws --detachenvironment --alias'

alias kinit="kinit -f -l 24h"


export ORACLE_VERSION=10.2.0.2
export ORACLE_HOME=/opt/app/oracle/product/${ORACLE_VERSION}/client
export PATH=$ORACLE_HOME/bin:$PATH
export SQLPATH="$HOME"

(( SQLLINES = LINES - 8 ))

function sqlplus() {
    echo 'set wrap off;' > ~/login.sql
    echo "set pagesize ${SQLLINES};" >> ~/login.sql
    echo "set linesize ${COLUMNS};" >> ~/login.sql
    echo "set numformat 99999999999.99" >> ~/login.sql
    echo "alter session set NLS_DATE_FORMAT = 'mm-dd-yyyy HH24:mi:ss';" >> ~/login.sql

    rlwrap sqlplus $@
}

function activate() {
    sudo /apollo/bin/runCommand -a Activate -e $1
}
