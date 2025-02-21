abbr -a yr 'cal -y'
abbr -a e nvim
abbr -a g git
abbr -a t tmux
abbr -a d docker
abbr -a ga 'git commit --amend'
abbr -a gc 'git checkout'
abbr -a j8 'sudo archlinux-java set java-8-openjdk'
abbr -a j11 'sudo archlinux-java set java-11-openjdk'
abbr -a j17 'sudo archlinux-java set java-17-openjdk'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if status is-interactive
  # Commands to run in interactive sessions can go here
  # add rust toolchain to path, universal, to the front by default
  fish_add_path "$HOME/.cargo/bin"
  fish_add_path "$HOME/.local/bin"
  fish_add_path "/usr/local/go/bin/"
end

