#!/usr/bin/env bash

WORK_DIRS=(
	"$HOME/project"
	"$HOME/work"
)

# Parse arguments
# Usage: tmux-worktree [name] [directory]
# [name]           - worktree name, used as: git worktree add ../[name]
# [directory]      - base repository directory (selected via fzf if not provided)
if [[ $# -lt 1 ]]; then
	echo "Usage: tmus-worktree [name] [directory]"
	exit 1
fi

worktree_name=$1

if [[ $# -eq 2 ]]; then
	# Both provided
	selected_dir=$2
else
	# Only session name provided
	selected_dir=$(find "${WORK_DIRS[@]}" -maxdepth 2 -type d | \
		sed "s|^$HOME/||" | \
		fzf --prompt="Select work directory: ")
	# Add home path back
	if [[ -n "$selected_dir" ]]; then
		selected_dir="$HOME/$selected_dir"
	fi
fi

# If no directory selected (user canceled fzf), exit
if [[ -z "$selected_dir" ]]; then
	exit 0
fi

# Create the worktree
git -C "$selected_dir" worktree add "../$worktree_name"

# Resolve the full path of the new worktree
worktree_path=$(cd "$selected_dir/../$worktree_name" 2>/dev/null && pwd)
if [[ -z "$worktree_path" ]]; then
	echo "Failed to create worktree"
	exit 1
fi

# Create a tmux session in the new worktree
session_name=$(echo "$worktree_name" | tr . _)

tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $session_name -c "$worktree_path"
    exit 0
fi

if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c "$worktree_path"
	tmux select-window -t "$session_name:1"
fi

tmux switch-client -t "$session_name"
