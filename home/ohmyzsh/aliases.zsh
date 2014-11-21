# My shorthand for "got to a projects directory"
function ws() {
    proj_dir="$HOME/projects"

    if [ ! -d "$proj_dir" ]; then
        echo "Projects directory ($proj_dir) does not exist.";
        return;
    fi

    dirs=("$proj_dir/$1/src" "$proj_dir/$1" "$proj_dir")

    for d in $dirs; do
        if [ -d $d ]; then
            cd $d
            unset d
            unset proj_dir
            break
        fi
    done
}

alias today='date -u +%F'

# Executes a git command on all git directories under the current one.
function rgit() {
    find -L . -maxdepth 4 -type d -name \.git -print -exec git -C "{}/.." "$@" \;
}
