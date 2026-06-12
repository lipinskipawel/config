#!/usr/bin/env bash

set -e

# unlink ~/.local/bin/tmux-sessionizer.sh
# unlink ~/.local/bin/tmux-work-session.sh
# unlink ~/.local/bin/tmux-kill-window.sh
# unlink ~/.local/bin/tmux-kill-session.sh
# unlink ~/.local/bin/tmux-worktree.sh

ln -s $(pwd)/tmux-sessionizer.sh ~/.local/bin/
ln -s $(pwd)/tmux-work-session.sh ~/.local/bin/
ln -s $(pwd)/tmux-kill-window.sh ~/.local/bin/
ln -s $(pwd)/tmux-kill-session.sh ~/.local/bin/
ln -s $(pwd)/tmux-worktree.sh ~/.local/bin/
