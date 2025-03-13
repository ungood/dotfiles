This package contains my personal dotfiles, using chezmoi to manage them.

manage them.

TODO:

## Installation

Installs chezmoi and this dotfiles repository in one command. Note that I prefer to use ~/.dotfiles as the source
directory instead of chezmoi's default.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --source ~/.dotfiles --apply ungood
```

## Todo

* Install fish plugins. See [example](https://github.com/stevewm/dotfiles/blob/main/run_onchange_install-packages.sh.tmpl)
* Install Brewfile (and automate keeping it updated)
* Testing

## Inspiration

* <https://github.com/andrewbrey/dotfiles>
