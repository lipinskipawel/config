#!/usr/bin/env bash

# Only ever kills the session we're currently attached to
if [[ -z $TMUX ]]; then
	echo "Not inside a tmux session; nothing to close" >&2
fi

current_session=$(tmux display-message -p '#S')

# Interrupt whatever is running in each pane before tearingthe session
# down, kill-session would SIGHUP these processes anyway, but that's an
# abrupt hangup -- Ctrl+C (SIGINT) lets interactive programs stop their
# in-flight work cleanly first. Claude needs a second Ctrl+C to actually
# leave its prompt, so give it the double tap.
while read -r pane cmd; do
	tmux send-keys -t "$pane" C-c
	if [[ $cmd == claude || $cmd == node ]]; then
		sleep 0.2
		tmux send-keys -t "$pane" C-c
	fi
done < <(tmux list-panes -s -t "$current_session" -F '#{pane_id} #{pane_current_command}')

# Let the interrupts land before we pull the session out
sleep 0.2

# If other sessions exist, hop to one first so killing the current
# session doesn't drop us out of tmux
if [[ $(tmux list-sessions | wc -l) -gt 1 ]]; then
	tmux switch-client -n
fi

tmux kill-session -t "$current_session"

# while read -r pane cmd: do
#   Reads one line at a time from the loop's input
#   Each line looks like "%3 node": `read` splits it on
#   whitespace, putting the first field in $pane and the rest in $cmd.
#   -r stops backslashes from being treated as escapes.
#
# tmux send-keys -t "$plane" C-c
#   Types Ctrl+C into the pane identified by $pane (e.g. "%3"),
#   interrupting whatever is running there. -t = target.
#
# done < <(tmux list-panes -s -t "$current_session" -F '#pane_id} #{pane_current_command}')
#   Feeds the loop. tmux prints one line per pane in the session
#   (- = all panes across all windows; -F = output format), e.g.:
#     %1 fish
#     %3 node
#   and that text becomes the loop's standard input.
#
# what is `< <(...)` ?
#   Two separte pieces sitting next ot each other:
#     <(cmd)    "process substitution" -- runs `cmd` and exposes its output
#               as a temporary file path (for example /dev/fd/63).
#     <         plain input redirection -- points hte loop's stdin at that
#               file path, so `read` cosumes the command's output
#   So `done < <(tmux ...)` means: run the tmux command, and feed its
#   output into the while loop as stdin. The space between the two '<'
#   matters; '<<' would be  a heredoc instead.
#
#   Why not the simpler `tmux ... | while read ...`? In a pipeline the
#   while loop runs in a subshell, so any vriables it set would vanish
#   once the loop ends. Process substitution keeps the loop in the
#   current shell, so changes to variables would persist (not needed
#   here, but it's the safe habit).
