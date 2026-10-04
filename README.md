# dot-files

Run `./install.sh` to symlink everything into place. Existing non-symlink targets are moved to `*.bak`.

| Source | Target |
|---|---|
| `.zshrc`, `.bashrc`, `.bash_profile` | `~/` |
| `.gitconfig`, `.tmux.conf`, `.dir_colors` | `~/` |
| `alacritty/` | `~/.config/alacritty/` |
| `ghostty/theme.ghostty` | referenced from `~/.config/ghostty/config` via `config-file` |

## Alacritty theme

`alacritty/alacritty.toml` imports one file from `alacritty/themes/`. Edit the `import` line to switch between `adwaita-light`, `adwaita-dark`, and `nord`.
