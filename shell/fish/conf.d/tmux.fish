if status is-interactive; and not set -q TMUX
  # -A if exists then attach
  # -s with name
  exec tmux new-session -A -s default
  # add `-d` to detached
  # remove `exec` to not start `tmux`
end
