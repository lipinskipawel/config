if status is-interactive
  test -d $HOME/.pyenv
  set -l IS_INSTALLED $status

  if test $IS_INSTALLED -eq 1
    echo "Please install pyenv"
    echo "git clone https://github.com/pyenv/pyenv.git ~/.pyenv"
    echo ""
  else
    if not set -q PYENV_ROOT
      set -Ux PYENV_ROOT $HOME/.pyenv
    end
    fish_add_path "$PYENV_ROOT/bin"
    pyenv init - | source
  end
end

