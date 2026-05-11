# dotfiles

Personal system configuration repo.

The repo is the source of truth. Files stay in package directories at their real target paths, and platform-specific commands decide which packages get linked into `$HOME`.

## Packages

- `zsh/`: `~/.zshrc` and `~/.config/zsh/*`
- `tmux/`: `~/.tmux.conf` and `~/.local/bin/tmux-sessionizer`
- `i3/`: `~/.config/i3/config` for Arch/Linux machines
- `hypr/`: `~/.config/hypr/*`
- `waybar/`: `~/.config/waybar/*`
- `ranger/`: `~/.config/ranger/*`
- `rofi/`: `~/.config/rofi/*`
- `scripts/`: `~/.local/scripts/*`
- `sublime-text/`: Linux Sublime Text user config
- `nvim/`: `~/.config` Neovim submodule

## Why Stow

GNU Stow manages symlinks from this repo into `$HOME`.

Example:

- repo file: `zsh/.zshrc`
- linked file: `~/.zshrc`

Editing the linked file updates the repo file too, so the repo stays the source of truth without a separate copy-back step.

## Commands

New Arch machine:

```bash
./arsetup arch
```

New macOS machine:

```bash
./arsetup mac
```

Re-sync configs onto an existing Arch machine:

```bash
./arsync arch
```

Re-sync configs onto an existing macOS machine:

```bash
./arsync mac
```

Commit and push all current config changes, including the `nvim` submodule:

```bash
./arpush
```

Use a custom commit message if needed:

```bash
./arpush "update shell and editor config"
```

Low-level helpers:

```bash
./init
./install-arch
```

After the first `./arsetup ...` run, the commands are also linked into `~/.local/bin`, so you can run `arsetup`, `arsync`, and `arpush` directly.
- `arpush` uses an automatic commit message if you do not pass one.

## Notes

- Put machine-specific shell overrides in `~/.config/zsh/local.zsh`.
- `zsh/.config/zsh/local.zsh` is ignored so host-specific values stay out of git.
- `nvim` remains its own git repo through the existing submodule, but `arpush` handles its commit and push before updating the main repo.
- `install-arch` covers packages from the official Arch repos. Extras outside the default repo set, such as Google Chrome, Slack, or `xautolock`, still need a separate install step.
