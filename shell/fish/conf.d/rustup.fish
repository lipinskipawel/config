if status is-interactive
  if not test -d $HOME/.cargo
    echo "Please install rustup"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    echo ""
  else
    if test -e $HOME/.cargo/env.fish
      source "$HOME/.cargo/env.fish"
    end
      fish_add_path "$HOME/.cargo/bin"
  end
end

