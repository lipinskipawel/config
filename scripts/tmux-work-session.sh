#!/usr/bin/env bash

WORK_DIRS=(
	"$HOME/project"
	"$HOME/work"
)

# Parse arguments
# Usage: tmux-work-session [session_name] [directory]
# If directory is not provided, use fzf to select one
if [[ $# -eq 2 ]]; then
	# Both provided
	session_name=$1
	selected_dir=$2
elif [[ $# -eq 1 ]] && [[ -n "$1" ]]; then
	# Only session name provided
	session_name=$1
	selected_dir=$(find "${WORK_DIRS[@]}" -maxdepth 2 -type d | \
		sed "s|^$HOME/||" | \
		fzf --prompt="Select work directory: ")
	# Add home path back
	if [[ -n "$selected_dir" ]]; then
		selected_dir="$HOME/$selected_dir"
	fi
else
	# No arguments, generate defaults
	session_name="work-$(date +%Y%m%d-%H%M%S)"
	selected_dir=$(find "${WORK_DIRS[@]}" -maxdepth 2 - type d | \
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

WORK_DIR="$selected_dir"

# replace . with _ in session name
session_name=$(echo "$session_name" | tr . _)

tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $session_name -c "$WORK_DIR"
    exit 0
fi

if ! tmux has-session -t="$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -c "$WORK_DIR"
	tmux select-window -t "$session_name:1"
fi

tmux switch-client -t "$session_name"
