#!/usr/bin/env bash
# Symlink dotfiles to home directory

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files=(.zshrc .gitconfig .bashrc .bash_profile)

for file in "${files[@]}"; do
  target="$HOME/$file"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "Backing up existing $file to $file.bak"
    mv "$target" "$target.bak"
  fi
  ln -sf "$DOTFILES_DIR/$file" "$target"
  echo "Linked $file"
done

echo "Done! Restart your shell or run: source ~/.zshrc"
