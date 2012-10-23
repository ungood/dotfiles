alias -g ics='WDItemCostService'
alias -g als='WDLiquidationService'
alias -g liqwf='WDLiquidationWorkflow'
alias -g applog='application.log.`date -u +%F-%H`'
alias -g svclog='service_log.`date -u +%F-%H`'

function ws() {
    cd /workplace/jwwalker/$1
}

function activate() {
    sudo runCommand -a activate -e $1
}

