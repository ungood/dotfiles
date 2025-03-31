This package contains my personal dotfiles, using chezmoi to manage them.

manage them.

TODO:

## Installation

Installs chezmoi and this dotfiles repository in one command. Note that I prefer to use ~/.dotfiles as the source
directory instead of chezmoi's default.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --source ~/.dotfiles --apply ungood
```

## Contributing

I don't really expect people to contribute to my personal dotfiles, so this is just notes for myself:

* Track a new file: `chezmoi add`
* Show differences: `chezmoi diff`
* Update source from target files: `chezmoi re-add`
* Apply changes: `chezmoi apply`
* Don't forget to `git push`!

## Todo

* Testing
* 1Password and key management
* Setting fish as default shell: [Source](https://mmazzarolo.com/blog/2023-11-16-my-fish-shell-setup-on-macos/)
* Keep iterm2 integration updated?
* MacOS settings, examples:
  * <https://github.com/stevewm/dotfiles/blob/main/run_onchange_after_configure-macos.sh.tmpl>
  * <https://github.com/politician/dotfiles/blob/main/run_once_before_2-configure-system-darwin.sh.tmpl>

## Inspiration

* <https://github.com/andrewbrey/dotfiles>
* <https://github.com/dfroberg/dotfiles/blob/master/dot_config/private_fish/config.fish.tmpl>
