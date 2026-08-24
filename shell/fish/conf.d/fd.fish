if status is-interactive
  if not command -q fdfind
    echo "Please install fd-find"
    echo "sudo apt install fd-find"
    echo ""
  else
    if not test -e $HOME/.local/bin/fd
      ln -s (which fdfind) $HOME/.local/bin/fd
      echo "Linked fd -> "(which fdfind)
    end
  end
end

