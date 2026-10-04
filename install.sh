#!/usr/bin/env bash
# Symlink dotfiles to home directory

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Each entry: "<source-relative-to-repo>|<target-absolute-path>"
links=(
  ".zshrc|$HOME/.zshrc"
  ".gitconfig|$HOME/.gitconfig"
  ".bashrc|$HOME/.bashrc"
  ".bash_profile|$HOME/.bash_profile"
  ".tmux.conf|$HOME/.tmux.conf"
  ".dir_colors|$HOME/.dir_colors"
  "alacritty|$HOME/.config/alacritty"
)

for entry in "${links[@]}"; do
  src="${entry%%|*}"
  target="${entry#*|}"
  mkdir -p "$(dirname "$target")"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "Backing up existing $target to $target.bak"
    mv "$target" "$target.bak"
  fi
  ln -sfn "$DOTFILES_DIR/$src" "$target"
  echo "Linked $src -> $target"
done

echo "Done! Restart your shell or run: source ~/.zshrc"
