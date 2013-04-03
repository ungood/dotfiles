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
