#!/usr/bin/env bash

DIRS=(
	"$HOME/project"
	"$HOME/work"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find "${DIRS[@]}" -mindepth 1 -maxdepth 2 -type d | \
		sed "s|^$HOME/||" | \
		fzf)
    # Add home path back
    if [[ -n "$selected" ]]; then
        selected="$HOME/$selected"
    fi
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# when tmux is not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -ds "$selected_name" -c $selected
	tmux new-window -t "$selected_name" -c $selected
	tmux new-window -t "$selected_name" -c $selected
	tmux select-window -t "$selected_name:1"
	tmux attach -t "$selected_name"
    exit 0
fi

# when tmux is running
if ! tmux has-session -t="$selected_name" 2> /dev/null; then
	tmux new-session -ds "$selected_name" -c $selected
	tmux new-window -t "$selected_name" -c $selected
	tmux new-window -t "$selected_name" -c $selected
	tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
