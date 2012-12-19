DOTFILE_CANDIDATES=(~/.dotfiles/home ~/.home_away_from_home ~)

for c in $DOTFILE_CANDIDATES; do
    if [ -d $c ]; then
        export DOTFILES_DIR=$c
        break
    fi
done

source $DOTFILES_DIR/funcs

export ENV_IMPROVEMENT_ROOT=/apollo/env/envImprovement
ENV_IMPROVEMENT_ZSHRC=$ENV_IMPROVEMENT_ROOT/dotfiles/zshrc
if [ -f $ENV_IMPROVEMENT_ZSHRC ]; then
    AUTO_TITLE_SCREENS="NO"
    source $ENV_IMPROVEMENT_ROOT/dotfiles/zshrc
fi

source-all $DOTFILES_DIR/zshrc

source-one ~/.zshrc_local
