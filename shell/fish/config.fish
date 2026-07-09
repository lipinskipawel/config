abbr -a yr 'cal -y'
abbr -a e nvim
abbr -a g git
abbr -a t tmux
abbr -a d docker
abbr -a p pnpm

abbr -a ai 'claude --permission-mode auto'

abbr -a ga 'git commit --amend'
abbr -a gc 'git checkout'
abbr -a gpo 'git push origin -u "$(git rev-parse --abbrev-ref HEAD)"'
abbr -a gad 'git add .; git commit --amend'
abbr -a gadp 'git add .; git commit --amend; git push -f'

abbr -a k 'kubectl'
abbr -a ka 'kubectl apply -f'
abbr -a m 'minikube'

abbr -a awslogin 'set -e AWS_PROFILE; aws sso login --sso-session <company-name>'
abbr -a awsdev 'set -e AWS_PROFILE; set -gx AWS_PROFILE dev'
abbr -a awsprod 'set -e AWS_PROFILE; set -gx AWS_PROFILE production'
abbr -a kdev 'set -e AWS_PROFILE; set -gx AWS_PROFILE dev; kubectx <company-name>-dev'

abbr -a kretail 'aws eks update-kubeconfig --name kubernetes --alias <company-name>-dev --region us-east-1'

switch (uname)
	case Linux
		abbr -a j8 'sudo archlinux-java set java-8-openjdk'
		abbr -a j11 'sudo archlinux-java set java-11-openjdk'
		abbr -a j17 'sudo archlinux-java set java-17-openjdk'
	case Darwin
		abbr -a j17 'set -gx JAVA_HOME (/usr/libexec/java_home -v 17)'
		abbr -a j21 'set -gx JAVA_HOME (/usr/libexec/java_home -v 21)'
		abbr -a j25 'set -gx JAVA_HOME (/usr/libexec/java_home -v 25)'
	case '*'
		echo "Unknown system"
end

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Commands to run in interactive sessions can go here
if status is-interactive
  # add rust toolchain to path, universal, to the front by default
  fish_add_path "$HOME/.cargo/bin"
  fish_add_path "$HOME/.local/bin"
  switch (uname)
	  case Linux
		  fish_add_path "/usr/local/go/bin/"
	  case Darwin
		  fish_add_path "/opt/homebrew/bin/"
		  fish_add_path "$HOME/.rd/bin"
		  set -gx JAVA_HOME (/usr/libexec/java_home -v 21)
		  set -Ux DOCKER_HOST unix:///Users/$USER/.rd/docker.sock
		  set -Ux TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
	  case '*'
		  echo "Unknown system"
  end
end

