#/usr/bin/env bash
set -euo pipefail

function install() {
    package=$1
    stow -vv -t ${HOME} $package
}

install git
install misc
install vim
install zsh
install fish