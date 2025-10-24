#!/usr/bin/env bash

session_count=$(tmux list-sessions | wc -l | tr -d ' ')
window_count=$(tmux list-windows | wc -l | tr -d ' ')

if [[ "$window_count" -eq 1 && "$session_count" -gt 1 ]]; then
    current_session=$(tmux display-message -p '#S')
    current_window=$(tmux display-message -p '#I')

    tmux switch-client -n

    tmux kill-window -t "${current_session}:${current_window}"
else
    tmux kill-window
fi
