#!/usr/bin/env sh

gh auth setup-git

git -C ~/.dotfiles/ pull origin master
nvim --headless "+Lazy! sync" +qa

exec "$@"
